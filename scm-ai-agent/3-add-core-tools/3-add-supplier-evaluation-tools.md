# Add Supplier Evaluation and Purchase Order Tools

## Introduction

With the agent created and context tools in place from Lab 3, you can now add the tools that drive the actual procurement conversation.

Each tool in this lab represents one step in the procurement journey:

1. **Identify the problem**: scan the warehouse for items at or below their reorder point
2. **Find who can help**: look up active suppliers with a delivery history for that item
3. **Evaluate the options**: pull a performance scorecard for a chosen supplier
4. **Choose a destination**: show which warehouses that supplier has delivered to before
5. **Confirm before acting**: show a browser dialog and wait for the user to approve
6. **Raise the order**: write the planned purchase order to the database and notify the user

All six tools use the **On Demand** execution point, meaning the agent only calls them when the conversation reaches that step. The agent uses the context from Lab 3 (who the user is and which warehouse they belong to) to make every answer specific to the person asking.

Estimated Time: 25 minutes

### Objectives

In this lab, you will:

- Add supplier evaluation tools to identify stock risk, compare suppliers, and review delivery performance

- Add a human confirmation checkpoint before any write action runs

- Add the tool that creates the planned purchase order

### Tools in This Lab

| Tool Name | Type | Execution Point |
| --- | --- | --- |
| `get_stocks_at_risk` | Retrieve Data | On Demand |
| `get_suppliers_for_item` | Retrieve Data | On Demand |
| `get_supplier_delivery_performance` | Retrieve Data | On Demand |
| `show_warehouses_by_supplier` | Retrieve Data | On Demand |
| `confirm_action` | Execute Client-side Code | On Demand |
| `raise_purchase_order` | Execute Server-side Code | On Demand |
{: title="Tools Built in Lab 4"}

## Task 1: Identify Items at Risk in the Warehouse

The procurement conversation starts here. The user opens the assistant and asks what needs attention, and the agent needs a way to answer that question with real data from the warehouse. This tool scans for items that are at or below their reorder point, or already have an open replenishment alert, and returns them ordered by priority. The result gives the user a clear, ranked list of what to act on first.

**Type:** Retrieve Data | **Execution:** On Demand

1. In the **Tools** section, select **Add Tool**.

    ![Select Add Tool from the Procurement Agent page](./images/add-tool2.png " ")

2. Enter/select the following configuration:

    - Under **Identification**:

        - Name: **get\_stocks\_at\_risk**
        - Type: **Retrieve Data**
        - Execution Point: **On Demand**
        - Description: copy and paste the following:

            ```text
            <copy>
            Returns items in the current user's warehouse that are at or below their reorder point, or have an open replenishment alert. Call this when the user asks about stock risk, low stock, or what needs attention. Returns item name, available quantity, reorder point, alert priority, and supplier lead time. Results are ordered by priority then by gap size.
            </copy>
            ```

    ![Filled configuration for the get\_stocks\_at\_risk tool](./images/create-tool2.png " ")

    This tool does not require any parameters.

3. Under **Settings**, for **SQL Query**, copy and paste the following:

    ```sql
    <copy>
    select i.item_id,
           i.item_code,
           i.item_name,
           i.base_uom_code,
           w.warehouse_name,
           nvl(bal.total_available, 0)               as available_quantity,
           p.reorder_point_quantity,
           p.safety_stock_quantity,
           p.reorder_target_quantity,
           p.replenishment_lead_time_days,
           ra.priority_code                          as alert_priority,
           ra.alert_type_code,
           ra.alert_number,
           round((systimestamp - ra.raised_at) * 24) as hours_open
      from scm_item_warehouse_policies p
      join scm_items      i   on i.item_id      = p.item_id
      join scm_warehouses w   on w.warehouse_id = p.warehouse_id
      left join (
           select sl.warehouse_id,
                  ib.item_id,
                  sum(ib.quantity_available) as total_available
             from scm_inventory_balances  ib
             join scm_storage_locations   sl on sl.storage_location_id = ib.storage_location_id
            where ib.stock_status_code = 'AVAILABLE'
            group by sl.warehouse_id, ib.item_id
           ) bal on bal.warehouse_id = p.warehouse_id
                and bal.item_id      = p.item_id
      left join scm_replenishment_alerts ra
             on ra.item_id           = p.item_id
            and ra.warehouse_id      = p.warehouse_id
            and ra.alert_status_code in ('OPEN', 'IN_REVIEW')
            and ra.priority_code     = (
                  select decode(max(decode(ra2.priority_code,
                                    'CRITICAL',4,'HIGH',3,'MEDIUM',2,'LOW',1)),
                                    4,'CRITICAL',3,'HIGH',2,'MEDIUM',1,'LOW')
                    from scm_replenishment_alerts ra2
                   where ra2.item_id           = p.item_id
                     and ra2.warehouse_id      = p.warehouse_id
                     and ra2.alert_status_code in ('OPEN','IN_REVIEW')
                )
     where p.warehouse_id = (
               select default_warehouse_id
                 from scm_application_users
                where lower(user_name) = lower(:APP_USER)
           )
       and p.is_active                    = true
       and p.low_stock_alert_enabled_flag = true
       and ( nvl(bal.total_available, 0) <= nvl(p.reorder_point_quantity, 0)
             or ra.alert_number is not null )
       and not exists (
               select 1
                 from scm_inbound_receipts  por
                 join scm_inbound_receipt_lines porl
                   on porl.inbound_receipt_id = por.inbound_receipt_id
                where por.receipt_source_code  = 'SUPPLIER'
                  and por.receipt_status_code  = 'PLANNED'
                  and por.warehouse_id         = p.warehouse_id
                  and porl.item_id             = p.item_id
                  and por.expected_arrival_at  > systimestamp
           )
    order by decode(ra.priority_code,'CRITICAL',1,'HIGH',2,'MEDIUM',3,'LOW',4,5),
             nvl(p.reorder_point_quantity,0) - nvl(bal.total_available,0) desc
    </copy>
    ```

     And Click **Create**.

    ![Entered SQL for the get\_stocks\_at\_risk tool](./images/create-tool2_sql.png " ")

4. This query uses the following tables:

    | Table | What it provides |
    | --- | --- |
    | `scm_item_warehouse_policies` | Warehouse policy, reorder levels, lead time |
    | `scm_items` | Item identity and unit of measure |
    | `scm_warehouses` | Warehouse context |
    | `scm_inventory_balances` | Available stock quantity |
    | `scm_storage_locations` | Warehouse mapping for balances |
    | `scm_replenishment_alerts` | Open alert priority and age |
    | `scm_application_users` | Default warehouse for the current user |
    | `scm_inbound_receipts` | Excludes items with an existing planned receipt |
    | `scm_inbound_receipt_lines` | Item-level match for the planned receipt check |
    {: title="Tables used by get_stocks_at_risk"}

## Task 2: Find Suppliers for a Selected Item

Once the user picks an at-risk item, the conversation moves to finding who can supply it. Knowing the item is low is only half the answer: the user also needs to know their options before they can take action. This tool returns active suppliers who have a delivery history for the selected item, along with on-time rate and damage rate, so the user can compare at a glance and move toward a decision.

**Type:** Retrieve Data | **Execution:** On Demand

1. On the **Procurement Agent** page, in the **Tools** section, select **Add Tool**.

    ![Select Add Tool to create get\_suppliers\_for\_item](./images/add-tool3.png " ")

2. Enter/select the following configuration:

    - Under **Identification**:

        - Name: **get\_suppliers\_for\_item**
        - Type: **Retrieve Data**
        - Execution Point: **On Demand**
        - Description: copy and paste the following:

            ```text
            <copy>
            Returns active suppliers who have previously supplied the given item. Pass item_id from get_stocks_at_risk. Present only supplier_name, total_receipts, last_received_at, on_time_rate_pct, and damage_rate_pct to the user. Keep supplier_id and partner_site_id internal, as they are needed as parameters for show_warehouses_by_supplier and raise_purchase_order. Results are ordered best performer first.
            </copy>
            ```

    ![Filled configuration for get\_suppliers\_for\_item](./images/tool2-identification.png " ")

3. Under **Parameters** tab, click **Add Parameter** and add the following parameter:

    | Parameter | Description | Data Type | Required |
    | --- | --- | --- | --- |
    | `ITEM_ID` | Selected item identifier. | NUMBER | Yes |
    {: title="get_suppliers_for_item Parameters"}

    ![Tool 4 parameter grid with ITEM\_ID added](./images/tool2-parameter.png " ")

4. Under **Settings**, for **SQL Query**, copy and paste the following:

    ```sql
    <copy>
    select bp.business_partner_id as supplier_id,
           bp.partner_number,
           bp.partner_name       as supplier_name,
           ps.partner_site_id,
           ps.site_code,
           ps.site_name,
           count(distinct ir.inbound_receipt_id) as total_receipts,
           max(ir.actual_arrival_at)             as last_received_at,
           round(
               100 * avg(
                   case
                       when ir.actual_arrival_at  is not null
                        and ir.expected_arrival_at is not null
                        and ir.actual_arrival_at  <= ir.expected_arrival_at
                       then 1 else 0
                   end ), 1 ) as on_time_rate_pct,
           round(
               100 * sum(nvl(irl.damaged_quantity, 0))
                   / nullif(sum(nvl(irl.received_quantity, 0)), 0),
               1 ) as damage_rate_pct
      from scm_business_partners     bp
      join scm_partner_sites         ps
        on ps.business_partner_id = bp.business_partner_id
      join scm_inbound_receipts      ir
        on ir.source_partner_id   = bp.business_partner_id
       and ir.receipt_source_code = 'SUPPLIER'
      join scm_inbound_receipt_lines irl
        on irl.inbound_receipt_id = ir.inbound_receipt_id
       and irl.item_id            = :ITEM_ID
     where bp.partner_type_code   = 'SUPPLIER'
       and bp.partner_status_code = 'ACTIVE'
     group by bp.business_partner_id, bp.partner_number, bp.partner_name,
              ps.partner_site_id, ps.site_code, ps.site_name
     order by on_time_rate_pct desc nulls last,
              damage_rate_pct   asc  nulls last
    </copy>
    ```

    Click **Create**.

    ![Entered SQL for get\_suppliers\_for\_item](./images/tool2-sql.png " ")

5. This query uses the following tables:

    | Table | What it provides |
    | --- | --- |
    | `scm_business_partners` | Supplier identity |
    | `scm_partner_sites` | Supplier site details |
    | `scm_inbound_receipts` | Historical supplier deliveries |
    | `scm_inbound_receipt_lines` | Item-level receipt history and quality data |
    {: title="Tables used by get_suppliers_for_item"}

## Task 3: Evaluate Supplier Delivery Performance

With a shortlist of suppliers in view, the user may want to dig deeper before committing. A supplier summary is useful, but a track record over time is what builds confidence. This tool returns a performance scorecard for a chosen supplier over the last quarter or the last 12 months, covering on-time rate, average delay, dock-to-stock time, and damage rate. It gives the user the evidence they need to recommend one supplier over another.

**Type:** Retrieve Data | **Execution:** On Demand

1. On the **Procurement Agent** page, in the **Tools** section, select **Add Tool**.

    ![Select Add Tool to create get\_supplier\_delivery\_performance](./images/add-tool44.png " ")

2. Enter/select the following configuration:

    - Under **Identification**:

        - Name: **get\_supplier\_delivery\_performance**
        - Type: **Retrieve Data**
        - Execution Point: **On Demand**
        - Description: copy and paste the following:

            ```text
            <copy>
            Returns a detailed delivery performance scorecard for a supplier over a given period. Pass supplier_id from get_suppliers_for_item. Pass TIME_PERIOD as QUARTER for last quarter or YEAR for last 12 months. Call this when the user wants to check a supplier's track record before raising a purchase order. Returns on-time rate, average delay, dock-to-stock time, damage rate, and total volumes.
            </copy>
            ```

    ![Filled configuration for get\_supplier\_delivery\_performance](./images/task3-iden.png " ")

3. Under **Parameters** tab, click **Add Parameter** and add the following parameter:

    | Parameter | Description | Data Type | Required |
    | --- | --- | --- | --- |
    | `TIME_PERIOD` | Reporting horizon such as `QUARTER` or `YEAR`. | VARCHAR2 | Yes |
    | `SUPPLIER_ID` | Selected supplier identifier. | NUMBER | Yes |
    {: title="get_supplier_delivery_performance Parameters"}

    ![Tool 5 parameter grid with SUPPLIER\_ID and TIME\_PERIOD added](./images/task3-param.png " ")

4. Under **Settings**, for **SQL Query**, copy and paste the following:

    ```sql
    <copy>
    select bp.partner_name                                                       as supplier_name,
           count(distinct ir.inbound_receipt_id)                                 as receipt_count,
           round(
               100 * avg(
                   case
                       when ir.actual_arrival_at   is not null
                        and ir.expected_arrival_at is not null
                        and ir.actual_arrival_at  <= ir.expected_arrival_at
                       then 1 else 0
                   end ), 1 )                                                    as on_time_rate_pct,
           round(
               avg(
                   case
                       when ir.actual_arrival_at   is not null
                        and ir.expected_arrival_at is not null
                        and ir.actual_arrival_at  > ir.expected_arrival_at
                       then ( cast(ir.actual_arrival_at   as date)
                            - cast(ir.expected_arrival_at as date) ) * 24
                   end ), 1 )                                                    as avg_delay_hours,
           round(
               avg(
                   case
                       when ir.actual_arrival_at      is not null
                        and ir.receiving_completed_at is not null
                       then ( cast(ir.receiving_completed_at as date)
                            - cast(ir.actual_arrival_at      as date) ) * 24
                   end ), 1 )                                                    as avg_dock_to_stock_hours,
           sum(nvl(irl.received_quantity,  0))                                   as total_received,
           sum(nvl(irl.damaged_quantity,   0))                                   as total_damaged,
           sum(nvl(irl.shortage_quantity,  0))                                   as total_shortage,
           sum(nvl(irl.rejected_quantity,  0))                                   as total_rejected,
           round(
               100 * sum(nvl(irl.damaged_quantity, 0))
                   / nullif(sum(nvl(irl.received_quantity, 0)), 0), 1 )         as damage_rate_pct
      from scm_business_partners     bp
      join scm_inbound_receipts      ir  on ir.source_partner_id   = bp.business_partner_id
                                        and ir.receipt_source_code  = 'SUPPLIER'
      join scm_inbound_receipt_lines irl on irl.inbound_receipt_id  = ir.inbound_receipt_id
     where bp.business_partner_id = :SUPPLIER_ID
       and ir.actual_arrival_at  >= case :TIME_PERIOD
                                        when 'QUARTER' then add_months(trunc(sysdate,'Q'), -3)
                                        when 'YEAR'    then add_months(trunc(sysdate,'YYYY'), -12)
                                        else                add_months(sysdate, -3)
                                    end
       and ir.actual_arrival_at   < sysdate
     group by bp.business_partner_id, bp.partner_name
    </copy>
    ```

    ![Entered SQL for get\_supplier\_delivery\_performance](./images/task3-sql.png " ")

5. Click **Create**.

    ![Procurement Agent with get\_supplier\_delivery\_performance saved](./images/task5-create.png " ")

6. This query uses the following tables:

    | Table | What it provides |
    | --- | --- |
    | `scm_business_partners` | Supplier identity |
    | `scm_inbound_receipts` | Header-level delivery timing |
    | `scm_inbound_receipt_lines` | Quantity, damage, shortage, and rejection data |
    {: title="Tables used by get_supplier_delivery_performance"}

## Task 4: Show Available Warehouses for a Supplier

With a supplier chosen, the conversation turns to where the order should go. A purchase order needs a destination warehouse, but asking the user to type a warehouse ID is a poor experience and prone to error. This tool presents only the warehouses that the chosen supplier has actually delivered to before, giving the user a grounded, relevant list to choose from. The agent waits for the user's selection and uses the matching warehouse ID internally. The user never sees a number.

**Type:** Retrieve Data | **Execution:** On Demand

1. On the **Procurement Agent** page, in the **Tools** section, select **Add Tool**.

    ![Select Add Tool to create show\_warehouses\_by\_supplier](./images/task4-add-tooll.png " ")

2. Enter/select the following configuration:

    - Under **Identification**:

        - Name: **show\_warehouses\_by\_supplier**
        - Type: **Retrieve Data**
        - Execution Point: **On Demand**
        - Description: copy and paste the following:

            ```text
            <copy>
            Returns the list of active warehouses that the given supplier has previously delivered to. Call this when the user asks to raise a purchase order, before calling raise_purchase_order. Present only warehouse_code and warehouse_name to the user. Never show warehouse_id. Ask the user to choose a warehouse by name or code. If the user has already named a warehouse, match it to the correct row and use that row's warehouse_id as WH_ID in raise_purchase_order without asking again. Keep warehouse_id internal.
            </copy>
            ```

    ![Filled configuration for show\_warehouses\_by\_supplier](./images/task4-iden.png " ")

3. Under **Parameters** tab, click **Add Parameter** and add the following parameter:

    | Parameter | Description | Data Type | Required |
    | --- | --- | --- | --- |
    | `SUPPLIER_ID` | Selected supplier identifier. | NUMBER | Yes |
    {: title="show_warehouses_by_supplier Parameters"}

    ![Tool 6 parameter grid with SUPPLIER\_ID added](./images/task4-params.png " ")

4. Under **Settings**, for **SQL Query**, copy and paste the following:

    ```sql
    <copy>
    select w.warehouse_id,
           w.warehouse_code,
           w.warehouse_name,
           count(ir.inbound_receipt_id) as total_deliveries,
           max(ir.actual_arrival_at)    as last_delivered_at
      from scm_warehouses       w
      join scm_inbound_receipts ir on ir.warehouse_id        = w.warehouse_id
                                   and ir.source_partner_id   = :SUPPLIER_ID
                                   and ir.receipt_source_code = 'SUPPLIER'
     where w.warehouse_status_code = 'ACTIVE'
     group by w.warehouse_id, w.warehouse_code, w.warehouse_name
     order by total_deliveries desc, last_delivered_at desc
    </copy>
    ```

    ![Entered SQL for show\_warehouses\_by\_supplier](./images/task4-sql.png " ")

5. Click **Create**.

    ![Procurement Agent with show\_warehouses\_by\_supplier saved](./images/task4-create.png " ")

6. This query uses the following tables:

    | Table | What it provides |
    | --- | --- |
    | `scm_warehouses` | Warehouse identity and status |
    | `scm_inbound_receipts` | Historical supplier deliveries by warehouse |
    {: title="Tables used by show_warehouses_by_supplier"}

## Task 5: Request User Confirmation Before Any Write Action

At this point the agent has gathered everything it needs: the item, the supplier, the warehouse, the quantity, and the due date. Before it writes anything to the database, the user must explicitly approve. This is the human checkpoint that separates a recommendation from an action, a pattern every AI-powered write should follow.

This tool shows a browser confirmation dialog that summarises the full order and waits for the user to click OK or Cancel. If the user cancels, the agent stops and reports back. The purchase order is only raised after this tool returns `"confirmed"`.

**Type:** Execute Client-side Code | **Execution:** On Demand

> **Note:** In an **Execute Client-side Code** tool, `this.data` is a JavaScript object that contains the parameters passed by the agent to this tool call. For example, if the agent calls `confirm_action` with `MESSAGE = "Raise PO for 100 units..."`, then `this.data.MESSAGE` inside the code block holds that string. Any tool parameter can be accessed in this way.

1. On the **Procurement Agent** page, in the **Tools** section, select **Add Tool**.

    ![Select Add Tool to create confirm\_action](./images/task5-add.png " ")

2. Enter/select the following configuration:

    - Under **Identification**:

        - Name: **confirm\_action**
        - Type: **Execute Client-side Code**
        - Execution Point: **On Demand**
        - Description: copy and paste the following:

            ```text
            <copy>
            Shows a browser confirmation dialog with the provided MESSAGE. Returns "confirmed" if the user clicks OK, or "denied" if they cancel. Always call this before raise_purchase_order. Build MESSAGE as a plain-English summary of the full order: item name, quantity, supplier name, warehouse name, due date, and PO owner. If the return value is "denied", stop and report back to the user.
            </copy>
            ```

    ![Filled configuration for confirm\_action](./images/task5-iden.png " ")

3. Under **Parameters** tab, click **Add Parameter** and add the following parameter:

    | Parameter | Description | Data Type | Required |
    | --- | --- | --- | --- |
    | MESSAGE | Confirmation text displayed to the user. | VARCHAR2 | Yes |
    {: title="confirm_action Parameters"}

    ![Tool 7 parameter grid with MESSAGE added](./images/task5-params.png " ")

4. Under **Settings**, for **Code**, copy and paste the following:

    ```javascript
    <copy>
    return new Promise(resolve => {
        apex.message.confirm(this.data.MESSAGE, okPressed => {
            resolve(okPressed ? "confirmed" : "denied");
        });
    });
    </copy>
    ```

    ![Entered JavaScript for confirm\_action](./images/task5-code.png " ")

5. Click **Create**.

    ![Procurement Agent with confirm\_action saved](./images/task5-create.png " ")

## Task 6: Create the Purchase Order and Action the Replenishment Alert

This is where the conversation becomes an action. The user has identified a shortage, chosen a supplier, picked a warehouse, specified a quantity and date, and confirmed. Now the agent executes. This tool writes the planned purchase order to the database, marks the replenishment alert as actioned so it no longer appears as open, and pushes a success notification back to the chat panel, all in a single PL/SQL block.

The agent only calls this tool after all previous steps are complete and `confirm_action` has returned `"confirmed"`.

**Type:** Execute Server-side Code | **Execution:** On Demand

> **Note:** In an **Execute Server-side Code** tool, `apex_ai.set_tool_result` can be called to return a result to the agent and optionally display a notification in the chat UI. The `p_result` parameter contains the text the agent receives to form its reply. The optional `p_notification_message` and `p_notification_type` parameters display a toast notification (`'success'`, `'warning'`, or `'error'`) in the APEX page. Without this call, the agent receives no confirmation that the write operation succeeded.

1. On the **Procurement Agent** page, in the **Tools** section, select **Add Tool**.

    ![Select Add Tool to create raise\_purchase\_order](./images/task6-add.png " ")

2. Enter/select the following configuration:

    - Under **Identification**:

        - Name: **raise\_purchase\_order**
        - Type: **Execute Server-side Code**
        - Execution Point: **On Demand**
        - Description: copy and paste the following:

            ```text
            <copy>
            Creates a planned purchase order as a PLANNED inbound receipt for the given item and supplier. Before calling this tool you must complete these steps in order: 1. Call show_warehouses_by_supplier and ask the user to pick a warehouse. Use their answer as WH_ID. 2. Ask the user how many units they need. Use their answer as QUANTITY. 3. Ask the user when they need delivery by. Use their answer as DUE_DATE in YYYY-MM-DD format. 4. Call confirm_action with a plain-English summary. Pass the exact return value from confirm_action as CONFIRMED. If CONFIRMED is not "confirmed", do not call this tool. Use full_name from get_user_context as the PO owner.
            </copy>
            ```

    ![Filled configuration for raise\_purchase\_order](./images/task6-iden.png " ")

3. Under **Parameters** tab, click **Add Parameter** and add the following parameter:

    | Parameter | Description | Data Type | Required |
    | --- | --- | --- | --- |
    | `CONFIRMED` | Return value from confirm\_action. Must be "confirmed" to proceed. | VARCHAR2 | Yes |
    | `TIMEZONE` | Browser timezone value for due-date conversion. | VARCHAR2 | Yes |
    | `DUE_DATE` | Required delivery date in `YYYY-MM-DD` format. If the user gives a relative expression such as "next Tuesday" or "in two weeks", compute the exact calendar date using today's date and convert it to YYYY-MM-DD before passing. Never pass a natural language string. | VARCHAR2 | Yes |
    | `QUANTITY` | Requested purchase quantity. | NUMBER | Yes |
    | `WH_ID` | Chosen warehouse identifier. | NUMBER | Yes |
    | `SUPPLIER_ID` | Selected supplier identifier. | NUMBER | Yes |
    | `ITEM_ID` | Selected item identifier. | NUMBER | Yes |
    {: title="raise_purchase_order Parameters"}

    ![Tool 8 parameter grid with all purchase-order inputs added](./images/task6-params.png " ")

4. Under **Settings**, for **PL/SQL Code**, copy and paste the following:

    ```plsql
    <copy>
        declare
        v_receipt_number   varchar2(30);
        v_receipt_id       number;
        v_user_id          number;
        v_item_name        varchar2(200);
        v_uom              varchar2(10);
        v_supplier_name    varchar2(200);
        v_warehouse_name   varchar2(200);
        v_seq              number;
        v_due              timestamp with time zone;
        v_receiving_loc_id number;
        begin
        if :CONFIRMED != 'confirmed' then
            apex_ai.set_tool_result(
                p_result => 'Purchase order cancelled. User did not confirm.'
            );
            return;
        end if;

        select application_user_id
            into v_user_id
            from scm_application_users
            where lower(user_name) = lower(:APP_USER);

        select storage_location_id
            into v_receiving_loc_id
            from scm_storage_locations
            where warehouse_id        = :WH_ID
            and location_type_code  = 'RECEIVING'
            and location_status_code = 'ACTIVE'
            and rownum              = 1;

        select item_name, base_uom_code
            into v_item_name, v_uom
            from scm_items
            where item_id = :ITEM_ID;

        select partner_name
            into v_supplier_name
            from scm_business_partners
            where business_partner_id = :SUPPLIER_ID;

        select warehouse_name
            into v_warehouse_name
            from scm_warehouses
            where warehouse_id = :WH_ID;

        select nvl(max(to_number(regexp_substr(receipt_number,'\d+$'))), 0) + 1
            into v_seq
            from scm_inbound_receipts
            where receipt_number like 'POR-%';

        v_receipt_number := 'POR-' || lpad(v_seq, 6, '0');

        v_due := to_timestamp_tz(
                    :DUE_DATE || ' 17:00:00 ' || :TIMEZONE,
                    'YYYY-MM-DD HH24:MI:SS TZR'
                    );

        insert into scm_inbound_receipts (
            receipt_number, receipt_source_code, warehouse_id,
            source_partner_id, receipt_status_code,
            expected_arrival_at, received_by
        ) values (
            v_receipt_number, 'SUPPLIER', :WH_ID,
            :SUPPLIER_ID, 'PLANNED',
            v_due, :APP_USER
        ) returning inbound_receipt_id into v_receipt_id;

        insert into scm_inbound_receipt_lines (
            inbound_receipt_id, line_number, item_id,
            receiving_location_id,
            expected_quantity, received_quantity,
            accepted_quantity, quarantine_quantity,
            damaged_quantity, shortage_quantity,
            overage_quantity, rejected_quantity,
            line_status_code
        ) values (
            v_receipt_id, 1, :ITEM_ID,
            v_receiving_loc_id,
            :QUANTITY, 0,
            0, 0, 0, 0, 0, 0,
            'OPEN'
        );

        update scm_replenishment_alerts
            set alert_status_code   = 'ACTIONED',
                reviewed_at         = systimestamp,
                reviewed_by_user_id = v_user_id
            where item_id             = :ITEM_ID
            and warehouse_id        = :WH_ID
            and alert_status_code  in ('OPEN', 'IN_REVIEW');

        apex_ai.set_tool_result(
            p_result               => 'Purchase order ' || v_receipt_number
                                        || ' raised for '   || v_item_name
                                        || ' - '            || :QUANTITY
                                        || ' '              || v_uom
                                        || ' from '         || v_supplier_name
                                        || ' to '           || v_warehouse_name
                                        || '. Expected delivery '
                                        || to_char(v_due, 'DD-Mon-YYYY') || '.',
            p_notification_message => v_receipt_number || ' raised successfully',
            p_notification_type    => 'success'
        );
        end;
    </copy>
    ```

    ![Entered PL/SQL code for raise\_purchase\_order](./images/task6-code.png " ")

5. Click **Create**.

    ![Procurement Agent with raise\_purchase\_order saved](./images/task6-create.png " ")

6. This PL/SQL block:

    - Creates a planned supplier receipt with a sequential purchase order number
    - Inserts the receipt line for the selected item and quantity
    - Marks the relevant replenishment alert as `ACTIONED`
    - Pushes a success notification back to the chat UI with `apex_ai.set_tool_result`

        | Table | What it does |
        | --- | --- |
        | `scm_inbound_receipts` | Inserts the planned purchase-order header |
        | `scm_inbound_receipt_lines` | Inserts the purchase-order line |
        | `scm_replenishment_alerts` | Marks the alert as actioned |
        | `scm_application_users` | Resolves the current application user |
        | `scm_storage_locations` | Resolves the receiving location for the warehouse |
        | `scm_items` | Resolves item name and UOM |
        | `scm_business_partners` | Resolves supplier name |
        | `scm_warehouses` | Resolves warehouse name |
        {: title="Tables used by raise_purchase_order"}

## Summary

All eight tools are now in place: the two context tools from Lab 3 (`get_user_context` and `get_browser_timezone`) plus the six procurement tools added in this lab. The agent can now identify stock at risk, evaluate suppliers, review delivery performance, confirm the destination warehouse, obtain user confirmation, and raise a purchase order — all through a single guided conversation.

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager, April 2026
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, April 2026