-- Vision CRM sample data.
-- Run after 01_crm_ddl.sql.
-- Includes: lookup/reference data, accounts, contacts, customers,
--   leads, opportunities, pipeline history, quotes, orders,
--   invoices, payments, activities, targets, forecasts,
--   and identity column synchronization.

set define off;

--------------------------------------------------------------------------------
-- Seed segment 1: lookup, reference/master, accounts, contacts, customers.
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Lookup data
--------------------------------------------------------------------------------
insert into crm_lead_types (lead_type_id, code, description) values (1, 'HOT', 'High-priority lead with active buying signals.');
insert into crm_lead_types (lead_type_id, code, description) values (2, 'WARM', 'Qualified lead that requires structured follow-up.');
insert into crm_lead_types (lead_type_id, code, description) values (3, 'COLD', 'Early-stage lead with limited engagement.');
insert into crm_lead_types (lead_type_id, code, description) values (4, 'STRATEGIC', 'Large multi-stakeholder lead with regional impact.');
insert into crm_lead_states (lead_state_id, code, description) values (1, 'NEW', 'Newly captured lead awaiting first touch.');
insert into crm_lead_states (lead_state_id, code, description) values (2, 'IN_PROGRESS', 'Lead is being actively qualified by sales.');
insert into crm_lead_states (lead_state_id, code, description) values (3, 'NURTURING', 'Lead remains in long-cycle follow-up.');
insert into crm_lead_states (lead_state_id, code, description) values (4, 'CONVERTED', 'Lead has been converted to an opportunity.');
insert into crm_lead_states (lead_state_id, code, description) values (5, 'DISQUALIFIED', 'Lead does not qualify for further pursuit.');
insert into crm_lead_sources (lead_source_id, code, description) values (1, 'MARKETING_CAMPAIGN', 'Response sourced from a structured marketing campaign.');
insert into crm_lead_sources (lead_source_id, code, description) values (2, 'PAID_ADVERTISEMENT', 'Paid media, sponsored listing, or advertisement response.');
insert into crm_lead_sources (lead_source_id, code, description) values (3, 'SOCIAL_MEDIA', 'Inbound interest originating from social channels.');
insert into crm_lead_sources (lead_source_id, code, description) values (4, 'DIRECT_WALK_IN', 'In-person walk-in or branch visit inquiry.');
insert into crm_lead_sources (lead_source_id, code, description) values (5, 'WEBSITE_ENQUIRY', 'Website contact or product enquiry form submission.');
insert into crm_lead_sources (lead_source_id, code, description) values (6, 'ONLINE_ENQUIRY', 'Online marketplace or digital enquiry.');
insert into crm_lead_sources (lead_source_id, code, description) values (7, 'OUTBOUND_SALES', 'Outbound prospecting created by the sales team.');
insert into crm_lead_sources (lead_source_id, code, description) values (8, 'EVENT', 'Lead captured from an event, trade show, or field marketing program.');
insert into crm_lead_sources (lead_source_id, code, description) values (9, 'PARTNER_REFERRAL', 'Lead referred through a partner, reseller, or alliance contact.');
insert into crm_lead_sources (lead_source_id, code, description) values (10, 'ANALYST_REFERRAL', 'Lead influenced or referred by an industry analyst or advisor.');
insert into crm_lead_disqualification_reasons (lead_disqual_reason_id, code, description) values (1, 'NO_BUDGET', 'Prospect does not have approved funding.');
insert into crm_lead_disqualification_reasons (lead_disqual_reason_id, code, description) values (2, 'NO_TIMELINE', 'Prospect has no actionable timeline.');
insert into crm_lead_disqualification_reasons (lead_disqual_reason_id, code, description) values (3, 'NO_FIT', 'Use case does not align to the offered solution.');
insert into crm_lead_disqualification_reasons (lead_disqual_reason_id, code, description) values (4, 'COMPETITOR_SELECTED', 'Prospect chose a competing platform.');
insert into crm_lead_disqualification_reasons (lead_disqual_reason_id, code, description) values (5, 'BAD_DATA', 'Lead record is incomplete or invalid.');
insert into crm_opportunity_stages (opportunity_stage_id, code, description, seq_no) values (1, 'PROSPECTING', 'Account and buying team discovery is underway.', 1);
insert into crm_opportunity_stages (opportunity_stage_id, code, description, seq_no) values (2, 'DISCOVERY', 'Business pain points and fit are being validated.', 2);
insert into crm_opportunity_stages (opportunity_stage_id, code, description, seq_no) values (3, 'EVALUATION', 'Solution evaluation and scope alignment are in progress.', 3);
insert into crm_opportunity_stages (opportunity_stage_id, code, description, seq_no) values (4, 'PROPOSAL', 'Commercial proposal or quote has been shared.', 4);
insert into crm_opportunity_stages (opportunity_stage_id, code, description, seq_no) values (5, 'NEGOTIATION', 'Commercial and legal negotiation is active.', 5);
insert into crm_opportunity_stages (opportunity_stage_id, code, description, seq_no) values (6, 'VERBAL_COMMIT', 'Customer has signaled intent to proceed.', 6);
insert into crm_opportunity_stages (opportunity_stage_id, code, description, seq_no) values (7, 'CLOSED_WON', 'Opportunity has been won and booked.', 7);
insert into crm_opportunity_stages (opportunity_stage_id, code, description, seq_no) values (8, 'CLOSED_LOST', 'Opportunity was lost or deferred out of cycle.', 8);
insert into crm_opportunity_categories (opportunity_category_id, code, description) values (1, 'LOW', 'Opportunity value below 50K.');
insert into crm_opportunity_categories (opportunity_category_id, code, description) values (2, 'MEDIUM', 'Opportunity value between 50K and 100K.');
insert into crm_opportunity_categories (opportunity_category_id, code, description) values (3, 'HIGH', 'Opportunity value between 100K and 180K.');
insert into crm_opportunity_categories (opportunity_category_id, code, description) values (4, 'STRATEGIC', 'Opportunity value above 180K or of strategic importance.');
insert into crm_opportunity_close_reasons (opportunity_close_reason_id, code, description, outcome_type) values (1, 'VALUE_CONFIRMED', 'Customer selected the solution after validating value.', 'WON');
insert into crm_opportunity_close_reasons (opportunity_close_reason_id, code, description, outcome_type) values (2, 'EXECUTIVE_APPROVAL', 'Executive approval and business case were secured.', 'WON');
insert into crm_opportunity_close_reasons (opportunity_close_reason_id, code, description, outcome_type) values (3, 'IMPLEMENTATION_PARTNER', 'Implementation and adoption plan accelerated the win.', 'WON');
insert into crm_opportunity_close_reasons (opportunity_close_reason_id, code, description, outcome_type) values (4, 'COMPETITOR_SELECTED', 'Customer selected a competing platform.', 'LOST');
insert into crm_opportunity_close_reasons (opportunity_close_reason_id, code, description, outcome_type) values (5, 'NO_BUDGET', 'Budget was removed or never approved.', 'LOST');
insert into crm_opportunity_close_reasons (opportunity_close_reason_id, code, description, outcome_type) values (6, 'TIMING_DELAY', 'Decision was delayed beyond the planning window.', 'LOST');
insert into crm_opportunity_close_reasons (opportunity_close_reason_id, code, description, outcome_type) values (7, 'SCOPE_MISMATCH', 'Functional requirements exceeded the target offer.', 'LOST');
insert into crm_quote_statuses (quote_status_id, code, description, seq_no) values (1, 'DRAFT', 'Quote is being prepared internally.', 1);
insert into crm_quote_statuses (quote_status_id, code, description, seq_no) values (2, 'SENT', 'Quote has been shared with the customer.', 2);
insert into crm_quote_statuses (quote_status_id, code, description, seq_no) values (3, 'ACCEPTED', 'Quote has been accepted by the customer.', 3);
insert into crm_quote_statuses (quote_status_id, code, description, seq_no) values (4, 'REJECTED', 'Quote was declined or superseded.', 4);
insert into crm_quote_statuses (quote_status_id, code, description, seq_no) values (5, 'EXPIRED', 'Quote expired before customer acceptance.', 5);
insert into crm_customer_statuses (customer_status_id, code, description) values (1, 'ONBOARDING', 'Customer is in implementation or onboarding.');
insert into crm_customer_statuses (customer_status_id, code, description) values (2, 'ACTIVE', 'Customer relationship is active and healthy.');
insert into crm_customer_statuses (customer_status_id, code, description) values (3, 'AT_RISK', 'Customer relationship requires intervention.');
insert into crm_customer_statuses (customer_status_id, code, description) values (4, 'INACTIVE', 'Customer has no active recurring engagement.');
insert into crm_customer_priorities (customer_priority_id, code, description) values (1, 'STRATEGIC', 'Regional strategic customer with executive visibility.');
insert into crm_customer_priorities (customer_priority_id, code, description) values (2, 'HIGH', 'High-touch customer with significant revenue potential.');
insert into crm_customer_priorities (customer_priority_id, code, description) values (3, 'MEDIUM', 'Standard commercial priority.');
insert into crm_customer_priorities (customer_priority_id, code, description) values (4, 'LOW', 'Low-touch customer with smaller footprint.');
insert into crm_account_relationship_statuses (account_relationship_status_id, code, description) values (1, 'PROSPECT', 'Account is active in pipeline but not yet a customer.');
insert into crm_account_relationship_statuses (account_relationship_status_id, code, description) values (2, 'ACTIVE_CUSTOMER', 'Account has an active or onboarding customer relationship.');
insert into crm_account_relationship_statuses (account_relationship_status_id, code, description) values (3, 'AT_RISK_CUSTOMER', 'Account is a customer with elevated retention risk.');
insert into crm_account_relationship_statuses (account_relationship_status_id, code, description) values (4, 'INACTIVE_CUSTOMER', 'Account is a customer with no active commercial motion.');
insert into crm_activity_types (activity_type_id, code, description, seq_no) values (1, 'CALL', 'Phone or voice call with customer or prospect.', 1);
insert into crm_activity_types (activity_type_id, code, description, seq_no) values (2, 'MEETING', 'Scheduled meeting, workshop, or review session.', 2);
insert into crm_activity_types (activity_type_id, code, description, seq_no) values (3, 'EMAIL', 'Email communication or follow-up.', 3);
insert into crm_activity_types (activity_type_id, code, description, seq_no) values (4, 'TASK', 'Internal or external follow-up task.', 4);
insert into crm_activity_types (activity_type_id, code, description, seq_no) values (5, 'NOTE', 'Ad hoc note or internal commentary.', 5);
insert into crm_activity_types (activity_type_id, code, description, seq_no) values (6, 'FEEDBACK', 'Customer or stakeholder feedback capture.', 6);
insert into crm_activity_statuses (activity_status_id, code, description, seq_no) values (1, 'PLANNED', 'Activity is scheduled and open.', 1);
insert into crm_activity_statuses (activity_status_id, code, description, seq_no) values (2, 'COMPLETED', 'Activity was completed successfully.', 2);
insert into crm_activity_statuses (activity_status_id, code, description, seq_no) values (3, 'CANCELED', 'Activity was canceled before completion.', 3);
insert into crm_activity_statuses (activity_status_id, code, description, seq_no) values (4, 'OVERDUE', 'Activity due date passed without completion.', 4);
insert into crm_activity_outcomes (activity_outcome_id, code, description) values (1, 'CONNECTED', 'Stakeholder was reached and engaged.');
insert into crm_activity_outcomes (activity_outcome_id, code, description) values (2, 'LEFT_VOICEMAIL', 'Voice message was left for follow-up.');
insert into crm_activity_outcomes (activity_outcome_id, code, description) values (3, 'FOLLOW_UP_REQUIRED', 'Further follow-up was committed.');
insert into crm_activity_outcomes (activity_outcome_id, code, description) values (4, 'POSITIVE_RESPONSE', 'Customer response was positive.');
insert into crm_activity_outcomes (activity_outcome_id, code, description) values (5, 'NEGATIVE_RESPONSE', 'Customer response was negative.');
insert into crm_activity_outcomes (activity_outcome_id, code, description) values (6, 'DECISION_PENDING', 'Customer deferred the decision to a later checkpoint.');
insert into crm_contact_roles (contact_role_id, code, description) values (1, 'DECISION_MAKER', 'Executive or business decision maker.');
insert into crm_contact_roles (contact_role_id, code, description) values (2, 'CHAMPION', 'Internal advocate driving the evaluation.');
insert into crm_contact_roles (contact_role_id, code, description) values (3, 'TECHNICAL_EVALUATOR', 'Technical reviewer or systems architect.');
insert into crm_contact_roles (contact_role_id, code, description) values (4, 'PROCUREMENT', 'Commercial or procurement stakeholder.');
insert into crm_contact_roles (contact_role_id, code, description) values (5, 'BILLING_CONTACT', 'Finance or billing contact for invoicing.');
insert into crm_contact_roles (contact_role_id, code, description) values (6, 'OPERATIONS_CONTACT', 'Operations contact for delivery and adoption.');
insert into crm_contact_roles (contact_role_id, code, description) values (7, 'INFLUENCER', 'Influences evaluation, adoption, or internal consensus.');
insert into crm_contact_channels (contact_channel_id, code, description) values (1, 'EMAIL', 'Email outreach and follow-up communication.');
insert into crm_contact_channels (contact_channel_id, code, description) values (2, 'PHONE', 'Voice call or direct phone outreach.');
insert into crm_contact_channels (contact_channel_id, code, description) values (3, 'SMS', 'Short text updates for time-sensitive follow-up.');
insert into crm_contact_channels (contact_channel_id, code, description) values (4, 'WHATSAPP', 'Messaging via WhatsApp for mobile-first contacts.');
insert into crm_contact_channels (contact_channel_id, code, description) values (5, 'VIDEO_CONFERENCE', 'Scheduled virtual meetings and reviews.');
insert into crm_contact_channels (contact_channel_id, code, description) values (6, 'CUSTOMER_PORTAL', 'Portal notifications and secure billing or support follow-up.');
insert into crm_approval_statuses (approval_status_id, code, description, seq_no) values (1, 'REQUESTED', 'Approval has been requested and is pending review.', 1);
insert into crm_approval_statuses (approval_status_id, code, description, seq_no) values (2, 'APPROVED', 'Approval request was approved.', 2);
insert into crm_approval_statuses (approval_status_id, code, description, seq_no) values (3, 'REJECTED', 'Approval request was rejected.', 3);
insert into crm_approval_statuses (approval_status_id, code, description, seq_no) values (4, 'RETURNED', 'Approval request was returned for rework.', 4);
insert into crm_approval_statuses (approval_status_id, code, description, seq_no) values (5, 'ESCALATED', 'Approval request was escalated to a higher authority.', 5);
insert into crm_payment_modes (payment_mode_id, code, description) values (1, 'ACH', 'Automated Clearing House transfer.');
insert into crm_payment_modes (payment_mode_id, code, description) values (2, 'WIRE_TRANSFER', 'Domestic or international bank wire.');
insert into crm_payment_modes (payment_mode_id, code, description) values (3, 'CREDIT_CARD', 'Credit card settlement.');
insert into crm_payment_modes (payment_mode_id, code, description) values (4, 'CHECK', 'Physical check.');
insert into crm_payment_modes (payment_mode_id, code, description) values (5, 'EFT', 'Electronic funds transfer commonly used in Canada.');
insert into crm_payment_statuses (payment_status_id, code, description) values (1, 'PENDING', 'Payment is initiated but not yet settled.');
insert into crm_payment_statuses (payment_status_id, code, description) values (2, 'PAID', 'Payment settled successfully.');
insert into crm_payment_statuses (payment_status_id, code, description) values (3, 'FAILED', 'Payment failed during processing.');
insert into crm_payment_statuses (payment_status_id, code, description) values (4, 'REVERSED', 'Payment was reversed or disputed.');
insert into crm_order_statuses (order_status_id, code, description, seq_no) values (1, 'DRAFT', 'Order is being prepared internally.', 1);
insert into crm_order_statuses (order_status_id, code, description, seq_no) values (2, 'PENDING_APPROVAL', 'Order requires approval before confirmation.', 2);
insert into crm_order_statuses (order_status_id, code, description, seq_no) values (3, 'CONFIRMED', 'Order is confirmed and scheduled for delivery.', 3);
insert into crm_order_statuses (order_status_id, code, description, seq_no) values (4, 'DELIVERED', 'Order has been delivered or fully booked.', 4);
insert into crm_order_statuses (order_status_id, code, description, seq_no) values (5, 'CANCELED', 'Order was canceled before completion.', 5);
insert into crm_invoice_statuses (invoice_status_id, code, description, seq_no) values (1, 'DRAFT', 'Invoice is prepared but not yet issued.', 1);
insert into crm_invoice_statuses (invoice_status_id, code, description, seq_no) values (2, 'ISSUED', 'Invoice has been issued and awaits payment.', 2);
insert into crm_invoice_statuses (invoice_status_id, code, description, seq_no) values (3, 'PARTIALLY_PAID', 'Invoice has been partially paid.', 3);
insert into crm_invoice_statuses (invoice_status_id, code, description, seq_no) values (4, 'PAID', 'Invoice is fully settled.', 4);
insert into crm_invoice_statuses (invoice_status_id, code, description, seq_no) values (5, 'OVERDUE', 'Invoice due date has passed with balance outstanding.', 5);
insert into crm_invoice_statuses (invoice_status_id, code, description, seq_no) values (6, 'CANCELED', 'Invoice was canceled or voided.', 6);
insert into crm_forecast_categories (forecast_category_id, code, description, seq_no) values (1, 'PIPELINE', 'All open pipeline value.', 1);
insert into crm_forecast_categories (forecast_category_id, code, description, seq_no) values (2, 'BEST_CASE', 'Most optimistic forecast within the planning window.', 2);
insert into crm_forecast_categories (forecast_category_id, code, description, seq_no) values (3, 'COMMIT', 'Manager-committed forecast.', 3);
insert into crm_forecast_categories (forecast_category_id, code, description, seq_no) values (4, 'CLOSED', 'Closed business already booked in period.', 4);
insert into crm_order_sources (order_source_id, code, description) values (1, 'QUOTE', 'Order converted from an accepted quote.');
insert into crm_order_sources (order_source_id, code, description) values (2, 'DIRECT_ENTRY', 'Order created directly by sales or operations.');
insert into crm_order_sources (order_source_id, code, description) values (3, 'REPEAT_ORDER', 'Order generated from repeat business.');
insert into crm_order_sources (order_source_id, code, description) values (4, 'RENEWAL', 'Order generated from renewal motion.');

--------------------------------------------------------------------------------
-- Reference and master data
--------------------------------------------------------------------------------
insert into crm_regions (region_id, code, name) values (1, 'NA', 'North America');

insert into crm_branches (branch_id, code, name, city, state, region_id) values (1, 'NA-NYC', 'New York Enterprise Hub', 'New York', 'New York', 1);
insert into crm_branches (branch_id, code, name, city, state, region_id) values (2, 'NA-CHI', 'Chicago Central Office', 'Chicago', 'Illinois', 1);
insert into crm_branches (branch_id, code, name, city, state, region_id) values (3, 'NA-DAL', 'Dallas Growth Center', 'Dallas', 'Texas', 1);
insert into crm_branches (branch_id, code, name, city, state, region_id) values (4, 'NA-SFO', 'San Francisco West Coast Office', 'San Francisco', 'California', 1);
insert into crm_branches (branch_id, code, name, city, state, region_id) values (5, 'NA-TOR', 'Toronto Canada Office', 'Toronto', 'Ontario', 1);
insert into crm_branches (branch_id, code, name, city, state, region_id) values (6, 'NA-VAN', 'Vancouver Pacific Office', 'Vancouver', 'British Columbia', 1);
insert into crm_branches (branch_id, code, name, city, state, region_id) values (7, 'NA-MEX', 'Mexico City Commercial Office', 'Mexico City', 'Ciudad de Mexico', 1);

insert into crm_roles (role_id, code, name) values (1, 'CRM_ADMIN', 'CRM Administrator');
insert into crm_roles (role_id, code, name) values (2, 'REGIONAL_VP', 'Regional Vice President');
insert into crm_roles (role_id, code, name) values (3, 'BRANCH_MANAGER', 'Branch Manager');
insert into crm_roles (role_id, code, name) values (4, 'SALES_REP', 'Sales Representative');
insert into crm_roles (role_id, code, name) values (5, 'FINANCE_ANALYST', 'Finance Analyst');
insert into crm_roles (role_id, code, name) values (6, 'FINANCE_MANAGER', 'Finance Manager');
insert into crm_roles (role_id, code, name) values (7, 'OPERATIONS_COORDINATOR', 'Operations Coordinator');
insert into crm_roles (role_id, code, name) values (8, 'OPERATIONS_MANAGER', 'Operations Manager');
insert into crm_roles (role_id, code, name) values (9, 'CUSTOMER_SUCCESS_MANAGER', 'Customer Success Manager');

insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (1, 'crm.admin.na', 'crm.admin.na@apexcrm.example', '+1-212-555-0100', 1, 1, null, null);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (2, 'na.regional.vp', 'na.regional.vp@apexcrm.example', '+1-212-555-0101', 2, 1, null, 1);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (3, 'na.finance.director', 'na.finance.director@apexcrm.example', '+1-212-555-0102', 6, 1, null, 1);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (4, 'na.operations.director', 'na.operations.director@apexcrm.example', '+1-212-555-0103', 8, 1, null, 1);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (5, 'na.customer.success', 'na.customer.success@apexcrm.example', '+1-212-555-0104', 9, 1, null, 2);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (101, 'nyc.branch.manager', 'nyc.branch.manager@apexcrm.example', '+1-800-555-0101', 3, 1, 1, 2);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (201, 'nyc.sales.1', 'nyc.sales.1@apexcrm.example', '+1-800-556-0201', 4, 1, 1, 101);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (202, 'nyc.sales.2', 'nyc.sales.2@apexcrm.example', '+1-800-556-0202', 4, 1, 1, 101);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (203, 'nyc.sales.3', 'nyc.sales.3@apexcrm.example', '+1-800-556-0203', 4, 1, 1, 101);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (204, 'nyc.sales.4', 'nyc.sales.4@apexcrm.example', '+1-800-556-0204', 4, 1, 1, 101);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (205, 'nyc.sales.5', 'nyc.sales.5@apexcrm.example', '+1-800-556-0205', 4, 1, 1, 101);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (301, 'nyc.finance', 'nyc.finance@apexcrm.example', '+1-800-557-0301', 5, 1, 1, 3);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (401, 'nyc.operations', 'nyc.operations@apexcrm.example', '+1-800-558-0401', 7, 1, 1, 4);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (102, 'chi.branch.manager', 'chi.branch.manager@apexcrm.example', '+1-800-555-0102', 3, 1, 2, 2);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (206, 'chi.sales.1', 'chi.sales.1@apexcrm.example', '+1-800-556-0206', 4, 1, 2, 102);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (207, 'chi.sales.2', 'chi.sales.2@apexcrm.example', '+1-800-556-0207', 4, 1, 2, 102);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (208, 'chi.sales.3', 'chi.sales.3@apexcrm.example', '+1-800-556-0208', 4, 1, 2, 102);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (209, 'chi.sales.4', 'chi.sales.4@apexcrm.example', '+1-800-556-0209', 4, 1, 2, 102);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (210, 'chi.sales.5', 'chi.sales.5@apexcrm.example', '+1-800-556-0210', 4, 1, 2, 102);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (302, 'chi.finance', 'chi.finance@apexcrm.example', '+1-800-557-0302', 5, 1, 2, 3);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (402, 'chi.operations', 'chi.operations@apexcrm.example', '+1-800-558-0402', 7, 1, 2, 4);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (103, 'dal.branch.manager', 'dal.branch.manager@apexcrm.example', '+1-800-555-0103', 3, 1, 3, 2);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (211, 'dal.sales.1', 'dal.sales.1@apexcrm.example', '+1-800-556-0211', 4, 1, 3, 103);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (212, 'dal.sales.2', 'dal.sales.2@apexcrm.example', '+1-800-556-0212', 4, 1, 3, 103);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (213, 'dal.sales.3', 'dal.sales.3@apexcrm.example', '+1-800-556-0213', 4, 1, 3, 103);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (214, 'dal.sales.4', 'dal.sales.4@apexcrm.example', '+1-800-556-0214', 4, 1, 3, 103);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (215, 'dal.sales.5', 'dal.sales.5@apexcrm.example', '+1-800-556-0215', 4, 1, 3, 103);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (303, 'dal.finance', 'dal.finance@apexcrm.example', '+1-800-557-0303', 5, 1, 3, 3);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (403, 'dal.operations', 'dal.operations@apexcrm.example', '+1-800-558-0403', 7, 1, 3, 4);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (104, 'sfo.branch.manager', 'sfo.branch.manager@apexcrm.example', '+1-800-555-0104', 3, 1, 4, 2);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (216, 'sfo.sales.1', 'sfo.sales.1@apexcrm.example', '+1-800-556-0216', 4, 1, 4, 104);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (217, 'sfo.sales.2', 'sfo.sales.2@apexcrm.example', '+1-800-556-0217', 4, 1, 4, 104);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (218, 'sfo.sales.3', 'sfo.sales.3@apexcrm.example', '+1-800-556-0218', 4, 1, 4, 104);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (219, 'sfo.sales.4', 'sfo.sales.4@apexcrm.example', '+1-800-556-0219', 4, 1, 4, 104);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (220, 'sfo.sales.5', 'sfo.sales.5@apexcrm.example', '+1-800-556-0220', 4, 1, 4, 104);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (304, 'sfo.finance', 'sfo.finance@apexcrm.example', '+1-800-557-0304', 5, 1, 4, 3);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (404, 'sfo.operations', 'sfo.operations@apexcrm.example', '+1-800-558-0404', 7, 1, 4, 4);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (105, 'tor.branch.manager', 'tor.branch.manager@apexcrm.example', '+1-800-555-0105', 3, 1, 5, 2);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (221, 'tor.sales.1', 'tor.sales.1@apexcrm.example', '+1-800-556-0221', 4, 1, 5, 105);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (222, 'tor.sales.2', 'tor.sales.2@apexcrm.example', '+1-800-556-0222', 4, 1, 5, 105);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (223, 'tor.sales.3', 'tor.sales.3@apexcrm.example', '+1-800-556-0223', 4, 1, 5, 105);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (224, 'tor.sales.4', 'tor.sales.4@apexcrm.example', '+1-800-556-0224', 4, 1, 5, 105);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (225, 'tor.sales.5', 'tor.sales.5@apexcrm.example', '+1-800-556-0225', 4, 1, 5, 105);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (305, 'tor.finance', 'tor.finance@apexcrm.example', '+1-800-557-0305', 5, 1, 5, 3);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (405, 'tor.operations', 'tor.operations@apexcrm.example', '+1-800-558-0405', 7, 1, 5, 4);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (106, 'van.branch.manager', 'van.branch.manager@apexcrm.example', '+1-800-555-0106', 3, 1, 6, 2);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (226, 'van.sales.1', 'van.sales.1@apexcrm.example', '+1-800-556-0226', 4, 1, 6, 106);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (227, 'van.sales.2', 'van.sales.2@apexcrm.example', '+1-800-556-0227', 4, 1, 6, 106);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (228, 'van.sales.3', 'van.sales.3@apexcrm.example', '+1-800-556-0228', 4, 1, 6, 106);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (229, 'van.sales.4', 'van.sales.4@apexcrm.example', '+1-800-556-0229', 4, 1, 6, 106);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (230, 'van.sales.5', 'van.sales.5@apexcrm.example', '+1-800-556-0230', 4, 1, 6, 106);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (306, 'van.finance', 'van.finance@apexcrm.example', '+1-800-557-0306', 5, 1, 6, 3);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (406, 'van.operations', 'van.operations@apexcrm.example', '+1-800-558-0406', 7, 1, 6, 4);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (107, 'mex.branch.manager', 'mex.branch.manager@apexcrm.example', '+1-800-555-0107', 3, 1, 7, 2);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (231, 'mex.sales.1', 'mex.sales.1@apexcrm.example', '+1-800-556-0231', 4, 1, 7, 107);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (232, 'mex.sales.2', 'mex.sales.2@apexcrm.example', '+1-800-556-0232', 4, 1, 7, 107);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (233, 'mex.sales.3', 'mex.sales.3@apexcrm.example', '+1-800-556-0233', 4, 1, 7, 107);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (234, 'mex.sales.4', 'mex.sales.4@apexcrm.example', '+1-800-556-0234', 4, 1, 7, 107);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (235, 'mex.sales.5', 'mex.sales.5@apexcrm.example', '+1-800-556-0235', 4, 1, 7, 107);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (307, 'mex.finance', 'mex.finance@apexcrm.example', '+1-800-557-0307', 5, 1, 7, 3);
insert into crm_users (user_id, username, email, phone, role_id, region_id, branch_id, supervisor_user_id) values (407, 'mex.operations', 'mex.operations@apexcrm.example', '+1-800-558-0407', 7, 1, 7, 4);

insert into crm_industries (industry_id, code, name) values (1, 'MFG', 'Manufacturing');
insert into crm_industries (industry_id, code, name) values (2, 'RET', 'Retail');
insert into crm_industries (industry_id, code, name) values (3, 'HC', 'Healthcare');
insert into crm_industries (industry_id, code, name) values (4, 'TECH', 'Technology');
insert into crm_industries (industry_id, code, name) values (5, 'FIN', 'Financial Services');
insert into crm_industries (industry_id, code, name) values (6, 'LOG', 'Logistics');
insert into crm_industries (industry_id, code, name) values (7, 'EDU', 'Education');
insert into crm_industries (industry_id, code, name) values (8, 'ENG', 'Energy');
insert into crm_industries (industry_id, code, name) values (9, 'TEL', 'Telecommunications');
insert into crm_industries (industry_id, code, name) values (10, 'PUB', 'Public Sector');
insert into crm_industries (industry_id, code, name) values (11, 'FOOD', 'Food and Beverage');
insert into crm_industries (industry_id, code, name) values (12, 'AUTO', 'Automotive');

insert into crm_product_types (product_type_id, code, name) values (1, 'PLATFORM', 'CRM Platform');
insert into crm_product_types (product_type_id, code, name) values (2, 'ANALYTICS', 'Analytics and Intelligence');
insert into crm_product_types (product_type_id, code, name) values (3, 'INTEGRATION', 'Integration and Connectivity');
insert into crm_product_types (product_type_id, code, name) values (4, 'SERVICES', 'Professional Services');
insert into crm_product_types (product_type_id, code, name) values (5, 'SUPPORT', 'Support and Success');
insert into crm_product_types (product_type_id, code, name) values (6, 'TRAINING', 'Training and Enablement');

insert into crm_products (product_id, code, name, product_type_id, description) values (1, 'CRM-ESSENTIALS', 'CRM Essentials', 1, 'Core CRM platform for midsize sales teams.');
insert into crm_products (product_id, code, name, product_type_id, description) values (2, 'CRM-GROWTH', 'CRM Growth', 1, 'Expanded CRM platform with automation and scoring.');
insert into crm_products (product_id, code, name, product_type_id, description) values (3, 'CRM-ENTERPRISE', 'CRM Enterprise', 1, 'Enterprise CRM platform with governance and scale.');
insert into crm_products (product_id, code, name, product_type_id, description) values (4, 'PIPELINE-ANALYTICS', 'Pipeline Analytics', 2, 'Pipeline inspection and revenue analytics.');
insert into crm_products (product_id, code, name, product_type_id, description) values (5, 'REV-INTELLIGENCE', 'Revenue Intelligence', 2, 'Forecast and deal intelligence workspace.');
insert into crm_products (product_id, code, name, product_type_id, description) values (6, 'EXEC-DASHBOARD', 'Executive Dashboard', 2, 'Executive reporting and KPI insights.');
insert into crm_products (product_id, code, name, product_type_id, description) values (7, 'INTEGRATION-HUB', 'Integration Hub', 3, 'Prebuilt integrations for ERP and marketing systems.');
insert into crm_products (product_id, code, name, product_type_id, description) values (8, 'DATA-SYNC', 'Data Sync Connector', 3, 'Operational data synchronization package.');
insert into crm_products (product_id, code, name, product_type_id, description) values (9, 'PARTNER-PORTAL', 'Partner Portal', 3, 'Partner and distributor collaboration workspace.');
insert into crm_products (product_id, code, name, product_type_id, description) values (10, 'IMPLEMENT-SPRINT', 'Implementation Sprint', 4, 'Implementation and rollout sprint.');
insert into crm_products (product_id, code, name, product_type_id, description) values (11, 'DATA-MIGRATION', 'Data Migration Pack', 4, 'Legacy data migration service package.');
insert into crm_products (product_id, code, name, product_type_id, description) values (12, 'PROCESS-DESIGN', 'Process Design Workshop', 4, 'Commercial process mapping and design workshop.');
insert into crm_products (product_id, code, name, product_type_id, description) values (13, 'SUPPORT-GOLD', 'Support Gold', 5, 'Enhanced support package with faster SLA.');
insert into crm_products (product_id, code, name, product_type_id, description) values (14, 'SUPPORT-PLAT', 'Support Platinum', 5, 'Premium support with named technical advisor.');
insert into crm_products (product_id, code, name, product_type_id, description) values (15, 'SUCCESS-RETAINER', 'Success Retainer', 5, 'Recurring customer success advisory retainer.');
insert into crm_products (product_id, code, name, product_type_id, description) values (16, 'ADMIN-BOOTCAMP', 'Admin Training Bootcamp', 6, 'Administrator training and certification.');
insert into crm_products (product_id, code, name, product_type_id, description) values (17, 'SALES-ACADEMY', 'Sales Enablement Academy', 6, 'Sales team enablement and best practices training.');
insert into crm_products (product_id, code, name, product_type_id, description) values (18, 'CS-CERT', 'Customer Success Certification', 6, 'Customer success team certification program.');

insert into crm_approval_rules (approval_rule_id, rule_name, entity_type, branch_id, region_id, min_amount, max_amount, approver_role_id, escalate_role_id, response_due_hours, seq_no) values (1, 'Quote local approval under 75K', 'QUOTE', null, 1, 0, 75000, 3, 6, 24, 1);
insert into crm_approval_rules (approval_rule_id, rule_name, entity_type, branch_id, region_id, min_amount, max_amount, approver_role_id, escalate_role_id, response_due_hours, seq_no) values (2, 'Quote finance approval 75K to 150K', 'QUOTE', null, 1, 75000.01, 150000, 6, 2, 16, 2);
insert into crm_approval_rules (approval_rule_id, rule_name, entity_type, branch_id, region_id, min_amount, max_amount, approver_role_id, escalate_role_id, response_due_hours, seq_no) values (3, 'Quote executive approval above 150K', 'QUOTE', null, 1, 150000.01, null, 2, null, 8, 3);
insert into crm_approval_rules (approval_rule_id, rule_name, entity_type, branch_id, region_id, min_amount, max_amount, approver_role_id, escalate_role_id, response_due_hours, seq_no) values (4, 'Order local approval under 100K', 'ORDER', null, 1, 0, 100000, 3, 6, 24, 1);
insert into crm_approval_rules (approval_rule_id, rule_name, entity_type, branch_id, region_id, min_amount, max_amount, approver_role_id, escalate_role_id, response_due_hours, seq_no) values (5, 'Order finance approval 100K to 250K', 'ORDER', null, 1, 100000.01, 250000, 6, 2, 16, 2);
insert into crm_approval_rules (approval_rule_id, rule_name, entity_type, branch_id, region_id, min_amount, max_amount, approver_role_id, escalate_role_id, response_due_hours, seq_no) values (6, 'Order executive approval above 250K', 'ORDER', null, 1, 250000.01, null, 2, null, 8, 3);
insert into crm_approval_rules (approval_rule_id, rule_name, entity_type, branch_id, region_id, min_amount, max_amount, approver_role_id, escalate_role_id, response_due_hours, seq_no) values (7, 'Mexico quote local approval under 65K', 'QUOTE', 7, null, 0, 65000, 3, 6, 18, 1);
insert into crm_approval_rules (approval_rule_id, rule_name, entity_type, branch_id, region_id, min_amount, max_amount, approver_role_id, escalate_role_id, response_due_hours, seq_no) values (8, 'Mexico order local approval under 85K', 'ORDER', 7, null, 0, 85000, 3, 6, 18, 1);

insert into crm_duplicate_match_rules (match_rule_id, entity_name, rule_name, match_attributes, threshold_pct) values (1, 'ACCOUNT', 'Account name and website exact match', 'NAME,WEBSITE', 95);
insert into crm_duplicate_match_rules (match_rule_id, entity_name, rule_name, match_attributes, threshold_pct) values (2, 'ACCOUNT', 'Account name plus geography fuzzy match', 'NAME,CITY,STATE', 88);
insert into crm_duplicate_match_rules (match_rule_id, entity_name, rule_name, match_attributes, threshold_pct) values (3, 'CONTACT', 'Contact email exact match', 'EMAIL', 100);
insert into crm_duplicate_match_rules (match_rule_id, entity_name, rule_name, match_attributes, threshold_pct) values (4, 'CONTACT', 'Contact identity plus account match', 'NAME,ACCOUNT_ID,PHONE', 86);
insert into crm_duplicate_match_rules (match_rule_id, entity_name, rule_name, match_attributes, threshold_pct) values (5, 'CUSTOMER', 'Customer legal name and billing address', 'NAME,BILLING_ADDRESS', 90);
insert into crm_duplicate_match_rules (match_rule_id, entity_name, rule_name, match_attributes, threshold_pct) values (6, 'CUSTOMER', 'Customer account and website alignment', 'ACCOUNT_ID,WEBSITE', 92);

insert into crm_access_rules (access_rule_id, rule_name, entity_name, role_id, access_scope_code, can_view, can_create, can_update, can_delete, can_approve)
with entity_scope as (
    select 'ACCOUNT' entity_name from dual union all
    select 'CONTACT' from dual union all
    select 'LEAD' from dual union all
    select 'OPPORTUNITY' from dual union all
    select 'CUSTOMER' from dual union all
    select 'QUOTE' from dual union all
    select 'ORDER' from dual union all
    select 'INVOICE' from dual union all
    select 'PAYMENT' from dual union all
    select 'ACTIVITY' from dual union all
    select 'TARGET' from dual union all
    select 'FORECAST' from dual union all
    select 'SETUP' from dual
),
role_matrix as (
    select r.role_id,
           r.code role_code,
           e.entity_name,
           case
               when r.role_id = 1 then 'ALL'
               when r.role_id in (2, 6) then 'REGION'
               when r.role_id in (3, 5, 8) then 'BRANCH'
               when r.role_id in (4, 9) then 'OWNED'
               else 'ASSIGNED'
           end access_scope_code
    from crm_roles r
    join entity_scope e
      on (
           r.role_id = 1
        or (r.role_id in (2, 3) and e.entity_name in ('ACCOUNT', 'CONTACT', 'LEAD', 'OPPORTUNITY', 'CUSTOMER', 'QUOTE', 'ORDER', 'ACTIVITY', 'TARGET', 'FORECAST'))
        or (r.role_id = 4 and e.entity_name in ('ACCOUNT', 'CONTACT', 'LEAD', 'OPPORTUNITY', 'CUSTOMER', 'QUOTE', 'ORDER', 'ACTIVITY'))
        or (r.role_id in (5, 6) and e.entity_name in ('QUOTE', 'ORDER', 'INVOICE', 'PAYMENT', 'ACTIVITY', 'FORECAST'))
        or (r.role_id in (7, 8) and e.entity_name in ('ORDER', 'CUSTOMER', 'INVOICE', 'PAYMENT', 'ACTIVITY', 'FORECAST'))
        or (r.role_id = 9 and e.entity_name in ('ACCOUNT', 'CONTACT', 'CUSTOMER', 'ACTIVITY', 'FORECAST'))
      )
),
permission_matrix as (
    select role_id,
           role_code,
           entity_name,
           access_scope_code,
           'Y' can_view,
           case
               when role_id = 1 then 'Y'
               when role_id in (2, 3) then 'Y'
               when role_id = 4 and entity_name in ('ACCOUNT', 'CONTACT', 'LEAD', 'OPPORTUNITY', 'QUOTE', 'ORDER', 'ACTIVITY') then 'Y'
               when role_id = 5 and entity_name in ('INVOICE', 'PAYMENT', 'ACTIVITY') then 'Y'
               when role_id = 6 and entity_name in ('QUOTE', 'ORDER', 'INVOICE', 'PAYMENT', 'ACTIVITY', 'FORECAST') then 'Y'
               when role_id = 7 and entity_name = 'ACTIVITY' then 'Y'
               when role_id = 8 and entity_name in ('ORDER', 'CUSTOMER', 'INVOICE', 'PAYMENT', 'ACTIVITY', 'FORECAST') then 'Y'
               when role_id = 9 and entity_name in ('ACCOUNT', 'CONTACT', 'CUSTOMER', 'ACTIVITY', 'FORECAST') then 'Y'
               else 'N'
           end can_create,
           case
               when role_id = 1 then 'Y'
               when role_id in (2, 3) then 'Y'
               when role_id = 4 and entity_name in ('ACCOUNT', 'CONTACT', 'LEAD', 'OPPORTUNITY', 'QUOTE', 'ORDER', 'ACTIVITY') then 'Y'
               when role_id in (5, 6) and entity_name in ('QUOTE', 'ORDER', 'INVOICE', 'PAYMENT', 'ACTIVITY', 'FORECAST') then 'Y'
               when role_id in (7, 8) and entity_name in ('ORDER', 'CUSTOMER', 'INVOICE', 'PAYMENT', 'ACTIVITY', 'FORECAST') then 'Y'
               when role_id = 9 and entity_name in ('ACCOUNT', 'CONTACT', 'CUSTOMER', 'ACTIVITY', 'FORECAST') then 'Y'
               else 'N'
           end can_update,
           case
               when role_id = 1 and entity_name <> 'SETUP' then 'Y'
               else 'N'
           end can_delete,
           case
               when role_id = 1 and entity_name in ('QUOTE', 'ORDER') then 'Y'
               when role_id in (2, 3, 6) and entity_name in ('QUOTE', 'ORDER') then 'Y'
               else 'N'
           end can_approve
    from role_matrix
)
select row_number() over(order by role_id, entity_name),
       replace(initcap(lower(replace(role_code, '_', ' '))), 'Crm', 'CRM') || ' ' || initcap(lower(entity_name)) || ' access',
       entity_name,
       role_id,
       access_scope_code,
       can_view,
       can_create,
       can_update,
       can_delete,
       can_approve
from permission_matrix;

--------------------------------------------------------------------------------
-- Accounts, contacts, customers, and customer governance
--------------------------------------------------------------------------------
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (1, 'Hudson Atlas Manufacturing Group 001', 1, 1, 'hudsonatlasmanufacturinggroup001.com', 'Newark', 'New Jersey', 1, 201);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (2, 'Prairie Beacon Retail Holdings 002', 2, 1, 'prairiebeaconretailholdings002.com', 'Milwaukee', 'Wisconsin', 2, 207);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (3, 'LoneStar Bridgepoint Health Systems 003', 3, 1, 'lonestarbridgepointhealthsystems003.com', 'San Antonio', 'Texas', 3, 213);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (4, 'Pacific Catalyst Technology Collective 004', 4, 1, 'pacificcatalysttechnologycollective004.com', 'Sacramento', 'California', 4, 219);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (5, 'Maple Crescent Finance Group 005', 5, 1, 'maplecrescentfinancegroup005.ca', 'Toronto', 'Ontario', 5, 225);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (6, 'Cascade Evergreen Logistics Holdings 006', 6, 1, 'cascadeevergreenlogisticsholdings006.ca', 'Calgary', 'Alberta', 6, 226);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (7, 'Azteca Frontier Education Systems 007', 7, 1, 'aztecafrontiereducationsystems007.mx', 'Monterrey', 'Nuevo Leon', 7, 232);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (8, 'Hudson Granite Energy Works 008', 8, 1, 'hudsongraniteenergyworks008.com', 'Stamford', 'Connecticut', 1, 203);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (9, 'Prairie Harbor Telecom Partners 009', 9, 1, 'prairieharbortelecompartners009.com', 'Minneapolis', 'Minnesota', 2, 209);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (10, 'LoneStar Liberty Public Networks 010', 10, 1, 'lonestarlibertypublicnetworks010.com', 'Dallas', 'Texas', 3, 215);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (11, 'Pacific Lakeside Food Solutions 011', 11, 1, 'pacificlakesidefoodsolutions011.com', 'San Jose', 'California', 4, 216);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (12, 'Maple Northstar Automotive Works 012', 12, 1, 'maplenorthstarautomotiveworks012.ca', 'Montreal', 'Quebec', 5, 222);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (13, 'Cascade Pioneer Manufacturing Partners 013', 1, 1, 'cascadepioneermanufacturingpartners013.ca', 'Victoria', 'British Columbia', 6, 228);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (14, 'Azteca Redwood Retail Networks 014', 2, 1, 'aztecaredwoodretailnetworks014.mx', 'Puebla', 'Puebla', 7, 234);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (15, 'Hudson Silverline Health Collective 015', 3, 1, 'hudsonsilverlinehealthcollective015.com', 'New York', 'New York', 1, 205);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (16, 'Prairie Sterling Technology Group 016', 4, 1, 'prairiesterlingtechnologygroup016.com', 'Naperville', 'Illinois', 2, 206);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (17, 'LoneStar Summit Finance Holdings 017', 5, 1, 'lonestarsummitfinanceholdings017.com', 'Houston', 'Texas', 3, 212);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (18, 'Pacific Unity Logistics Systems 018', 6, 1, 'pacificunitylogisticssystems018.com', 'Portland', 'Oregon', 4, 218);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (19, 'Maple Vertex Education Collective 019', 7, 1, 'maplevertexeducationcollective019.ca', 'Kitchener', 'Ontario', 5, 224);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (20, 'Cascade Vista Energy Group 020', 8, 1, 'cascadevistaenergygroup020.ca', 'Vancouver', 'British Columbia', 6, 230);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (21, 'Azteca Atlas Telecom Holdings 021', 9, 1, 'aztecaatlastelecomholdings021.mx', 'Guadalajara', 'Jalisco', 7, 231);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (22, 'Hudson Beacon Public Solutions 022', 10, 1, 'hudsonbeaconpublicsolutions022.com', 'Jersey City', 'New Jersey', 1, 202);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (23, 'Prairie Bridgepoint Food Works 023', 11, 1, 'prairiebridgepointfoodworks023.com', 'Indianapolis', 'Indiana', 2, 208);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (24, 'LoneStar Catalyst Automotive Partners 024', 12, 1, 'lonestarcatalystautomotivepartners024.com', 'Oklahoma City', 'Oklahoma', 3, 214);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (25, 'Pacific Crescent Manufacturing Networks 025', 1, 1, 'pacificcrescentmanufacturingnetworks025.com', 'San Francisco', 'California', 4, 220);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (26, 'Maple Evergreen Retail Solutions 026', 2, 1, 'mapleevergreenretailsolutions026.ca', 'Ottawa', 'Ontario', 5, 221);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (27, 'Cascade Frontier Health Works 027', 3, 1, 'cascadefrontierhealthworks027.ca', 'Edmonton', 'Alberta', 6, 227);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (28, 'Azteca Granite Technology Partners 028', 4, 1, 'aztecagranitetechnologypartners028.mx', 'Queretaro', 'Queretaro', 7, 233);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (29, 'Hudson Harbor Finance Systems 029', 5, 1, 'hudsonharborfinancesystems029.com', 'White Plains', 'New York', 1, 204);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (30, 'Prairie Liberty Logistics Collective 030', 6, 1, 'prairielibertylogisticscollective030.com', 'Chicago', 'Illinois', 2, 210);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (31, 'LoneStar Lakeside Education Group 031', 7, 1, 'lonestarlakesideeducationgroup031.com', 'Austin', 'Texas', 3, 211);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (32, 'Pacific Northstar Energy Holdings 032', 8, 1, 'pacificnorthstarenergyholdings032.com', 'Seattle', 'Washington', 4, 217);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (33, 'Maple Pioneer Telecom Systems 033', 9, 1, 'maplepioneertelecomsystems033.ca', 'Mississauga', 'Ontario', 5, 223);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (34, 'Cascade Redwood Public Collective 034', 10, 1, 'cascaderedwoodpubliccollective034.ca', 'Surrey', 'British Columbia', 6, 229);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (35, 'Azteca Silverline Food Group 035', 11, 1, 'aztecasilverlinefoodgroup035.mx', 'Mexico City', 'Ciudad de Mexico', 7, 235);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (36, 'Hudson Sterling Automotive Networks 036', 12, 1, 'hudsonsterlingautomotivenetworks036.com', 'Newark', 'New Jersey', 1, 201);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (37, 'Prairie Summit Manufacturing Solutions 037', 1, 1, 'prairiesummitmanufacturingsolutions037.com', 'Milwaukee', 'Wisconsin', 2, 207);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (38, 'LoneStar Unity Retail Works 038', 2, 1, 'lonestarunityretailworks038.com', 'San Antonio', 'Texas', 3, 213);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (39, 'Pacific Vertex Health Partners 039', 3, 1, 'pacificvertexhealthpartners039.com', 'Sacramento', 'California', 4, 219);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (40, 'Maple Vista Technology Networks 040', 4, 1, 'maplevistatechnologynetworks040.ca', 'Toronto', 'Ontario', 5, 225);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (41, 'Cascade Atlas Finance Solutions 041', 5, 1, 'cascadeatlasfinancesolutions041.ca', 'Calgary', 'Alberta', 6, 226);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (42, 'Azteca Beacon Logistics Works 042', 6, 1, 'aztecabeaconlogisticsworks042.mx', 'Monterrey', 'Nuevo Leon', 7, 232);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (43, 'Hudson Bridgepoint Education Holdings 043', 7, 1, 'hudsonbridgepointeducationholdings043.com', 'Stamford', 'Connecticut', 1, 203);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (44, 'Prairie Catalyst Energy Systems 044', 8, 1, 'prairiecatalystenergysystems044.com', 'Minneapolis', 'Minnesota', 2, 209);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (45, 'LoneStar Crescent Telecom Collective 045', 9, 1, 'lonestarcrescenttelecomcollective045.com', 'Dallas', 'Texas', 3, 215);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (46, 'Pacific Evergreen Public Group 046', 10, 1, 'pacificevergreenpublicgroup046.com', 'San Jose', 'California', 4, 216);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (47, 'Maple Frontier Food Holdings 047', 11, 1, 'maplefrontierfoodholdings047.ca', 'Montreal', 'Quebec', 5, 222);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (48, 'Cascade Granite Automotive Systems 048', 12, 1, 'cascadegraniteautomotivesystems048.ca', 'Victoria', 'British Columbia', 6, 228);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (49, 'Azteca Harbor Manufacturing Collective 049', 1, 1, 'aztecaharbormanufacturingcollective049.mx', 'Puebla', 'Puebla', 7, 234);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (50, 'Hudson Liberty Retail Partners 050', 2, 1, 'hudsonlibertyretailpartners050.com', 'New York', 'New York', 1, 205);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (51, 'Prairie Lakeside Health Networks 051', 3, 1, 'prairielakesidehealthnetworks051.com', 'Naperville', 'Illinois', 2, 206);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (52, 'LoneStar Northstar Technology Solutions 052', 4, 1, 'lonestarnorthstartechnologysolutions052.com', 'Houston', 'Texas', 3, 212);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (53, 'Pacific Pioneer Finance Works 053', 5, 1, 'pacificpioneerfinanceworks053.com', 'Portland', 'Oregon', 4, 218);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (54, 'Maple Redwood Logistics Partners 054', 6, 1, 'mapleredwoodlogisticspartners054.ca', 'Kitchener', 'Ontario', 5, 224);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (55, 'Cascade Silverline Education Networks 055', 7, 1, 'cascadesilverlineeducationnetworks055.ca', 'Vancouver', 'British Columbia', 6, 230);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (56, 'Azteca Sterling Energy Solutions 056', 8, 1, 'aztecasterlingenergysolutions056.mx', 'Guadalajara', 'Jalisco', 7, 231);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (57, 'Hudson Summit Telecom Group 057', 9, 1, 'hudsonsummittelecomgroup057.com', 'Jersey City', 'New Jersey', 1, 202);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (58, 'Prairie Unity Public Holdings 058', 10, 1, 'prairieunitypublicholdings058.com', 'Indianapolis', 'Indiana', 2, 208);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (59, 'LoneStar Vertex Food Systems 059', 11, 1, 'lonestarvertexfoodsystems059.com', 'Oklahoma City', 'Oklahoma', 3, 214);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (60, 'Pacific Vista Automotive Collective 060', 12, 1, 'pacificvistaautomotivecollective060.com', 'San Francisco', 'California', 4, 220);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (61, 'Maple Atlas Manufacturing Group 061', 1, 1, 'mapleatlasmanufacturinggroup061.ca', 'Ottawa', 'Ontario', 5, 221);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (62, 'Cascade Beacon Retail Holdings 062', 2, 1, 'cascadebeaconretailholdings062.ca', 'Edmonton', 'Alberta', 6, 227);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (63, 'Azteca Bridgepoint Health Systems 063', 3, 1, 'aztecabridgepointhealthsystems063.mx', 'Queretaro', 'Queretaro', 7, 233);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (64, 'Hudson Catalyst Technology Works 064', 4, 1, 'hudsoncatalysttechnologyworks064.com', 'White Plains', 'New York', 1, 204);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (65, 'Prairie Crescent Finance Partners 065', 5, 1, 'prairiecrescentfinancepartners065.com', 'Chicago', 'Illinois', 2, 210);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (66, 'LoneStar Evergreen Logistics Networks 066', 6, 1, 'lonestarevergreenlogisticsnetworks066.com', 'Austin', 'Texas', 3, 211);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (67, 'Pacific Frontier Education Solutions 067', 7, 1, 'pacificfrontiereducationsolutions067.com', 'Seattle', 'Washington', 4, 217);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (68, 'Maple Granite Energy Works 068', 8, 1, 'maplegraniteenergyworks068.ca', 'Mississauga', 'Ontario', 5, 223);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (69, 'Cascade Harbor Telecom Partners 069', 9, 1, 'cascadeharbortelecompartners069.ca', 'Surrey', 'British Columbia', 6, 229);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (70, 'Azteca Liberty Public Networks 070', 10, 1, 'aztecalibertypublicnetworks070.mx', 'Mexico City', 'Ciudad de Mexico', 7, 235);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (71, 'Hudson Lakeside Food Collective 071', 11, 1, 'hudsonlakesidefoodcollective071.com', 'Newark', 'New Jersey', 1, 201);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (72, 'Prairie Northstar Automotive Group 072', 12, 1, 'prairienorthstarautomotivegroup072.com', 'Milwaukee', 'Wisconsin', 2, 207);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (73, 'LoneStar Pioneer Manufacturing Holdings 073', 1, 1, 'lonestarpioneermanufacturingholdings073.com', 'San Antonio', 'Texas', 3, 213);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (74, 'Pacific Redwood Retail Systems 074', 2, 1, 'pacificredwoodretailsystems074.com', 'Sacramento', 'California', 4, 219);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (75, 'Maple Silverline Health Collective 075', 3, 1, 'maplesilverlinehealthcollective075.ca', 'Toronto', 'Ontario', 5, 225);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (76, 'Cascade Sterling Technology Group 076', 4, 1, 'cascadesterlingtechnologygroup076.ca', 'Calgary', 'Alberta', 6, 226);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (77, 'Azteca Summit Finance Holdings 077', 5, 1, 'aztecasummitfinanceholdings077.mx', 'Monterrey', 'Nuevo Leon', 7, 232);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (78, 'Hudson Unity Logistics Solutions 078', 6, 1, 'hudsonunitylogisticssolutions078.com', 'Stamford', 'Connecticut', 1, 203);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (79, 'Prairie Vertex Education Works 079', 7, 1, 'prairievertexeducationworks079.com', 'Minneapolis', 'Minnesota', 2, 209);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (80, 'LoneStar Vista Energy Partners 080', 8, 1, 'lonestarvistaenergypartners080.com', 'Dallas', 'Texas', 3, 215);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (81, 'Pacific Atlas Telecom Networks 081', 9, 1, 'pacificatlastelecomnetworks081.com', 'San Jose', 'California', 4, 216);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (82, 'Maple Beacon Public Solutions 082', 10, 1, 'maplebeaconpublicsolutions082.ca', 'Montreal', 'Quebec', 5, 222);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (83, 'Cascade Bridgepoint Food Works 083', 11, 1, 'cascadebridgepointfoodworks083.ca', 'Victoria', 'British Columbia', 6, 228);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (84, 'Azteca Catalyst Automotive Partners 084', 12, 1, 'aztecacatalystautomotivepartners084.mx', 'Puebla', 'Puebla', 7, 234);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (85, 'Hudson Crescent Manufacturing Systems 085', 1, 1, 'hudsoncrescentmanufacturingsystems085.com', 'New York', 'New York', 1, 205);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (86, 'Prairie Evergreen Retail Collective 086', 2, 1, 'prairieevergreenretailcollective086.com', 'Naperville', 'Illinois', 2, 206);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (87, 'LoneStar Frontier Health Group 087', 3, 1, 'lonestarfrontierhealthgroup087.com', 'Houston', 'Texas', 3, 212);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (88, 'Pacific Granite Technology Holdings 088', 4, 1, 'pacificgranitetechnologyholdings088.com', 'Portland', 'Oregon', 4, 218);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (89, 'Maple Harbor Finance Systems 089', 5, 1, 'mapleharborfinancesystems089.ca', 'Kitchener', 'Ontario', 5, 224);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (90, 'Cascade Liberty Logistics Collective 090', 6, 1, 'cascadelibertylogisticscollective090.ca', 'Vancouver', 'British Columbia', 6, 230);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (121, 'Prairie Atlas Manufacturing Partners 121', 1, 1, 'prairieatlasmanufacturingpartners121.com', 'Naperville', 'Illinois', 2, 206);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (122, 'LoneStar Beacon Retail Networks 122', 2, 1, 'lonestarbeaconretailnetworks122.com', 'Houston', 'Texas', 3, 212);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (123, 'Pacific Bridgepoint Health Solutions 123', 3, 1, 'pacificbridgepointhealthsolutions123.com', 'Portland', 'Oregon', 4, 218);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (124, 'Maple Catalyst Technology Works 124', 4, 1, 'maplecatalysttechnologyworks124.ca', 'Kitchener', 'Ontario', 5, 224);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (125, 'Cascade Crescent Finance Partners 125', 5, 1, 'cascadecrescentfinancepartners125.ca', 'Vancouver', 'British Columbia', 6, 230);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (126, 'Azteca Evergreen Logistics Networks 126', 6, 1, 'aztecaevergreenlogisticsnetworks126.mx', 'Guadalajara', 'Jalisco', 7, 231);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (127, 'Hudson Frontier Education Collective 127', 7, 1, 'hudsonfrontiereducationcollective127.com', 'Jersey City', 'New Jersey', 1, 202);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (128, 'Prairie Granite Energy Group 128', 8, 1, 'prairiegraniteenergygroup128.com', 'Indianapolis', 'Indiana', 2, 208);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (129, 'LoneStar Harbor Telecom Holdings 129', 9, 1, 'lonestarharbortelecomholdings129.com', 'Oklahoma City', 'Oklahoma', 3, 214);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (130, 'Pacific Liberty Public Systems 130', 10, 1, 'pacificlibertypublicsystems130.com', 'San Francisco', 'California', 4, 220);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (131, 'Maple Lakeside Food Collective 131', 11, 1, 'maplelakesidefoodcollective131.ca', 'Ottawa', 'Ontario', 5, 221);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (132, 'Cascade Northstar Automotive Group 132', 12, 1, 'cascadenorthstarautomotivegroup132.ca', 'Edmonton', 'Alberta', 6, 227);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (133, 'Azteca Pioneer Manufacturing Holdings 133', 1, 1, 'aztecapioneermanufacturingholdings133.mx', 'Queretaro', 'Queretaro', 7, 233);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (134, 'Hudson Redwood Retail Solutions 134', 2, 1, 'hudsonredwoodretailsolutions134.com', 'White Plains', 'New York', 1, 204);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (135, 'Prairie Silverline Health Works 135', 3, 1, 'prairiesilverlinehealthworks135.com', 'Chicago', 'Illinois', 2, 210);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (141, 'Hudson Atlas Telecom Systems 141', 9, 1, 'hudsonatlastelecomsystems141.com', 'Newark', 'New Jersey', 1, 201);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (142, 'Prairie Beacon Public Collective 142', 10, 1, 'prairiebeaconpubliccollective142.com', 'Milwaukee', 'Wisconsin', 2, 207);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (143, 'LoneStar Bridgepoint Food Group 143', 11, 1, 'lonestarbridgepointfoodgroup143.com', 'San Antonio', 'Texas', 3, 213);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (144, 'Pacific Catalyst Automotive Holdings 144', 12, 1, 'pacificcatalystautomotiveholdings144.com', 'Sacramento', 'California', 4, 219);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (145, 'Maple Crescent Manufacturing Systems 145', 1, 1, 'maplecrescentmanufacturingsystems145.ca', 'Toronto', 'Ontario', 5, 225);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (146, 'Cascade Evergreen Retail Collective 146', 2, 1, 'cascadeevergreenretailcollective146.ca', 'Calgary', 'Alberta', 6, 226);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (147, 'Azteca Frontier Health Group 147', 3, 1, 'aztecafrontierhealthgroup147.mx', 'Monterrey', 'Nuevo Leon', 7, 232);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (148, 'Hudson Granite Technology Networks 148', 4, 1, 'hudsongranitetechnologynetworks148.com', 'Stamford', 'Connecticut', 1, 203);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (149, 'Prairie Harbor Finance Solutions 149', 5, 1, 'prairieharborfinancesolutions149.com', 'Minneapolis', 'Minnesota', 2, 209);
insert into crm_accounts (account_id, name, industry_id, account_relationship_status_id, website, city, state, branch_id, user_owner_id) values (150, 'LoneStar Liberty Logistics Works 150', 6, 1, 'lonestarlibertylogisticsworks150.com', 'Dallas', 'Texas', 3, 215);

insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (1, 1, 'Liam Williams', 'liam.williams.001@contact.na.example', '+1-900-5500001', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (2, 2, 'Sophia Brown', 'sophia.brown.002@contact.na.example', '+1-900-5500002', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (3, 3, 'Noah Jones', 'noah.jones.003@contact.na.example', '+1-900-5500003', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (4, 4, 'Ava Miller', 'ava.miller.004@contact.na.example', '+1-900-5500004', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (5, 5, 'William Brown', 'william.brown.005@contact.na.example', '+1-900-5500005', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (6, 6, 'Mia Wilson', 'mia.wilson.006@contact.na.example', '+1-900-5500006', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (7, 7, 'Leonardo Gonzalez', 'leonardo.gonzalez.007@contact.na.example', '+1-900-5500007', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (8, 8, 'Charlotte Moore', 'charlotte.moore.008@contact.na.example', '+1-900-5500008', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (9, 9, 'Logan Hall', 'logan.hall.009@contact.na.example', '+1-900-5500009', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (10, 10, 'Harper Young', 'harper.young.010@contact.na.example', '+1-900-5500010', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (11, 11, 'Amelia Allen', 'amelia.allen.011@contact.na.example', '+1-900-5500011', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (12, 12, 'Sophie Gagnon', 'sophie.gagnon.012@contact.na.example', '+1-900-5500012', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (13, 13, 'Lucas Singh', 'lucas.singh.013@contact.na.example', '+1-900-5500013', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (14, 14, 'Valeria Martinez', 'valeria.martinez.014@contact.na.example', '+1-900-5500014', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (15, 15, 'Noah Jones', 'noah.jones.015@contact.na.example', '+1-900-5500015', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (16, 16, 'Ava Miller', 'ava.miller.016@contact.na.example', '+1-900-5500016', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (17, 17, 'Mason Davis', 'mason.davis.017@contact.na.example', '+1-900-5500017', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (18, 18, 'Isabella Clark', 'isabella.clark.018@contact.na.example', '+1-900-5500018', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (19, 19, 'Benjamin Taylor', 'benjamin.taylor.019@contact.na.example', '+1-900-5500019', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (20, 20, 'Lea Clarke', 'lea.clarke.020@contact.na.example', '+1-900-5500020', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (21, 21, 'Diego Flores', 'diego.flores.021@contact.na.example', '+1-900-5500021', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (22, 22, 'Harper Young', 'harper.young.022@contact.na.example', '+1-900-5500022', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (23, 23, 'Amelia Allen', 'amelia.allen.023@contact.na.example', '+1-900-5500023', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (24, 24, 'Olivia Johnson', 'olivia.johnson.024@contact.na.example', '+1-900-5500024', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (25, 25, 'Liam Williams', 'liam.williams.025@contact.na.example', '+1-900-5500025', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (26, 26, 'Emma Roy', 'emma.roy.026@contact.na.example', '+1-900-5500026', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (27, 27, 'Noah Martin', 'noah.martin.027@contact.na.example', '+1-900-5500027', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (29, 29, 'Mason Davis', 'mason.davis.029@contact.na.example', '+1-900-5500029', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (30, 30, 'Isabella Clark', 'isabella.clark.030@contact.na.example', '+1-900-5500030', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (31, 31, 'Ethan Taylor', 'ethan.taylor.031@contact.na.example', '+1-900-5500031', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (33, 33, 'Thomas Lefebvre', 'thomas.lefebvre.033@contact.na.example', '+1-900-5500033', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (34, 34, 'Camille Hall', 'camille.hall.034@contact.na.example', '+1-900-5500034', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (35, 35, 'Emiliano Vargas', 'emiliano.vargas.035@contact.na.example', '+1-900-5500035', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (37, 37, 'Liam Williams', 'liam.williams.037@contact.na.example', '+1-900-5500037', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (38, 38, 'Sophia Brown', 'sophia.brown.038@contact.na.example', '+1-900-5500038', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (39, 39, 'Noah Jones', 'noah.jones.039@contact.na.example', '+1-900-5500039', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (41, 41, 'William Brown', 'william.brown.041@contact.na.example', '+1-900-5500041', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (42, 42, 'Ximena Ramirez', 'ximena.ramirez.042@contact.na.example', '+1-900-5500042', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (43, 43, 'Ethan Taylor', 'ethan.taylor.043@contact.na.example', '+1-900-5500043', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (45, 45, 'Logan Hall', 'logan.hall.045@contact.na.example', '+1-900-5500045', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (46, 46, 'Harper Young', 'harper.young.046@contact.na.example', '+1-900-5500046', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (47, 47, 'Nathan Bennett', 'nathan.bennett.047@contact.na.example', '+1-900-5500047', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (49, 49, 'Santiago Garcia', 'santiago.garcia.049@contact.na.example', '+1-900-5500049', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (50, 50, 'Sophia Brown', 'sophia.brown.050@contact.na.example', '+1-900-5500050', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (51, 51, 'Noah Jones', 'noah.jones.051@contact.na.example', '+1-900-5500051', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (53, 53, 'Mason Davis', 'mason.davis.053@contact.na.example', '+1-900-5500053', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (54, 54, 'Mia Wilson', 'mia.wilson.054@contact.na.example', '+1-900-5500054', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (55, 55, 'Benjamin Taylor', 'benjamin.taylor.055@contact.na.example', '+1-900-5500055', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (57, 57, 'Logan Hall', 'logan.hall.057@contact.na.example', '+1-900-5500057', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (58, 58, 'Harper Young', 'harper.young.058@contact.na.example', '+1-900-5500058', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (59, 59, 'Amelia Allen', 'amelia.allen.059@contact.na.example', '+1-900-5500059', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (61, 61, 'Lucas Singh', 'lucas.singh.061@contact.na.example', '+1-900-5500061', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (62, 62, 'Emma Roy', 'emma.roy.062@contact.na.example', '+1-900-5500062', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (63, 63, 'Mateo Lopez', 'mateo.lopez.063@contact.na.example', '+1-900-5500063', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (65, 65, 'Mason Davis', 'mason.davis.065@contact.na.example', '+1-900-5500065', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (66, 66, 'Isabella Clark', 'isabella.clark.066@contact.na.example', '+1-900-5500066', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (67, 67, 'Ethan Taylor', 'ethan.taylor.067@contact.na.example', '+1-900-5500067', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (69, 69, 'Thomas Lefebvre', 'thomas.lefebvre.069@contact.na.example', '+1-900-5500069', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (70, 70, 'Renata Morales', 'renata.morales.070@contact.na.example', '+1-900-5500070', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (71, 71, 'Amelia Allen', 'amelia.allen.071@contact.na.example', '+1-900-5500071', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (73, 73, 'Liam Williams', 'liam.williams.073@contact.na.example', '+1-900-5500073', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (74, 74, 'Sophia Brown', 'sophia.brown.074@contact.na.example', '+1-900-5500074', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (75, 75, 'Noah Martin', 'noah.martin.075@contact.na.example', '+1-900-5500075', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (77, 77, 'Sebastian Sanchez', 'sebastian.sanchez.077@contact.na.example', '+1-900-5500077', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (78, 78, 'Isabella Clark', 'isabella.clark.078@contact.na.example', '+1-900-5500078', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (79, 79, 'Ethan Taylor', 'ethan.taylor.079@contact.na.example', '+1-900-5500079', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (81, 81, 'Logan Hall', 'logan.hall.081@contact.na.example', '+1-900-5500081', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (82, 82, 'Camille Hall', 'camille.hall.082@contact.na.example', '+1-900-5500082', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (83, 83, 'Nathan Bennett', 'nathan.bennett.083@contact.na.example', '+1-900-5500083', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (85, 85, 'Liam Williams', 'liam.williams.085@contact.na.example', '+1-900-5500085', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (86, 86, 'Sophia Brown', 'sophia.brown.086@contact.na.example', '+1-900-5500086', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (87, 87, 'Noah Jones', 'noah.jones.087@contact.na.example', '+1-900-5500087', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (89, 89, 'William Brown', 'william.brown.089@contact.na.example', '+1-900-5500089', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (90, 90, 'Mia Wilson', 'mia.wilson.090@contact.na.example', '+1-900-5500090', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (121, 121, 'Liam Williams', 'liam.williams.121@contact.na.example', '+1-900-5500121', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (122, 122, 'Sophia Brown', 'sophia.brown.122@contact.na.example', '+1-900-5500122', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (123, 123, 'Noah Jones', 'noah.jones.123@contact.na.example', '+1-900-5500123', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (125, 125, 'William Brown', 'william.brown.125@contact.na.example', '+1-900-5500125', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (126, 126, 'Ximena Ramirez', 'ximena.ramirez.126@contact.na.example', '+1-900-5500126', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (127, 127, 'Ethan Taylor', 'ethan.taylor.127@contact.na.example', '+1-900-5500127', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (129, 129, 'Logan Hall', 'logan.hall.129@contact.na.example', '+1-900-5500129', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (130, 130, 'Harper Young', 'harper.young.130@contact.na.example', '+1-900-5500130', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (131, 131, 'Nathan Bennett', 'nathan.bennett.131@contact.na.example', '+1-900-5500131', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (132, 132, 'Sophie Gagnon', 'sophie.gagnon.132@contact.na.example', '+1-900-5500132', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (133, 133, 'Santiago Garcia', 'santiago.garcia.133@contact.na.example', '+1-900-5500133', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (134, 134, 'Sophia Brown', 'sophia.brown.134@contact.na.example', '+1-900-5500134', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (135, 135, 'Noah Jones', 'noah.jones.135@contact.na.example', '+1-900-5500135', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (141, 141, 'Logan Hall', 'logan.hall.141@contact.na.example', '+1-900-5500141', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (142, 142, 'Harper Young', 'harper.young.142@contact.na.example', '+1-900-5500142', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (143, 143, 'Amelia Allen', 'amelia.allen.143@contact.na.example', '+1-900-5500143', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (144, 144, 'Olivia Johnson', 'olivia.johnson.144@contact.na.example', '+1-900-5500144', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (145, 145, 'Lucas Singh', 'lucas.singh.145@contact.na.example', '+1-900-5500145', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (146, 146, 'Emma Roy', 'emma.roy.146@contact.na.example', '+1-900-5500146', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (147, 147, 'Mateo Lopez', 'mateo.lopez.147@contact.na.example', '+1-900-5500147', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (148, 148, 'Ava Miller', 'ava.miller.148@contact.na.example', '+1-900-5500148', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (149, 149, 'Mason Davis', 'mason.davis.149@contact.na.example', '+1-900-5500149', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (150, 150, 'Isabella Clark', 'isabella.clark.150@contact.na.example', '+1-900-5500150', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (261, 1, 'Logan Hall', 'logan.hall.261@contact.na.example', '+1-900-5500261', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (262, 2, 'Harper Young', 'harper.young.262@contact.na.example', '+1-900-5500262', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (263, 3, 'Amelia Allen', 'amelia.allen.263@contact.na.example', '+1-900-5500263', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (264, 4, 'Olivia Johnson', 'olivia.johnson.264@contact.na.example', '+1-900-5500264', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (265, 5, 'Lucas Singh', 'lucas.singh.265@contact.na.example', '+1-900-5500265', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (266, 6, 'Emma Roy', 'emma.roy.266@contact.na.example', '+1-900-5500266', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (267, 7, 'Mateo Lopez', 'mateo.lopez.267@contact.na.example', '+1-900-5500267', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (268, 8, 'Ava Miller', 'ava.miller.268@contact.na.example', '+1-900-5500268', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (269, 9, 'Mason Davis', 'mason.davis.269@contact.na.example', '+1-900-5500269', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (270, 10, 'Isabella Clark', 'isabella.clark.270@contact.na.example', '+1-900-5500270', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (271, 11, 'Ethan Taylor', 'ethan.taylor.271@contact.na.example', '+1-900-5500271', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (272, 12, 'Lea Clarke', 'lea.clarke.272@contact.na.example', '+1-900-5500272', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (273, 13, 'Thomas Lefebvre', 'thomas.lefebvre.273@contact.na.example', '+1-900-5500273', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (274, 14, 'Renata Morales', 'renata.morales.274@contact.na.example', '+1-900-5500274', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (275, 15, 'Amelia Allen', 'amelia.allen.275@contact.na.example', '+1-900-5500275', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (276, 16, 'Olivia Johnson', 'olivia.johnson.276@contact.na.example', '+1-900-5500276', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (277, 17, 'Liam Williams', 'liam.williams.277@contact.na.example', '+1-900-5500277', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (278, 18, 'Sophia Brown', 'sophia.brown.278@contact.na.example', '+1-900-5500278', 'IT Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (279, 19, 'Noah Martin', 'noah.martin.279@contact.na.example', '+1-900-5500279', 'Customer Experience Lead', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (280, 20, 'Chloe Chen', 'chloe.chen.280@contact.na.example', '+1-900-5500280', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (281, 21, 'Sebastian Sanchez', 'sebastian.sanchez.281@contact.na.example', '+1-900-5500281', 'Chief Revenue Officer', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (282, 22, 'Isabella Clark', 'isabella.clark.282@contact.na.example', '+1-900-5500282', 'VP Sales', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (283, 23, 'Ethan Taylor', 'ethan.taylor.283@contact.na.example', '+1-900-5500283', 'Operations Director', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (284, 24, 'Charlotte Moore', 'charlotte.moore.284@contact.na.example', '+1-900-5500284', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (285, 25, 'Logan Hall', 'logan.hall.285@contact.na.example', '+1-900-5500285', 'Procurement Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (288, 28, 'Sofia Hernandez', 'sofia.hernandez.288@contact.na.example', '+1-900-5500288', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (292, 32, 'Ava Miller', 'ava.miller.292@contact.na.example', '+1-900-5500292', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (296, 36, 'Charlotte Moore', 'charlotte.moore.296@contact.na.example', '+1-900-5500296', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (300, 40, 'Sophie Gagnon', 'sophie.gagnon.300@contact.na.example', '+1-900-5500300', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (304, 44, 'Ava Miller', 'ava.miller.304@contact.na.example', '+1-900-5500304', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (308, 48, 'Lea Clarke', 'lea.clarke.308@contact.na.example', '+1-900-5500308', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (312, 52, 'Olivia Johnson', 'olivia.johnson.312@contact.na.example', '+1-900-5500312', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (316, 56, 'Camila Rodriguez', 'camila.rodriguez.316@contact.na.example', '+1-900-5500316', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (320, 60, 'Charlotte Moore', 'charlotte.moore.320@contact.na.example', '+1-900-5500320', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (324, 64, 'Olivia Johnson', 'olivia.johnson.324@contact.na.example', '+1-900-5500324', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (328, 68, 'Chloe Chen', 'chloe.chen.328@contact.na.example', '+1-900-5500328', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (332, 72, 'Charlotte Moore', 'charlotte.moore.332@contact.na.example', '+1-900-5500332', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (336, 76, 'Sophie Gagnon', 'sophie.gagnon.336@contact.na.example', '+1-900-5500336', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (340, 80, 'Ava Miller', 'ava.miller.340@contact.na.example', '+1-900-5500340', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (344, 84, 'Regina Torres', 'regina.torres.344@contact.na.example', '+1-900-5500344', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (348, 88, 'Olivia Johnson', 'olivia.johnson.348@contact.na.example', '+1-900-5500348', 'Finance Controller', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (384, 124, 'Sophie Gagnon', 'sophie.gagnon.384@contact.na.example', '+1-900-5500384', 'Commercial Manager', null, null, null);
insert into crm_contacts (contact_id, account_id, name, email, phone, designation, preferred_channel_id, preferred_contact_window, preferred_contact_notes) values (388, 128, 'Ava Miller', 'ava.miller.388@contact.na.example', '+1-900-5500388', 'Finance Controller', null, null, null);

insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (1, 1, 1, 'Hudson Atlas Manufacturing Group 001', 1, 'hudsonatlasmanufacturinggroup001.com', 1, 101, 1, 1, '101 Commerce Avenue, Newark, New Jersey', '501 Distribution Way, Jersey City, New Jersey');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (2, 2, 2, 'Prairie Beacon Retail Holdings 002', 2, 'prairiebeaconretailholdings002.com', 2, 102, 1, 1, '102 Commerce Avenue, Milwaukee, Wisconsin', '502 Distribution Way, Indianapolis, Indiana');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (3, 3, 3, 'LoneStar Bridgepoint Health Systems 003', 3, 'lonestarbridgepointhealthsystems003.com', 3, 103, 1, 1, '103 Commerce Avenue, San Antonio, Texas', '503 Distribution Way, Oklahoma City, Oklahoma');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (4, 4, 4, 'Pacific Catalyst Technology Collective 004', 4, 'pacificcatalysttechnologycollective004.com', 4, 104, 1, 1, '104 Commerce Avenue, Sacramento, California', '504 Distribution Way, San Francisco, California');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (5, 5, 5, 'Maple Crescent Finance Group 005', 5, 'maplecrescentfinancegroup005.ca', 5, 105, 1, 1, '105 Commerce Avenue, Toronto, Ontario', '505 Distribution Way, Ottawa, Ontario');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (6, 6, 6, 'Cascade Evergreen Logistics Holdings 006', 6, 'cascadeevergreenlogisticsholdings006.ca', 6, 106, 1, 1, '106 Commerce Avenue, Calgary, Alberta', '506 Distribution Way, Edmonton, Alberta');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (7, 7, 7, 'Azteca Frontier Education Systems 007', 7, 'aztecafrontiereducationsystems007.mx', 7, 107, 1, 1, '107 Commerce Avenue, Monterrey, Nuevo Leon', '507 Distribution Way, Queretaro, Queretaro');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (8, 8, 8, 'Hudson Granite Energy Works 008', 8, 'hudsongraniteenergyworks008.com', 1, 101, 1, 1, '108 Commerce Avenue, Stamford, Connecticut', '508 Distribution Way, White Plains, New York');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (9, 9, 9, 'Prairie Harbor Telecom Partners 009', 9, 'prairieharbortelecompartners009.com', 2, 102, 1, 1, '109 Commerce Avenue, Minneapolis, Minnesota', '509 Distribution Way, Chicago, Illinois');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (10, 10, 10, 'LoneStar Liberty Public Networks 010', 10, 'lonestarlibertypublicnetworks010.com', 3, 103, 1, 1, '110 Commerce Avenue, Dallas, Texas', '510 Distribution Way, Austin, Texas');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (11, 11, 11, 'Pacific Lakeside Food Solutions 011', 11, 'pacificlakesidefoodsolutions011.com', 4, 104, 1, 1, '111 Commerce Avenue, San Jose, California', '511 Distribution Way, Seattle, Washington');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (12, 12, 12, 'Maple Northstar Automotive Works 012', 12, 'maplenorthstarautomotiveworks012.ca', 5, 105, 1, 1, '112 Commerce Avenue, Montreal, Quebec', '512 Distribution Way, Mississauga, Ontario');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (13, 13, 13, 'Cascade Pioneer Manufacturing Partners 013', 1, 'cascadepioneermanufacturingpartners013.ca', 6, 106, 2, 1, '113 Commerce Avenue, Victoria, British Columbia', '513 Distribution Way, Surrey, British Columbia');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (14, 14, 14, 'Azteca Redwood Retail Networks 014', 2, 'aztecaredwoodretailnetworks014.mx', 7, 107, 2, 1, '114 Commerce Avenue, Puebla, Puebla', '514 Distribution Way, Mexico City, Ciudad de Mexico');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (15, 15, 15, 'Hudson Silverline Health Collective 015', 3, 'hudsonsilverlinehealthcollective015.com', 1, 101, 2, 1, '115 Commerce Avenue, New York, New York', '515 Distribution Way, Newark, New Jersey');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (16, 16, 16, 'Prairie Sterling Technology Group 016', 4, 'prairiesterlingtechnologygroup016.com', 2, 102, 2, 1, '116 Commerce Avenue, Naperville, Illinois', '516 Distribution Way, Milwaukee, Wisconsin');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (17, 17, 17, 'LoneStar Summit Finance Holdings 017', 5, 'lonestarsummitfinanceholdings017.com', 3, 103, 2, 1, '117 Commerce Avenue, Houston, Texas', '517 Distribution Way, San Antonio, Texas');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (18, 18, 18, 'Pacific Unity Logistics Systems 018', 6, 'pacificunitylogisticssystems018.com', 4, 104, 2, 1, '118 Commerce Avenue, Portland, Oregon', '518 Distribution Way, Sacramento, California');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (19, 19, 19, 'Maple Vertex Education Collective 019', 7, 'maplevertexeducationcollective019.ca', 5, 105, 2, 1, '119 Commerce Avenue, Kitchener, Ontario', '519 Distribution Way, Toronto, Ontario');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (20, 20, 20, 'Cascade Vista Energy Group 020', 8, 'cascadevistaenergygroup020.ca', 6, 106, 2, 1, '120 Commerce Avenue, Vancouver, British Columbia', '520 Distribution Way, Calgary, Alberta');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (21, 21, 21, 'Azteca Atlas Telecom Holdings 021', 9, 'aztecaatlastelecomholdings021.mx', 7, 231, 2, 2, '121 Commerce Avenue, Guadalajara, Jalisco', '521 Distribution Way, Monterrey, Nuevo Leon');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (22, 22, 22, 'Hudson Beacon Public Solutions 022', 10, 'hudsonbeaconpublicsolutions022.com', 1, 202, 2, 2, '122 Commerce Avenue, Jersey City, New Jersey', '522 Distribution Way, Stamford, Connecticut');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (23, 23, 23, 'Prairie Bridgepoint Food Works 023', 11, 'prairiebridgepointfoodworks023.com', 2, 208, 2, 2, '123 Commerce Avenue, Indianapolis, Indiana', '523 Distribution Way, Minneapolis, Minnesota');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (24, 24, 24, 'LoneStar Catalyst Automotive Partners 024', 12, 'lonestarcatalystautomotivepartners024.com', 3, 214, 2, 2, '124 Commerce Avenue, Oklahoma City, Oklahoma', '524 Distribution Way, Dallas, Texas');
insert into crm_customers (customer_id, account_id, primary_contact_id, name, industry_id, website, branch_id, user_owner_id, customer_status_id, customer_priority_id, billing_address, shipping_address) values (25, 25, 25, 'Pacific Crescent Manufacturing Networks 025', 1, 'pacificcrescentmanufacturingnetworks025.com', 4, 220, 2, 2, '125 Commerce Avenue, San Francisco, California', '525 Distribution Way, San Jose, California');

insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (1, 1, 1, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (2, 2, 2, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (3, 3, 3, 1, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (4, 4, 4, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (5, 5, 5, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (6, 6, 6, 1, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (7, 7, 7, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (8, 8, 8, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (9, 9, 9, 1, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (10, 10, 10, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (11, 11, 11, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (12, 12, 12, 1, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (13, 13, 13, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (14, 14, 14, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (15, 15, 15, 1, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (16, 16, 16, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (17, 17, 17, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (18, 18, 18, 1, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (19, 19, 19, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (20, 20, 20, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (21, 21, 21, 1, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (22, 22, 22, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (23, 23, 23, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (24, 24, 24, 1, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (25, 25, 25, 2, 'Y');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (141, 1, 261, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (142, 2, 262, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (143, 3, 263, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (144, 4, 264, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (145, 5, 265, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (146, 6, 266, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (147, 7, 267, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (148, 8, 268, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (149, 9, 269, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (150, 10, 270, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (151, 11, 271, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (152, 12, 272, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (153, 13, 273, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (154, 14, 274, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (155, 15, 275, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (156, 16, 276, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (157, 17, 277, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (158, 18, 278, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (159, 19, 279, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (160, 20, 280, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (161, 21, 281, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (162, 22, 282, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (163, 23, 283, 6, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (164, 24, 284, 5, 'N');
insert into crm_customer_contacts (customer_contact_id, customer_id, contact_id, contact_role_id, is_primary) values (165, 25, 285, 6, 'N');

insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (1, 1, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 101, date '2024-05-24');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (2, 2, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 102, date '2024-05-27');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (3, 3, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 103, date '2024-05-30');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (4, 4, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 104, date '2024-06-02');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (5, 5, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 105, date '2024-06-05');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (6, 6, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 106, date '2024-06-08');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (7, 7, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 107, date '2024-06-11');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (8, 8, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 101, date '2024-06-14');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (9, 9, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 102, date '2024-06-17');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (10, 10, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 103, date '2024-06-20');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (11, 11, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 104, date '2024-06-23');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (12, 12, 'CUSTOMER_STATUS_ID', 'PROSPECT', 'ONBOARDING', 105, date '2024-06-26');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (13, 13, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 106, date '2024-06-29');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (14, 14, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 107, date '2024-07-02');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (15, 15, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 101, date '2024-07-05');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (16, 16, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 102, date '2024-07-08');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (17, 17, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 103, date '2024-07-11');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (18, 18, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 104, date '2024-07-14');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (19, 19, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 105, date '2024-07-17');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (20, 20, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 106, date '2024-07-20');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (21, 21, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 231, date '2024-07-23');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (22, 22, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 202, date '2024-07-26');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (23, 23, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 208, date '2024-07-29');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (24, 24, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 214, date '2024-08-01');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (25, 25, 'CUSTOMER_STATUS_ID', 'ONBOARDING', 'ACTIVE', 220, date '2024-08-04');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (141, 1, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-04');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (142, 2, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-07');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (143, 3, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-10');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (144, 4, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-13');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (145, 5, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-16');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (146, 6, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-19');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (147, 7, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-22');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (148, 8, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-25');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (149, 9, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-06-28');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (150, 10, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-01');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (151, 11, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-04');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (152, 12, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-07');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (153, 13, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-10');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (154, 14, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-13');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (155, 15, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-16');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (156, 16, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-19');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (157, 17, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-22');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (158, 18, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-25');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (159, 19, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-28');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (160, 20, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'STRATEGIC', 5, date '2024-07-31');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (161, 21, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'HIGH', 5, date '2024-08-03');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (162, 22, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'HIGH', 5, date '2024-08-06');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (163, 23, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'HIGH', 5, date '2024-08-09');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (164, 24, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'HIGH', 5, date '2024-08-12');
insert into crm_customer_history (customer_hist_id, customer_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (165, 25, 'CUSTOMER_PRIORITY_ID', 'MEDIUM', 'HIGH', 5, date '2024-08-15');

update crm_contacts
set preferred_channel_id = case
        when designation = 'Finance Controller' then 6
        when designation = 'Procurement Manager' then 1
        when designation in ('Chief Revenue Officer', 'VP Sales') then 2
        when designation = 'Operations Director' then 3
        when designation = 'Customer Experience Lead' then 4
        when designation = 'IT Director' then 5
        else 1
    end,
    preferred_contact_window = case
        when designation in ('Chief Revenue Officer', 'VP Sales') then 'Weekdays 09:00-11:00 local'
        when designation in ('Finance Controller', 'Procurement Manager') then 'Weekdays 13:00-16:00 local'
        when designation = 'Operations Director' then 'Weekdays 07:30-09:00 local'
        when designation = 'Customer Experience Lead' then 'Weekdays 08:30-10:00 local'
        when designation = 'IT Director' then 'Weekdays 10:00-12:00 local'
        else 'Weekdays 11:00-14:00 local'
    end,
    preferred_contact_notes = case
        when designation = 'Finance Controller' then 'Use the portal first, then confirm invoice and payment timing.'
        when designation = 'Procurement Manager' then 'Send the latest commercial summary before negotiation calls.'
        when designation = 'Operations Director' then 'Coordinate around rollout and delivery checkpoints.'
        when designation = 'Customer Experience Lead' then 'Keep updates brief, mobile-friendly, and action-oriented.'
        when designation = 'IT Director' then 'Include agenda and technical context before review meetings.'
        else 'Confirm agenda, next step, and decision timeline in the follow-up.'
    end;

insert into crm_account_contact_roles (account_contact_role_id, account_id, contact_id, contact_role_id, role_notes)
with base_roles as (
    select c.account_id,
           c.contact_id,
           case
               when c.designation in ('Chief Revenue Officer', 'VP Sales') then 1
               when c.designation = 'Commercial Manager' then 2
               when c.designation = 'IT Director' then 3
               when c.designation = 'Procurement Manager' then 4
               when c.designation = 'Finance Controller' then 5
               else 6
           end contact_role_id,
           case
               when c.designation in ('Chief Revenue Officer', 'VP Sales') then 'Primary commercial sponsor.'
               when c.designation = 'Commercial Manager' then 'Coordinates evaluation and buying consensus.'
               when c.designation = 'IT Director' then 'Owns technical due diligence and design review.'
               when c.designation = 'Procurement Manager' then 'Leads purchasing and commercial paper process.'
               when c.designation = 'Finance Controller' then 'Owns invoicing, billing, and payment readiness.'
               else 'Supports rollout, adoption, and operational continuity.'
           end role_notes
    from crm_contacts c
    union all
    select c.account_id,
           c.contact_id,
           7,
           'Shapes stakeholder sentiment and internal alignment.'
    from crm_contacts c
    where c.designation in ('Commercial Manager', 'Customer Experience Lead', 'IT Director')
)
select row_number() over(order by account_id, contact_id, contact_role_id),
       account_id,
       contact_id,
       contact_role_id,
       role_notes
from base_roles;

update crm_accounts a
set account_relationship_status_id = case
        when exists (
            select 1
            from crm_customers c
            where c.account_id = a.account_id
        ) then
            case
                when mod(a.account_id, 11) in (0, 1) then 3
                when mod(a.account_id, 9) = 0 then 4
                else 2
            end
        else
            case
                when mod(a.account_id, 8) = 0 then 4
                else 1
            end
    end;


--------------------------------------------------------------------------------
-- Seed segment 2: leads, opportunities, pipeline history, quotes, part 1.
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Leads, opportunities, and pipeline history
--------------------------------------------------------------------------------
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (1, 1, 1, 'NA', 1, 4, 1, null, 1, 201, 105600, 120000, 'Newark', 'New Jersey', 40.7357, -74.1724, 'North America demand generation lead for branch 1 and account 1.', 'Converted after discovery.', null, date '2025-01-14', 1);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (2, 2, 2, 'NA', 1, 4, 2, null, 2, 207, 117656, 133700, 'Milwaukee', 'Wisconsin', 43.0389, -87.9065, 'North America demand generation lead for branch 2 and account 2.', 'Converted after discovery.', null, date '2025-01-18', 2);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (3, 3, 3, 'NA', 1, 4, 3, null, 3, 213, 129712, 147400, 'San Antonio', 'Texas', 29.4241, -98.4936, 'North America demand generation lead for branch 3 and account 3.', 'Converted after discovery.', null, date '2025-01-22', 3);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (4, 4, 264, 'NA', 1, 4, 4, null, 4, 219, 141768, 161100, 'Sacramento', 'California', 38.5816, -121.4944, 'North America demand generation lead for branch 4 and account 4.', 'Converted after discovery.', null, date '2025-01-26', 4);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (5, 5, 5, 'NA', 1, 4, 5, null, 5, 225, 153824, 174800, 'Toronto', 'Ontario', 43.6532, -79.3832, 'North America demand generation lead for branch 5 and account 5.', 'Converted after discovery.', null, date '2025-01-30', 5);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (6, 6, 6, 'NA', 4, 4, 6, null, 6, 226, 165880, 188500, 'Calgary', 'Alberta', 51.0447, -114.0719, 'North America demand generation lead for branch 6 and account 6.', 'Converted after discovery.', null, date '2025-01-28', 6);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (7, 7, 7, 'NA', 4, 4, 7, null, 7, 232, 177936, 202200, 'Monterrey', 'Nuevo Leon', 25.6866, -100.3161, 'North America demand generation lead for branch 7 and account 7.', 'Converted after discovery.', null, date '2025-02-01', 7);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (8, 8, 268, 'NA', 4, 4, 1, null, 1, 203, 164120, 186500, 'Stamford', 'Connecticut', 41.0534, -73.5387, 'North America demand generation lead for branch 1 and account 8.', 'Converted after discovery.', null, date '2025-02-05', 8);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (9, 9, 9, 'NA', 4, 4, 2, null, 2, 209, 176176, 200200, 'Minneapolis', 'Minnesota', 44.9778, -93.265, 'North America demand generation lead for branch 2 and account 9.', 'Converted after discovery.', null, date '2025-02-09', 9);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (10, 10, 10, 'NA', 4, 4, 3, null, 3, 215, 188232, 213900, 'Dallas', 'Texas', 32.7767, -96.797, 'North America demand generation lead for branch 3 and account 10.', 'Converted after discovery.', null, date '2025-02-13', 10);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (11, 11, 11, 'NA', 4, 4, 4, null, 4, 216, 200288, 227600, 'San Jose', 'California', 37.3382, -121.8863, 'North America demand generation lead for branch 4 and account 11.', 'Converted after discovery.', null, date '2025-02-17', 11);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (12, 12, 272, 'NA', 4, 4, 5, null, 5, 222, 212344, 241300, 'Montreal', 'Quebec', 45.5017, -73.5673, 'North America demand generation lead for branch 5 and account 12.', 'Converted after discovery.', null, date '2025-02-15', 12);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (13, 13, 13, 'NA', 1, 4, 6, null, 6, 228, 124080, 141000, 'Victoria', 'British Columbia', 48.4284, -123.3656, 'North America demand generation lead for branch 6 and account 13.', 'Converted after discovery.', null, date '2025-02-19', 13);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (14, 14, 14, 'NA', 1, 4, 7, null, 7, 234, 136136, 154700, 'Puebla', 'Puebla', 19.0414, -98.2063, 'North America demand generation lead for branch 7 and account 14.', 'Converted after discovery.', null, date '2025-02-23', 14);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (15, 15, 15, 'NA', 1, 4, 1, null, 1, 205, 122320, 139000, 'New York', 'New York', 40.7128, -74.006, 'North America demand generation lead for branch 1 and account 15.', 'Converted after discovery.', null, date '2025-02-27', 15);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (16, 16, 276, 'NA', 1, 4, 2, null, 2, 206, 134376, 152700, 'Naperville', 'Illinois', 41.7508, -88.1535, 'North America demand generation lead for branch 2 and account 16.', 'Converted after discovery.', null, date '2025-03-03', 16);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (17, 17, 17, 'NA', 4, 4, 3, null, 3, 212, 178112, 202400, 'Houston', 'Texas', 29.7604, -95.3698, 'North America demand generation lead for branch 3 and account 17.', 'Converted after discovery.', null, date '2025-03-07', 17);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (18, 18, 18, 'NA', 4, 4, 4, null, 4, 218, 158488, 180100, 'Portland', 'Oregon', 45.5152, -122.6784, 'North America demand generation lead for branch 4 and account 18.', 'Converted after discovery.', null, date '2025-03-05', 18);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (19, 19, 19, 'NA', 4, 4, 5, null, 5, 224, 170544, 193800, 'Kitchener', 'Ontario', 43.4516, -80.4925, 'North America demand generation lead for branch 5 and account 19.', 'Converted after discovery.', null, date '2025-03-09', 19);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (20, 20, 280, 'NA', 4, 4, 6, null, 6, 230, 182600, 207500, 'Vancouver', 'British Columbia', 49.2827, -123.1207, 'North America demand generation lead for branch 6 and account 20.', 'Converted after discovery.', null, date '2025-03-13', 20);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (21, 21, 21, 'NA', 4, 4, 7, null, 7, 231, 194656, 221200, 'Guadalajara', 'Jalisco', 20.6597, -103.3496, 'North America demand generation lead for branch 7 and account 21.', 'Converted after discovery.', null, date '2025-03-17', 21);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (22, 22, 22, 'NA', 4, 4, 1, null, 1, 202, 180840, 205500, 'Jersey City', 'New Jersey', 40.7178, -74.0431, 'North America demand generation lead for branch 1 and account 22.', 'Converted after discovery.', null, date '2025-03-21', 22);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (23, 23, 23, 'NA', 4, 4, 2, null, 2, 208, 192896, 219200, 'Indianapolis', 'Indiana', 39.7684, -86.1581, 'North America demand generation lead for branch 2 and account 23.', 'Converted after discovery.', null, date '2025-03-25', 23);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (24, 24, 284, 'NA', 4, 4, 3, null, 3, 214, 204952, 232900, 'Oklahoma City', 'Oklahoma', 35.4676, -97.5164, 'North America demand generation lead for branch 3 and account 24.', 'Converted after discovery.', null, date '2025-03-23', 24);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (25, 25, 25, 'NA', 1, 4, 4, null, 4, 220, 116688, 132600, 'San Francisco', 'California', 37.7749, -122.4194, 'North America demand generation lead for branch 4 and account 25.', 'Converted after discovery.', null, date '2025-03-27', 25);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (281, 21, 21, 'NA', 2, 2, 1, null, 7, 231, 83776, 95200, 'Guadalajara', 'Jalisco', 20.6597, -103.3496, 'North America demand generation lead for branch 7 and account 21.', 'Lead is in active qualification with buying team.', date '2025-01-29', date '2025-01-19', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (282, 22, 22, 'NA', 2, 2, 2, null, 1, 202, 69960, 79500, 'Jersey City', 'New Jersey', 40.7178, -74.0431, 'North America demand generation lead for branch 1 and account 22.', 'Lead is in active qualification with buying team.', date '2025-01-28', date '2025-01-17', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (283, 23, 23, 'NA', 2, 2, 3, null, 2, 208, 82016, 93200, 'Indianapolis', 'Indiana', 39.7684, -86.1581, 'North America demand generation lead for branch 2 and account 23.', 'Lead is in active qualification with buying team.', date '2025-02-02', date '2025-01-21', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (284, 24, 284, 'NA', 2, 2, 4, null, 3, 214, 94072, 106900, 'Oklahoma City', 'Oklahoma', 35.4676, -97.5164, 'North America demand generation lead for branch 3 and account 24.', 'Lead is in active qualification with buying team.', date '2025-02-07', date '2025-01-25', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (285, 25, 25, 'NA', 2, 2, 5, null, 4, 220, 106128, 120600, 'San Francisco', 'California', 37.7749, -122.4194, 'North America demand generation lead for branch 4 and account 25.', 'Lead is in active qualification with buying team.', date '2025-02-12', date '2025-01-29', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (286, 26, 26, 'NA', 2, 2, 6, null, 5, 221, 118184, 134300, 'Ottawa', 'Ontario', 45.4215, -75.6972, 'North America demand generation lead for branch 5 and account 26.', 'Lead is in active qualification with buying team.', date '2025-02-17', date '2025-02-02', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (287, 27, 27, 'NA', 2, 2, 7, null, 6, 227, 130240, 148000, 'Edmonton', 'Alberta', 53.5461, -113.4938, 'North America demand generation lead for branch 6 and account 27.', 'Lead is in active qualification with buying team.', date '2025-02-22', date '2025-02-06', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (288, 28, 288, 'NA', 2, 2, 1, null, 7, 233, 142296, 161700, 'Queretaro', 'Queretaro', 20.5888, -100.3899, 'North America demand generation lead for branch 7 and account 28.', 'Lead is in active qualification with buying team.', date '2025-02-09', date '2025-02-04', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (289, 29, 29, 'NA', 2, 2, 2, null, 1, 204, 59840, 68000, 'White Plains', 'New York', 41.034, -73.7629, 'North America demand generation lead for branch 1 and account 29.', 'Lead is in active qualification with buying team.', date '2025-02-14', date '2025-02-08', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (290, 30, 30, 'NA', 2, 2, 3, null, 2, 210, 87736, 99700, 'Chicago', 'Illinois', 41.8781, -87.6298, 'North America demand generation lead for branch 2 and account 30.', 'Lead is in active qualification with buying team.', date '2025-02-19', date '2025-02-12', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (291, 31, 31, 'NA', 3, 2, 4, null, 3, 211, 52272, 59400, 'Austin', 'Texas', 30.2672, -97.7431, 'North America demand generation lead for branch 3 and account 31.', 'Lead is in active qualification with buying team.', date '2025-02-24', date '2025-02-16', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (292, 32, 292, 'NA', 2, 2, 5, null, 4, 217, 64328, 73100, 'Seattle', 'Washington', 47.6062, -122.3321, 'North America demand generation lead for branch 4 and account 32.', 'Lead is in active qualification with buying team.', date '2025-03-01', date '2025-02-20', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (293, 33, 33, 'NA', 2, 2, 6, null, 5, 223, 76384, 86800, 'Mississauga', 'Ontario', 43.589, -79.6441, 'North America demand generation lead for branch 5 and account 33.', 'Lead is in active qualification with buying team.', date '2025-03-06', date '2025-02-24', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (294, 34, 34, 'NA', 2, 2, 7, null, 6, 229, 88440, 100500, 'Surrey', 'British Columbia', 49.1913, -122.849, 'North America demand generation lead for branch 6 and account 34.', 'Lead is in active qualification with buying team.', date '2025-03-05', date '2025-02-22', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (295, 35, 35, 'NA', 2, 2, 1, null, 7, 235, 100496, 114200, 'Mexico City', 'Ciudad de Mexico', 19.4326, -99.1332, 'North America demand generation lead for branch 7 and account 35.', 'Lead is in active qualification with buying team.', date '2025-03-10', date '2025-02-26', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (296, 36, 296, 'NA', 2, 2, 2, null, 1, 201, 86680, 98500, 'Newark', 'New Jersey', 40.7357, -74.1724, 'North America demand generation lead for branch 1 and account 36.', 'Lead is in active qualification with buying team.', date '2025-03-15', date '2025-03-02', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (297, 37, 37, 'NA', 2, 2, 3, null, 2, 207, 98736, 112200, 'Milwaukee', 'Wisconsin', 43.0389, -87.9065, 'North America demand generation lead for branch 2 and account 37.', 'Lead is in active qualification with buying team.', date '2025-03-20', date '2025-03-06', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (298, 38, 38, 'NA', 2, 2, 4, null, 3, 213, 110792, 125900, 'San Antonio', 'Texas', 29.4241, -98.4936, 'North America demand generation lead for branch 3 and account 38.', 'Lead is in active qualification with buying team.', date '2025-03-25', date '2025-03-10', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (299, 39, 39, 'NA', 2, 2, 5, null, 4, 219, 122848, 139600, 'Sacramento', 'California', 38.5816, -121.4944, 'North America demand generation lead for branch 4 and account 39.', 'Lead is in active qualification with buying team.', date '2025-03-30', date '2025-03-14', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (300, 40, 300, 'NA', 2, 2, 6, null, 5, 225, 134904, 153300, 'Toronto', 'Ontario', 43.6532, -79.3832, 'North America demand generation lead for branch 5 and account 40.', 'Lead is in active qualification with buying team.', date '2025-03-17', date '2025-03-12', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (301, 41, 41, 'NA', 3, 2, 7, null, 6, 226, 46640, 53000, 'Calgary', 'Alberta', 51.0447, -114.0719, 'North America demand generation lead for branch 6 and account 41.', 'Lead is in active qualification with buying team.', date '2025-03-22', date '2025-03-16', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (302, 42, 42, 'NA', 2, 2, 1, null, 7, 232, 58696, 66700, 'Monterrey', 'Nuevo Leon', 25.6866, -100.3161, 'North America demand generation lead for branch 7 and account 42.', 'Lead is in active qualification with buying team.', date '2025-03-27', date '2025-03-20', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (303, 43, 43, 'NA', 3, 2, 2, null, 1, 203, 44880, 51000, 'Stamford', 'Connecticut', 41.0534, -73.5387, 'North America demand generation lead for branch 1 and account 43.', 'Lead is in active qualification with buying team.', date '2025-04-01', date '2025-03-24', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (304, 44, 304, 'NA', 2, 2, 3, null, 2, 209, 56936, 64700, 'Minneapolis', 'Minnesota', 44.9778, -93.265, 'North America demand generation lead for branch 2 and account 44.', 'Lead is in active qualification with buying team.', date '2025-04-06', date '2025-03-28', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (305, 45, 45, 'NA', 2, 2, 4, null, 3, 215, 68992, 78400, 'Dallas', 'Texas', 32.7767, -96.797, 'North America demand generation lead for branch 3 and account 45.', 'Lead is in active qualification with buying team.', date '2025-04-11', date '2025-04-01', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (306, 46, 46, 'NA', 2, 2, 5, null, 4, 216, 112728, 128100, 'San Jose', 'California', 37.3382, -121.8863, 'North America demand generation lead for branch 4 and account 46.', 'Lead is in active qualification with buying team.', date '2025-04-10', date '2025-03-30', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (307, 47, 47, 'NA', 2, 2, 6, null, 5, 222, 93104, 105800, 'Montreal', 'Quebec', 45.5017, -73.5673, 'North America demand generation lead for branch 5 and account 47.', 'Lead is in active qualification with buying team.', date '2025-04-15', date '2025-04-03', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (308, 48, 308, 'NA', 2, 2, 7, null, 6, 228, 105160, 119500, 'Victoria', 'British Columbia', 48.4284, -123.3656, 'North America demand generation lead for branch 6 and account 48.', 'Lead is in active qualification with buying team.', date '2025-04-20', date '2025-04-07', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (309, 49, 49, 'NA', 2, 2, 1, null, 7, 234, 117216, 133200, 'Puebla', 'Puebla', 19.0414, -98.2063, 'North America demand generation lead for branch 7 and account 49.', 'Lead is in active qualification with buying team.', date '2025-04-25', date '2025-04-11', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (310, 50, 50, 'NA', 2, 2, 2, null, 1, 205, 103400, 117500, 'New York', 'New York', 40.7128, -74.006, 'North America demand generation lead for branch 1 and account 50.', 'Lead is in active qualification with buying team.', date '2025-04-30', date '2025-04-15', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (311, 51, 51, 'NA', 2, 2, 3, null, 2, 206, 115456, 131200, 'Naperville', 'Illinois', 41.7508, -88.1535, 'North America demand generation lead for branch 2 and account 51.', 'Lead is in active qualification with buying team.', date '2025-05-05', date '2025-04-19', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (312, 52, 312, 'NA', 2, 2, 4, null, 3, 212, 127512, 144900, 'Houston', 'Texas', 29.7604, -95.3698, 'North America demand generation lead for branch 3 and account 52.', 'Lead is in active qualification with buying team.', date '2025-04-22', date '2025-04-17', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (313, 53, 53, 'NA', 3, 2, 5, null, 4, 218, 39248, 44600, 'Portland', 'Oregon', 45.5152, -122.6784, 'North America demand generation lead for branch 4 and account 53.', 'Lead is in active qualification with buying team.', date '2025-04-27', date '2025-04-21', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (314, 54, 54, 'NA', 3, 2, 6, null, 5, 224, 51304, 58300, 'Kitchener', 'Ontario', 43.4516, -80.4925, 'North America demand generation lead for branch 5 and account 54.', 'Lead is in active qualification with buying team.', date '2025-05-02', date '2025-04-25', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (315, 55, 55, 'NA', 2, 2, 7, null, 6, 230, 63360, 72000, 'Vancouver', 'British Columbia', 49.2827, -123.1207, 'North America demand generation lead for branch 6 and account 55.', 'Lead is in active qualification with buying team.', date '2025-05-07', date '2025-04-29', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (316, 56, 316, 'NA', 2, 2, 1, null, 7, 231, 75416, 85700, 'Guadalajara', 'Jalisco', 20.6597, -103.3496, 'North America demand generation lead for branch 7 and account 56.', 'Lead is in active qualification with buying team.', date '2025-05-12', date '2025-05-03', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (317, 57, 57, 'NA', 2, 2, 2, null, 1, 202, 61600, 70000, 'Jersey City', 'New Jersey', 40.7178, -74.0431, 'North America demand generation lead for branch 1 and account 57.', 'Lead is in active qualification with buying team.', date '2025-05-17', date '2025-05-07', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (318, 58, 58, 'NA', 2, 2, 3, null, 2, 208, 73656, 83700, 'Indianapolis', 'Indiana', 39.7684, -86.1581, 'North America demand generation lead for branch 2 and account 58.', 'Lead is in active qualification with buying team.', date '2025-05-16', date '2025-05-05', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (319, 59, 59, 'NA', 2, 2, 4, null, 3, 214, 133232, 151400, 'Oklahoma City', 'Oklahoma', 35.4676, -97.5164, 'North America demand generation lead for branch 3 and account 59.', 'Lead is in active qualification with buying team.', date '2025-05-21', date '2025-05-09', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (320, 60, 320, 'NA', 2, 2, 5, null, 4, 220, 97768, 111100, 'San Francisco', 'California', 37.7749, -122.4194, 'North America demand generation lead for branch 4 and account 60.', 'Lead is in active qualification with buying team.', date '2025-05-26', date '2025-05-13', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (321, 61, 61, 'NA', 2, 2, 6, null, 5, 221, 109824, 124800, 'Ottawa', 'Ontario', 45.4215, -75.6972, 'North America demand generation lead for branch 5 and account 61.', 'Lead is in active qualification with buying team.', date '2025-05-31', date '2025-05-17', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (322, 62, 62, 'NA', 2, 2, 7, null, 6, 227, 121880, 138500, 'Edmonton', 'Alberta', 53.5461, -113.4938, 'North America demand generation lead for branch 6 and account 62.', 'Lead is in active qualification with buying team.', date '2025-06-05', date '2025-05-21', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (323, 63, 63, 'NA', 4, 2, 1, null, 7, 233, 165616, 188200, 'Queretaro', 'Queretaro', 20.5888, -100.3899, 'North America demand generation lead for branch 7 and account 63.', 'Lead is in active qualification with buying team.', date '2025-06-10', date '2025-05-25', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (324, 64, 324, 'NA', 2, 2, 2, null, 1, 204, 120120, 136500, 'White Plains', 'New York', 41.034, -73.7629, 'North America demand generation lead for branch 1 and account 64.', 'Lead is in active qualification with buying team.', date '2025-05-28', date '2025-05-23', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (325, 65, 65, 'NA', 3, 2, 3, null, 2, 210, 31856, 36200, 'Chicago', 'Illinois', 41.8781, -87.6298, 'North America demand generation lead for branch 2 and account 65.', 'Lead is in active qualification with buying team.', date '2025-06-02', date '2025-05-27', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (326, 66, 66, 'NA', 3, 2, 4, null, 3, 211, 43912, 49900, 'Austin', 'Texas', 30.2672, -97.7431, 'North America demand generation lead for branch 3 and account 66.', 'Lead is in active qualification with buying team.', date '2025-06-07', date '2025-05-31', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (327, 67, 67, 'NA', 2, 2, 5, null, 4, 217, 55968, 63600, 'Seattle', 'Washington', 47.6062, -122.3321, 'North America demand generation lead for branch 4 and account 67.', 'Lead is in active qualification with buying team.', date '2025-06-12', date '2025-06-04', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (328, 68, 328, 'NA', 2, 2, 6, null, 5, 223, 68024, 77300, 'Mississauga', 'Ontario', 43.589, -79.6441, 'North America demand generation lead for branch 5 and account 68.', 'Lead is in active qualification with buying team.', date '2025-06-17', date '2025-06-08', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (329, 69, 69, 'NA', 2, 2, 7, null, 6, 229, 80080, 91000, 'Surrey', 'British Columbia', 49.1913, -122.849, 'North America demand generation lead for branch 6 and account 69.', 'Lead is in active qualification with buying team.', date '2025-06-22', date '2025-06-12', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (330, 70, 70, 'NA', 2, 2, 1, null, 7, 235, 92136, 104700, 'Mexico City', 'Ciudad de Mexico', 19.4326, -99.1332, 'North America demand generation lead for branch 7 and account 70.', 'Lead is in active qualification with buying team.', date '2025-06-21', date '2025-06-10', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (331, 71, 71, 'NA', 2, 2, 2, null, 1, 201, 78320, 89000, 'Newark', 'New Jersey', 40.7357, -74.1724, 'North America demand generation lead for branch 1 and account 71.', 'Lead is in active qualification with buying team.', date '2025-06-26', date '2025-06-14', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (332, 72, 332, 'NA', 2, 2, 3, null, 2, 207, 90376, 102700, 'Milwaukee', 'Wisconsin', 43.0389, -87.9065, 'North America demand generation lead for branch 2 and account 72.', 'Lead is in active qualification with buying team.', date '2025-07-01', date '2025-06-18', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (333, 73, 73, 'NA', 2, 2, 4, null, 3, 213, 102432, 116400, 'San Antonio', 'Texas', 29.4241, -98.4936, 'North America demand generation lead for branch 3 and account 73.', 'Lead is in active qualification with buying team.', date '2025-07-06', date '2025-06-22', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (334, 74, 74, 'NA', 2, 2, 5, null, 4, 219, 114488, 130100, 'Sacramento', 'California', 38.5816, -121.4944, 'North America demand generation lead for branch 4 and account 74.', 'Lead is in active qualification with buying team.', date '2025-07-11', date '2025-06-26', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (335, 75, 75, 'NA', 2, 2, 6, null, 5, 225, 126544, 143800, 'Toronto', 'Ontario', 43.6532, -79.3832, 'North America demand generation lead for branch 5 and account 75.', 'Lead is in active qualification with buying team.', date '2025-07-16', date '2025-06-30', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (336, 76, 336, 'NA', 2, 1, 7, null, 6, 226, 138600, 157500, 'Calgary', 'Alberta', 51.0447, -114.0719, 'North America demand generation lead for branch 6 and account 76.', 'Lead is awaiting first structured outreach.', date '2025-06-27', date '2025-06-22', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (337, 77, 77, 'NA', 3, 1, 1, null, 7, 232, 50336, 57200, 'Monterrey', 'Nuevo Leon', 25.6866, -100.3161, 'North America demand generation lead for branch 7 and account 77.', 'Lead is awaiting first structured outreach.', date '2025-07-02', date '2025-06-26', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (338, 78, 78, 'NA', 3, 1, 2, null, 1, 203, 36520, 41500, 'Stamford', 'Connecticut', 41.0534, -73.5387, 'North America demand generation lead for branch 1 and account 78.', 'Lead is awaiting first structured outreach.', date '2025-07-07', date '2025-06-30', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (339, 79, 79, 'NA', 3, 1, 3, null, 2, 209, 48576, 55200, 'Minneapolis', 'Minnesota', 44.9778, -93.265, 'North America demand generation lead for branch 2 and account 79.', 'Lead is awaiting first structured outreach.', date '2025-07-09', date '2025-07-01', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (340, 80, 340, 'NA', 2, 1, 4, null, 3, 215, 92312, 104900, 'Dallas', 'Texas', 32.7767, -96.797, 'North America demand generation lead for branch 3 and account 80.', 'Lead is awaiting first structured outreach.', date '2025-07-14', date '2025-07-05', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (341, 81, 81, 'NA', 2, 1, 5, null, 4, 216, 72688, 82600, 'San Jose', 'California', 37.3382, -121.8863, 'North America demand generation lead for branch 4 and account 81.', 'Lead is awaiting first structured outreach.', date '2025-07-19', date '2025-07-09', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (342, 82, 82, 'NA', 2, 1, 6, null, 5, 222, 84744, 96300, 'Montreal', 'Quebec', 45.5017, -73.5673, 'North America demand generation lead for branch 5 and account 82.', 'Lead is awaiting first structured outreach.', date '2025-07-21', date '2025-07-10', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (343, 83, 83, 'NA', 2, 1, 7, null, 6, 228, 96800, 110000, 'Victoria', 'British Columbia', 48.4284, -123.3656, 'North America demand generation lead for branch 6 and account 83.', 'Lead is awaiting first structured outreach.', date '2025-07-26', date '2025-07-14', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (344, 84, 344, 'NA', 2, 1, 1, null, 7, 234, 108856, 123700, 'Puebla', 'Puebla', 19.0414, -98.2063, 'North America demand generation lead for branch 7 and account 84.', 'Lead is awaiting first structured outreach.', date '2025-07-31', date '2025-07-18', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (345, 85, 85, 'NA', 2, 1, 2, null, 1, 205, 95040, 108000, 'New York', 'New York', 40.7128, -74.006, 'North America demand generation lead for branch 1 and account 85.', 'Lead is awaiting first structured outreach.', date '2025-08-02', date '2025-07-19', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (346, 86, 86, 'NA', 2, 1, 3, null, 2, 206, 107096, 121700, 'Naperville', 'Illinois', 41.7508, -88.1535, 'North America demand generation lead for branch 2 and account 86.', 'Lead is awaiting first structured outreach.', date '2025-08-07', date '2025-07-23', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (347, 87, 87, 'NA', 2, 1, 4, null, 3, 212, 119152, 135400, 'Houston', 'Texas', 29.7604, -95.3698, 'North America demand generation lead for branch 3 and account 87.', 'Lead is awaiting first structured outreach.', date '2025-08-12', date '2025-07-27', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (348, 88, 348, 'NA', 4, 1, 5, null, 4, 218, 178728, 203100, 'Portland', 'Oregon', 45.5152, -122.6784, 'North America demand generation lead for branch 4 and account 88.', 'Lead is awaiting first structured outreach.', date '2025-08-02', date '2025-07-28', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (349, 89, 89, 'NA', 3, 1, 6, null, 5, 224, 42944, 48800, 'Kitchener', 'Ontario', 43.4516, -80.4925, 'North America demand generation lead for branch 5 and account 89.', 'Lead is awaiting first structured outreach.', date '2025-08-07', date '2025-08-01', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (350, 90, 90, 'NA', 2, 1, 7, null, 6, 230, 55000, 62500, 'Vancouver', 'British Columbia', 49.2827, -123.1207, 'North America demand generation lead for branch 6 and account 90.', 'Lead is awaiting first structured outreach.', date '2025-08-12', date '2025-08-05', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (381, 121, 121, 'NA', 2, 3, 3, null, 2, 206, 98736, 112200, 'Naperville', 'Illinois', 41.7508, -88.1535, 'North America demand generation lead for branch 2 and account 121.', 'Lead remains in nurture due to timing.', date '2025-12-05', date '2025-11-21', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (382, 122, 122, 'NA', 2, 3, 4, null, 3, 212, 110792, 125900, 'Houston', 'Texas', 29.7604, -95.3698, 'North America demand generation lead for branch 3 and account 122.', 'Lead remains in nurture due to timing.', date '2025-12-10', date '2025-11-25', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (383, 123, 123, 'NA', 2, 3, 5, null, 4, 218, 122848, 139600, 'Portland', 'Oregon', 45.5152, -122.6784, 'North America demand generation lead for branch 4 and account 123.', 'Lead remains in nurture due to timing.', date '2025-12-15', date '2025-11-29', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (384, 124, 384, 'NA', 2, 3, 6, null, 5, 224, 134904, 153300, 'Kitchener', 'Ontario', 43.4516, -80.4925, 'North America demand generation lead for branch 5 and account 124.', 'Lead remains in nurture due to timing.', date '2025-12-08', date '2025-12-03', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (385, 125, 125, 'NA', 3, 3, 7, null, 6, 230, 46640, 53000, 'Vancouver', 'British Columbia', 49.2827, -123.1207, 'North America demand generation lead for branch 6 and account 125.', 'Lead remains in nurture due to timing.', date '2025-12-06', date '2025-11-30', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (386, 126, 126, 'NA', 2, 3, 1, null, 7, 231, 58696, 66700, 'Guadalajara', 'Jalisco', 20.6597, -103.3496, 'North America demand generation lead for branch 7 and account 126.', 'Lead remains in nurture due to timing.', date '2025-12-11', date '2025-12-04', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (387, 127, 127, 'NA', 3, 3, 2, null, 1, 202, 44880, 51000, 'Jersey City', 'New Jersey', 40.7178, -74.0431, 'North America demand generation lead for branch 1 and account 127.', 'Lead remains in nurture due to timing.', date '2025-12-16', date '2025-12-08', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (388, 128, 388, 'NA', 2, 3, 3, null, 2, 208, 56936, 64700, 'Indianapolis', 'Indiana', 39.7684, -86.1581, 'North America demand generation lead for branch 2 and account 128.', 'Lead remains in nurture due to timing.', date '2025-12-21', date '2025-12-12', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (389, 129, 129, 'NA', 2, 3, 4, null, 3, 214, 68992, 78400, 'Oklahoma City', 'Oklahoma', 35.4676, -97.5164, 'North America demand generation lead for branch 3 and account 129.', 'Lead remains in nurture due to timing.', date '2025-12-26', date '2025-12-16', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (390, 130, 130, 'NA', 2, 3, 5, null, 4, 220, 81048, 92100, 'San Francisco', 'California', 37.7749, -122.4194, 'North America demand generation lead for branch 4 and account 130.', 'Lead remains in nurture due to timing.', date '2025-12-31', date '2025-12-20', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (391, 131, 131, 'NA', 2, 3, 6, null, 5, 221, 124784, 141800, 'Ottawa', 'Ontario', 45.4215, -75.6972, 'North America demand generation lead for branch 5 and account 131.', 'Lead remains in nurture due to timing.', date '2026-01-05', date '2025-12-24', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (392, 132, 132, 'NA', 2, 3, 7, null, 6, 227, 105160, 119500, 'Edmonton', 'Alberta', 53.5461, -113.4938, 'North America demand generation lead for branch 6 and account 132.', 'Lead remains in nurture due to timing.', date '2026-01-03', date '2025-12-21', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (393, 133, 133, 'NA', 2, 3, 1, null, 7, 233, 117216, 133200, 'Queretaro', 'Queretaro', 20.5888, -100.3899, 'North America demand generation lead for branch 7 and account 133.', 'Lead remains in nurture due to timing.', date '2026-01-08', date '2025-12-25', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (394, 134, 134, 'NA', 2, 3, 2, null, 1, 204, 103400, 117500, 'White Plains', 'New York', 41.034, -73.7629, 'North America demand generation lead for branch 1 and account 134.', 'Lead remains in nurture due to timing.', date '2026-01-13', date '2025-12-29', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (395, 135, 135, 'NA', 2, 3, 3, null, 2, 210, 115456, 131200, 'Chicago', 'Illinois', 41.8781, -87.6298, 'North America demand generation lead for branch 2 and account 135.', 'Lead remains in nurture due to timing.', date '2026-01-18', date '2026-01-02', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (401, 141, 141, 'NA', 2, 5, 2, 1, 1, 201, 61600, 70000, 'Newark', 'New Jersey', 40.7357, -74.1724, 'North America demand generation lead for branch 1 and account 141.', 'Lead disqualified after qualification review.', null, date '2026-01-16', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (402, 142, 142, 'NA', 2, 5, 3, 2, 2, 207, 73656, 83700, 'Milwaukee', 'Wisconsin', 43.0389, -87.9065, 'North America demand generation lead for branch 2 and account 142.', 'Lead disqualified after qualification review.', null, date '2026-01-14', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (403, 143, 143, 'NA', 2, 5, 4, 3, 3, 213, 85712, 97400, 'San Antonio', 'Texas', 29.4241, -98.4936, 'North America demand generation lead for branch 3 and account 143.', 'Lead disqualified after qualification review.', null, date '2026-01-18', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (404, 144, 144, 'NA', 2, 5, 5, 4, 4, 219, 97768, 111100, 'Sacramento', 'California', 38.5816, -121.4944, 'North America demand generation lead for branch 4 and account 144.', 'Lead disqualified after qualification review.', null, date '2026-01-22', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (405, 145, 145, 'NA', 2, 5, 6, 5, 5, 225, 109824, 124800, 'Toronto', 'Ontario', 43.6532, -79.3832, 'North America demand generation lead for branch 5 and account 145.', 'Lead disqualified after qualification review.', null, date '2026-01-26', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (406, 146, 146, 'NA', 4, 5, 7, 1, 6, 226, 169400, 192500, 'Calgary', 'Alberta', 51.0447, -114.0719, 'North America demand generation lead for branch 6 and account 146.', 'Lead disqualified after qualification review.', null, date '2026-01-30', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (407, 147, 147, 'NA', 2, 5, 1, 2, 7, 232, 133936, 152200, 'Monterrey', 'Nuevo Leon', 25.6866, -100.3161, 'North America demand generation lead for branch 7 and account 147.', 'Lead disqualified after qualification review.', null, date '2026-02-03', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (408, 148, 148, 'NA', 2, 5, 2, 3, 1, 203, 151800, 172500, 'Stamford', 'Connecticut', 41.0534, -73.5387, 'North America demand generation lead for branch 1 and account 148.', 'Lead disqualified after qualification review.', null, date '2026-02-01', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (409, 149, 149, 'NA', 3, 5, 3, 4, 2, 209, 31856, 36200, 'Minneapolis', 'Minnesota', 44.9778, -93.265, 'North America demand generation lead for branch 2 and account 149.', 'Lead disqualified after qualification review.', null, date '2026-02-05', null);
insert into crm_leads (lead_id, account_id, contact_id, lead_subject, lead_type_id, lead_state_id, lead_source_id, lead_disqual_reason_id, branch_id, user_owner_id, budget_amt, expected_value_amt, city, state, latitude, longitude, details, qualification_summary, next_action_date, status_date, converted_customer_id) values (410, 150, 150, 'NA', 3, 5, 4, 5, 3, 215, 43912, 49900, 'Dallas', 'Texas', 32.7767, -96.797, 'North America demand generation lead for branch 3 and account 150.', 'Lead disqualified after qualification review.', null, date '2026-02-09', null);

insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (1, 1, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 201, date '2025-01-13');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (2, 1, 'CONVERTED_CUSTOMER_ID', null, '1', 201, date '2025-01-31');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (3, 2, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 207, date '2025-01-17');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (4, 2, 'CONVERTED_CUSTOMER_ID', null, '2', 207, date '2025-02-04');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (5, 3, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 213, date '2025-01-21');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (6, 3, 'CONVERTED_CUSTOMER_ID', null, '3', 213, date '2025-02-08');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (7, 4, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 219, date '2025-01-25');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (8, 4, 'CONVERTED_CUSTOMER_ID', null, '4', 219, date '2025-02-12');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (9, 5, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 225, date '2025-01-29');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (10, 5, 'CONVERTED_CUSTOMER_ID', null, '5', 225, date '2025-02-11');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (11, 6, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 226, date '2025-02-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (12, 6, 'CONVERTED_CUSTOMER_ID', null, '6', 226, date '2025-02-15');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (13, 7, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 232, date '2025-02-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (14, 7, 'CONVERTED_CUSTOMER_ID', null, '7', 232, date '2025-02-19');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (15, 8, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 203, date '2025-02-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (16, 8, 'CONVERTED_CUSTOMER_ID', null, '8', 203, date '2025-02-23');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (17, 9, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 209, date '2025-02-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (18, 9, 'CONVERTED_CUSTOMER_ID', null, '9', 209, date '2025-02-27');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (19, 10, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 215, date '2025-02-10');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (20, 10, 'CONVERTED_CUSTOMER_ID', null, '10', 215, date '2025-02-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (21, 11, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 216, date '2025-02-14');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (22, 11, 'CONVERTED_CUSTOMER_ID', null, '11', 216, date '2025-03-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (23, 12, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 222, date '2025-02-18');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (24, 12, 'CONVERTED_CUSTOMER_ID', null, '12', 222, date '2025-03-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (25, 13, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 228, date '2025-02-22');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (26, 13, 'CONVERTED_CUSTOMER_ID', null, '13', 228, date '2025-03-10');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (27, 14, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 234, date '2025-02-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (28, 14, 'CONVERTED_CUSTOMER_ID', null, '14', 234, date '2025-03-14');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (29, 15, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 205, date '2025-03-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (30, 15, 'CONVERTED_CUSTOMER_ID', null, '15', 205, date '2025-03-13');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (31, 16, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 206, date '2025-02-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (32, 16, 'CONVERTED_CUSTOMER_ID', null, '16', 206, date '2025-03-17');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (33, 17, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 212, date '2025-03-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (34, 17, 'CONVERTED_CUSTOMER_ID', null, '17', 212, date '2025-03-21');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (35, 18, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 218, date '2025-03-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (36, 18, 'CONVERTED_CUSTOMER_ID', null, '18', 218, date '2025-03-25');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (37, 19, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 224, date '2025-03-10');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (38, 19, 'CONVERTED_CUSTOMER_ID', null, '19', 224, date '2025-03-29');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (39, 20, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 230, date '2025-03-14');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (40, 20, 'CONVERTED_CUSTOMER_ID', null, '20', 230, date '2025-03-28');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (41, 21, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 231, date '2025-03-18');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (42, 21, 'CONVERTED_CUSTOMER_ID', null, '21', 231, date '2025-04-01');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (43, 22, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 202, date '2025-03-22');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (44, 22, 'CONVERTED_CUSTOMER_ID', null, '22', 202, date '2025-04-05');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (45, 23, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 208, date '2025-03-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (46, 23, 'CONVERTED_CUSTOMER_ID', null, '23', 208, date '2025-04-09');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (47, 24, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 214, date '2025-03-22');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (48, 24, 'CONVERTED_CUSTOMER_ID', null, '24', 214, date '2025-04-13');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (49, 25, 'LEAD_STATE_ID', 'NEW', 'CONVERTED', 220, date '2025-03-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (50, 25, 'CONVERTED_CUSTOMER_ID', null, '25', 220, date '2025-04-12');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (421, 281, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 231, date '2025-01-13');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (422, 282, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 202, date '2025-01-17');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (423, 283, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 208, date '2025-01-21');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (424, 284, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 214, date '2025-01-25');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (425, 285, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 220, date '2025-01-29');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (426, 286, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 221, date '2025-02-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (427, 287, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 227, date '2025-02-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (428, 288, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 233, date '2025-02-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (429, 289, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 204, date '2025-02-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (430, 290, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 210, date '2025-02-10');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (431, 291, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 211, date '2025-02-14');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (432, 292, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 217, date '2025-02-18');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (433, 293, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 223, date '2025-02-22');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (434, 294, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 229, date '2025-02-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (435, 295, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 235, date '2025-03-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (436, 296, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 201, date '2025-02-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (437, 297, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 207, date '2025-03-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (438, 298, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 213, date '2025-03-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (439, 299, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 219, date '2025-03-10');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (440, 300, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 225, date '2025-03-14');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (441, 301, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 226, date '2025-03-18');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (442, 302, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 232, date '2025-03-22');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (443, 303, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 203, date '2025-03-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (444, 304, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 209, date '2025-03-22');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (445, 305, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 215, date '2025-03-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (446, 306, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 216, date '2025-03-30');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (447, 307, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 222, date '2025-04-03');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (448, 308, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 228, date '2025-04-07');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (449, 309, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 234, date '2025-04-11');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (450, 310, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 205, date '2025-04-15');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (451, 311, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 206, date '2025-04-19');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (452, 312, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 212, date '2025-04-15');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (453, 313, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 218, date '2025-04-19');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (454, 314, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 224, date '2025-04-23');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (455, 315, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 230, date '2025-04-27');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (456, 316, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 231, date '2025-05-01');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (457, 317, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 202, date '2025-05-05');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (458, 318, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 208, date '2025-05-09');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (459, 319, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 214, date '2025-05-13');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (460, 320, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 220, date '2025-05-09');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (461, 321, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 221, date '2025-05-13');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (462, 322, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 227, date '2025-05-17');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (463, 323, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 233, date '2025-05-21');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (464, 324, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 204, date '2025-05-25');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (465, 325, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 210, date '2025-05-29');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (466, 326, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 211, date '2025-06-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (467, 327, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 217, date '2025-06-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (468, 328, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 223, date '2025-06-02');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (469, 329, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 229, date '2025-06-06');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (470, 330, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 235, date '2025-06-10');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (471, 331, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 201, date '2025-06-14');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (472, 332, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 207, date '2025-06-18');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (473, 333, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 213, date '2025-06-22');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (474, 334, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 219, date '2025-06-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (475, 335, 'LEAD_STATE_ID', 'NEW', 'IN_PROGRESS', 225, date '2025-06-30');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (476, 336, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 226, date '2025-06-26');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (477, 337, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 232, date '2025-06-30');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (478, 338, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 203, date '2025-07-04');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (479, 339, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 209, date '2025-07-08');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (480, 340, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 215, date '2025-07-12');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (481, 341, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 216, date '2025-07-16');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (482, 342, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 222, date '2025-07-20');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (483, 343, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 228, date '2025-07-24');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (484, 344, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 234, date '2025-07-20');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (485, 345, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 205, date '2025-07-24');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (486, 346, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 206, date '2025-07-28');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (487, 347, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 212, date '2025-08-01');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (488, 348, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 218, date '2025-08-05');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (489, 349, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 224, date '2025-08-09');
insert into crm_lead_history (lead_hist_id, lead_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (490, 350, 'LEAD_STATE_ID', 'CAPTURED', 'NEW', 230, date '2025-08-13');

insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (1, 1, 1, 1, 7, 3, 201, 1, 'North America CRM expansion opportunity 0001', 132000, 100, date '2025-03-02', date '2025-02-25', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-03-03');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (2, 2, 2, 2, 7, 3, 207, 2, 'North America CRM expansion opportunity 0002', 145700, 100, date '2025-03-08', date '2025-03-02', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-03-10');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (3, 3, 3, 3, 7, 3, 213, 3, 'North America CRM expansion opportunity 0003', 159400, 100, date '2025-03-14', date '2025-03-07', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-03-17');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (4, 4, 4, 264, 7, 3, 219, 1, 'North America CRM expansion opportunity 0004', 173100, 100, date '2025-03-20', date '2025-03-16', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-03-20');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (5, 5, 5, 5, 7, 4, 225, 2, 'North America CRM expansion opportunity 0005', 186800, 100, date '2025-03-26', date '2025-03-21', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-03-27');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (6, 6, 6, 6, 7, 4, 226, 3, 'North America CRM expansion opportunity 0006', 200500, 100, date '2025-03-26', date '2025-03-20', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-03-28');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (7, 7, 7, 7, 7, 4, 232, 1, 'North America CRM expansion opportunity 0007', 214200, 100, date '2025-04-01', date '2025-03-25', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-04-04');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (8, 8, 8, 268, 7, 4, 203, 2, 'North America CRM expansion opportunity 0008', 198500, 100, date '2025-04-07', date '2025-04-03', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-04-07');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (9, 9, 9, 9, 7, 4, 209, 3, 'North America CRM expansion opportunity 0009', 212200, 100, date '2025-04-13', date '2025-04-08', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-04-14');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (10, 10, 10, 10, 7, 4, 215, 1, 'North America CRM expansion opportunity 0010', 225900, 100, date '2025-04-19', date '2025-04-13', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-04-21');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (11, 11, 11, 11, 7, 4, 216, 2, 'North America CRM expansion opportunity 0011', 239600, 100, date '2025-04-25', date '2025-04-18', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-04-28');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (12, 12, 12, 272, 7, 4, 222, 3, 'North America CRM expansion opportunity 0012', 253300, 100, date '2025-04-25', date '2025-04-21', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-04-25');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (13, 13, 13, 13, 7, 3, 228, 1, 'North America CRM expansion opportunity 0013', 153000, 100, date '2025-05-01', date '2025-04-26', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-05-02');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (14, 14, 14, 14, 7, 3, 234, 2, 'North America CRM expansion opportunity 0014', 166700, 100, date '2025-05-07', date '2025-05-01', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-05-09');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (15, 15, 15, 15, 7, 3, 205, 3, 'North America CRM expansion opportunity 0015', 151000, 100, date '2025-05-13', date '2025-05-06', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-05-16');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (16, 16, 16, 276, 7, 3, 206, 1, 'North America CRM expansion opportunity 0016', 164700, 100, date '2025-05-19', date '2025-05-15', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-05-19');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (17, 17, 17, 17, 7, 4, 212, 2, 'North America CRM expansion opportunity 0017', 214400, 100, date '2025-05-25', date '2025-05-20', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-05-26');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (18, 18, 18, 18, 7, 4, 218, 3, 'North America CRM expansion opportunity 0018', 192100, 100, date '2025-05-25', date '2025-05-19', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-05-27');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (19, 19, 19, 19, 7, 4, 224, 1, 'North America CRM expansion opportunity 0019', 205800, 100, date '2025-05-31', date '2025-05-24', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-06-03');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, details, closed_date) values (20, 20, 20, 280, 7, 4, 230, 2, 'North America CRM expansion opportunity 0020', 219500, 100, date '2025-06-06', date '2025-06-02', null, 'Closed won after commercial, security, and rollout alignment.', date '2025-06-06');
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, next_review_date, details, closed_date) values (21, 21, 21, 21, 3, 4, 231, null, 'North America CRM expansion opportunity 0021', 233200, 40, date '2025-07-15', date '2025-02-10', date '2025-03-01', date '2025-03-15', 'Evaluation phase — awaiting technical review from customer IT team.', null);
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, next_review_date, details, closed_date) values (22, 22, 22, 22, 5, 4, 202, null, 'North America CRM expansion opportunity 0022', 217500, 70, date '2025-08-01', date '2025-01-20', date '2025-02-15', date '2025-02-28', 'Negotiation stalled — pending budget approval from CFO.', null);
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, next_review_date, details, closed_date) values (23, 23, 23, 23, 4, 4, 208, null, 'North America CRM expansion opportunity 0023', 231200, 60, date '2025-07-30', date '2025-02-05', date '2025-03-10', date '2025-03-20', 'Proposal submitted — customer reviewing terms and pricing.', null);
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, next_review_date, details, closed_date) values (24, 24, 24, 284, 2, 4, 214, null, 'North America CRM expansion opportunity 0024', 244900, 25, date '2025-09-01', date '2025-01-15', date '2025-02-20', date '2025-03-01', 'Discovery phase — requirements gathering with stakeholders ongoing.', null);
insert into crm_opportunities (opportunity_id, lead_id, account_id, primary_contact_id, opportunity_stage_id, opportunity_category_id, user_owner_id, close_reason_id, opportunity_name, value_amt, probability_pct, expected_close_date, current_stage_date, next_action_date, next_review_date, details, closed_date) values (25, 25, 25, 25, 6, 3, 220, null, 'North America CRM expansion opportunity 0025', 144600, 85, date '2025-07-20', date '2025-02-18', date '2025-03-05', date '2025-03-10', 'Verbal commit received — contract review in progress.', null);

insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (1, 1, null, 1, 201, date '2025-01-14');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (2, 1, 1, 4, 201, date '2025-01-27');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (3, 1, 4, 7, 201, date '2025-02-12');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (1, 1, 'PROBABILITY_PCT', '25', '100', 201, date '2025-02-06');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (2, 1, 'EXPECTED_CLOSE_DATE', '2025-02-20', '2025-03-08', 201, date '2025-02-10');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (4, 2, null, 1, 207, date '2025-01-17');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (5, 2, 1, 4, 207, date '2025-01-31');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (6, 2, 4, 7, 207, date '2025-02-16');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (3, 2, 'PROBABILITY_PCT', '25', '100', 207, date '2025-02-10');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (4, 2, 'EXPECTED_CLOSE_DATE', '2025-02-23', '2025-03-12', 207, date '2025-02-14');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (7, 3, null, 1, 213, date '2025-01-20');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (8, 3, 1, 4, 213, date '2025-02-04');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (9, 3, 4, 7, 213, date '2025-02-20');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (5, 3, 'PROBABILITY_PCT', '25', '100', 213, date '2025-02-14');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (6, 3, 'EXPECTED_CLOSE_DATE', '2025-02-26', '2025-03-16', 213, date '2025-02-18');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (10, 4, null, 1, 219, date '2025-01-23');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (11, 4, 1, 4, 219, date '2025-02-08');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (12, 4, 4, 7, 219, date '2025-02-24');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (7, 4, 'PROBABILITY_PCT', '25', '100', 219, date '2025-02-18');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (8, 4, 'EXPECTED_CLOSE_DATE', '2025-03-01', '2025-03-20', 219, date '2025-02-22');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (13, 5, null, 1, 225, date '2025-01-26');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (14, 5, 1, 4, 225, date '2025-02-12');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (15, 5, 4, 7, 225, date '2025-02-28');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (9, 5, 'PROBABILITY_PCT', '25', '100', 225, date '2025-02-22');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (10, 5, 'EXPECTED_CLOSE_DATE', '2025-03-04', '2025-03-24', 225, date '2025-02-26');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (16, 6, null, 1, 226, date '2025-01-29');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (17, 6, 1, 4, 226, date '2025-02-10');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (18, 6, 4, 7, 226, date '2025-03-04');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (11, 6, 'PROBABILITY_PCT', '25', '100', 226, date '2025-02-26');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (12, 6, 'EXPECTED_CLOSE_DATE', '2025-03-07', '2025-03-28', 226, date '2025-03-02');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (19, 7, null, 1, 232, date '2025-02-01');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (20, 7, 1, 4, 232, date '2025-02-14');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (21, 7, 4, 7, 232, date '2025-03-08');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (13, 7, 'PROBABILITY_PCT', '25', '100', 232, date '2025-03-02');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (14, 7, 'EXPECTED_CLOSE_DATE', '2025-03-10', '2025-04-01', 232, date '2025-03-06');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (22, 8, null, 1, 203, date '2025-02-04');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (23, 8, 1, 4, 203, date '2025-02-18');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (24, 8, 4, 7, 203, date '2025-03-12');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (15, 8, 'PROBABILITY_PCT', '25', '100', 203, date '2025-03-06');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (16, 8, 'EXPECTED_CLOSE_DATE', '2025-03-13', '2025-04-05', 203, date '2025-03-10');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (25, 9, null, 1, 209, date '2025-02-07');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (26, 9, 1, 4, 209, date '2025-02-22');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (27, 9, 4, 7, 209, date '2025-03-07');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (17, 9, 'PROBABILITY_PCT', '25', '100', 209, date '2025-03-10');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (18, 9, 'EXPECTED_CLOSE_DATE', '2025-03-16', '2025-04-09', 209, date '2025-03-14');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (28, 10, null, 1, 215, date '2025-02-10');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (29, 10, 1, 4, 215, date '2025-02-26');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (30, 10, 4, 7, 215, date '2025-03-11');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (19, 10, 'PROBABILITY_PCT', '25', '100', 215, date '2025-03-04');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (20, 10, 'EXPECTED_CLOSE_DATE', '2025-03-19', '2025-04-13', 215, date '2025-03-08');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (31, 11, null, 1, 216, date '2025-02-13');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (32, 11, 1, 4, 216, date '2025-03-02');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (33, 11, 4, 7, 216, date '2025-03-15');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (21, 11, 'PROBABILITY_PCT', '25', '100', 216, date '2025-03-08');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (22, 11, 'EXPECTED_CLOSE_DATE', '2025-03-22', '2025-04-17', 216, date '2025-03-12');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (34, 12, null, 1, 222, date '2025-02-16');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (35, 12, 1, 4, 222, date '2025-02-28');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (36, 12, 4, 7, 222, date '2025-03-19');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (23, 12, 'PROBABILITY_PCT', '25', '100', 222, date '2025-03-12');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (24, 12, 'EXPECTED_CLOSE_DATE', '2025-03-25', '2025-04-21', 222, date '2025-03-16');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (37, 13, null, 1, 228, date '2025-02-19');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (38, 13, 1, 4, 228, date '2025-03-04');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (39, 13, 4, 7, 228, date '2025-03-23');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (25, 13, 'PROBABILITY_PCT', '25', '100', 228, date '2025-03-16');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (26, 13, 'EXPECTED_CLOSE_DATE', '2025-03-28', '2025-04-25', 228, date '2025-03-20');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (40, 14, null, 1, 234, date '2025-02-22');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (41, 14, 1, 4, 234, date '2025-03-08');


--------------------------------------------------------------------------------
-- Seed segment 2: leads, opportunities, pipeline history, quotes, part 2.
--------------------------------------------------------------------------------



insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (42, 14, 4, 7, 234, date '2025-03-27');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (27, 14, 'PROBABILITY_PCT', '25', '100', 234, date '2025-03-20');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (28, 14, 'EXPECTED_CLOSE_DATE', '2025-03-31', '2025-04-29', 234, date '2025-03-24');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (43, 15, null, 1, 205, date '2025-02-25');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (44, 15, 1, 4, 205, date '2025-03-12');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (45, 15, 4, 7, 205, date '2025-03-31');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (29, 15, 'PROBABILITY_PCT', '25', '100', 205, date '2025-03-24');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (30, 15, 'EXPECTED_CLOSE_DATE', '2025-04-03', '2025-05-03', 205, date '2025-03-28');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (46, 16, null, 1, 206, date '2025-02-28');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (47, 16, 1, 4, 206, date '2025-03-16');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (48, 16, 4, 7, 206, date '2025-04-04');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (31, 16, 'PROBABILITY_PCT', '25', '100', 206, date '2025-03-28');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (32, 16, 'EXPECTED_CLOSE_DATE', '2025-04-06', '2025-05-07', 206, date '2025-04-01');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (49, 17, null, 1, 212, date '2025-03-03');
insert into crm_opportunity_stage_history (opp_stage_hist_id, opportunity_id, old_stage_id, new_stage_id, changed_by_user_id, changed_on) values (50, 17, 1, 4, 212, date '2025-03-20');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (33, 17, 'PROBABILITY_PCT', '25', '100', 212, date '2025-04-01');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (34, 17, 'EXPECTED_CLOSE_DATE', '2025-04-09', '2025-05-11', 212, date '2025-04-05');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (35, 18, 'PROBABILITY_PCT', '25', '100', 218, date '2025-04-05');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (36, 18, 'EXPECTED_CLOSE_DATE', '2025-04-12', '2025-05-15', 218, date '2025-04-09');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (37, 19, 'PROBABILITY_PCT', '25', '100', 224, date '2025-04-09');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (38, 19, 'EXPECTED_CLOSE_DATE', '2025-04-15', '2025-05-19', 224, date '2025-04-13');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (39, 20, 'PROBABILITY_PCT', '25', '100', 230, date '2025-04-03');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (40, 20, 'EXPECTED_CLOSE_DATE', '2025-04-18', '2025-05-03', 230, date '2025-04-07');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (41, 21, 'PROBABILITY_PCT', '25', '100', 231, date '2025-04-07');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (42, 21, 'EXPECTED_CLOSE_DATE', '2025-04-21', '2025-05-07', 231, date '2025-04-11');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (43, 22, 'PROBABILITY_PCT', '25', '100', 202, date '2025-04-11');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (44, 22, 'EXPECTED_CLOSE_DATE', '2025-04-24', '2025-05-11', 202, date '2025-04-15');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (45, 23, 'PROBABILITY_PCT', '25', '100', 208, date '2025-04-15');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (46, 23, 'EXPECTED_CLOSE_DATE', '2025-04-27', '2025-05-15', 208, date '2025-04-19');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (47, 24, 'PROBABILITY_PCT', '25', '100', 214, date '2025-04-19');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (48, 24, 'EXPECTED_CLOSE_DATE', '2025-04-30', '2025-05-19', 214, date '2025-04-23');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (49, 25, 'PROBABILITY_PCT', '25', '100', 220, date '2025-04-23');
insert into crm_opportunity_history (opportunity_hist_id, opportunity_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (50, 25, 'EXPECTED_CLOSE_DATE', '2025-05-03', '2025-05-23', 220, date '2025-04-27');

insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (1, 1, 1, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (2, 1, 261, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (3, 2, 2, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (4, 2, 262, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (5, 3, 3, 1, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (6, 3, 263, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (7, 4, 264, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (8, 4, 4, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (9, 5, 5, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (10, 5, 265, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (11, 6, 6, 1, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (12, 6, 266, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (13, 7, 7, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (14, 7, 267, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (15, 8, 268, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (16, 8, 8, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (17, 9, 9, 1, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (18, 9, 269, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (19, 10, 10, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (20, 10, 270, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (21, 11, 11, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (22, 11, 271, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (23, 12, 272, 1, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (24, 12, 12, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (25, 13, 13, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (26, 13, 273, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (27, 14, 14, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (28, 14, 274, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (29, 15, 15, 1, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (30, 15, 275, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (31, 16, 276, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (32, 16, 16, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (33, 17, 17, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (34, 17, 277, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (35, 18, 18, 1, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (36, 18, 278, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (37, 19, 19, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (38, 19, 279, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (39, 20, 280, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (40, 20, 20, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (41, 21, 21, 1, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (42, 21, 281, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (43, 22, 22, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (44, 22, 282, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (45, 23, 23, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (46, 23, 283, 4, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (47, 24, 284, 1, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (48, 24, 24, 3, 'N');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (49, 25, 25, 2, 'Y');
insert into crm_opportunity_contacts (opportunity_contact_id, opportunity_id, contact_id, contact_role_id, is_primary) values (50, 25, 285, 4, 'N');

--------------------------------------------------------------------------------
-- Quotes, quote lines, and quote history
--------------------------------------------------------------------------------
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (1, 1, 1, 1, 1, 201, 3, 2, 'NA-Q-2025-0001', 1, null, date '2025-02-05', date '2025-03-07', date '2025-02-14', null, 12180, 13754.7, 175574.7, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (2, 2, 2, 2, 2, 207, 3, 2, 'NA-Q-2025-0002', 1, null, date '2025-02-09', date '2025-03-11', date '2025-02-19', null, 9870, 11146.05, 142276.05, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (3, 3, 3, 3, 3, 213, 3, 2, 'NA-Q-2025-0003', 1, null, date '2025-02-13', date '2025-03-15', date '2025-02-24', null, 12880, 14545.2, 185665.2, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (4, 4, 4, 4, 264, 219, 3, 2, 'NA-Q-2025-0004', 1, null, date '2025-02-17', date '2025-03-19', date '2025-03-01', null, 8050, 9090.75, 116040.75, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (5, 5, 5, 5, 5, 225, 3, null, 'NA-Q-2025-0005', 1, null, date '2025-02-21', date '2025-03-23', date '2025-03-06', null, 3780, 6528.6, 56748.6, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote aligned to standard package terms.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (6, 6, 6, 6, 6, 226, 3, 2, 'NA-Q-2025-0006', 1, null, date '2025-02-25', date '2025-03-27', date '2025-03-05', null, 9800, 16926, 147126, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (7, 7, 7, 7, 7, 232, 3, 2, 'NA-Q-2025-0007', 1, null, date '2025-03-01', date '2025-03-31', date '2025-03-10', null, 12530, 26635.2, 193105.2, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (8, 8, 8, 8, 268, 203, 3, 2, 'NA-Q-2025-0008', 1, null, date '2025-03-05', date '2025-04-04', date '2025-03-15', null, 5880, 6640.2, 84760.2, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (9, 9, 9, 9, 9, 209, 3, 2, 'NA-Q-2025-0009', 1, null, date '2025-03-09', date '2025-04-08', date '2025-03-20', null, 7140, 8063.1, 102923.1, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (10, 10, 10, 10, 10, 215, 3, null, 'NA-Q-2025-0010', 1, null, date '2025-03-13', date '2025-04-12', date '2025-03-25', null, 2520, 2845.8, 36325.8, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote aligned to standard package terms.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (11, 11, 11, 11, 11, 216, 3, 2, 'NA-Q-2025-0011', 1, null, date '2025-03-17', date '2025-04-16', date '2025-03-30', null, 9660, 10908.9, 139248.9, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (12, 12, 12, 12, 272, 222, 3, 2, 'NA-Q-2025-0012', 1, null, date '2025-03-21', date '2025-04-20', date '2025-03-29', null, 11480, 19827.6, 172347.6, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (13, 13, 13, 13, 13, 228, 3, 2, 'NA-Q-2025-0013', 1, null, date '2025-03-25', date '2025-04-24', date '2025-04-03', null, 7140, 12331.8, 107191.8, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (14, 14, 14, 14, 14, 234, 3, 2, 'NA-Q-2025-0014', 1, null, date '2025-03-29', date '2025-04-28', date '2025-04-08', null, 15960, 33926.4, 245966.4, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (15, 15, 15, 15, 15, 205, 3, 2, 'NA-Q-2025-0015', 1, null, date '2025-04-02', date '2025-05-02', date '2025-04-13', null, 14910, 16837.65, 214927.65, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (16, 16, 16, 16, 276, 206, 3, 2, 'NA-Q-2025-0016', 1, null, date '2025-04-06', date '2025-05-06', date '2025-04-18', null, 9240, 10434.6, 133194.6, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (17, 17, 17, 17, 17, 212, 3, 2, 'NA-Q-2025-0017', 1, null, date '2025-04-10', date '2025-05-10', date '2025-04-23', null, 12180, 13754.7, 175574.7, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (18, 18, 18, 18, 18, 218, 3, 2, 'NA-Q-2025-0018', 1, null, date '2025-04-14', date '2025-05-14', date '2025-04-22', null, 19880, 22450.2, 286570.2, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (19, 19, 19, 19, 19, 224, 3, 2, 'NA-Q-2025-0019', 1, null, date '2025-04-18', date '2025-05-18', date '2025-04-27', null, 12180, 21036.6, 182856.6, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (20, 20, 20, 20, 280, 230, 3, 2, 'NA-Q-2025-0020', 1, null, date '2025-04-22', date '2025-05-22', date '2025-05-02', null, 6090, 10518.3, 91428.3, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (21, 21, 21, 21, 21, 231, 3, 2, 'NA-Q-2025-0021', 1, null, date '2025-04-26', date '2025-05-26', date '2025-05-07', null, 15680, 33331.2, 241651.2, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (22, 22, 22, 22, 22, 202, 3, 2, 'NA-Q-2025-0022', 1, null, date '2025-04-30', date '2025-05-30', date '2025-05-12', null, 8050, 9090.75, 116040.75, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (23, 23, 23, 23, 23, 208, 3, 2, 'NA-Q-2025-0023', 1, null, date '2025-05-04', date '2025-06-03', date '2025-05-17', null, 6930, 7825.95, 99895.95, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (24, 24, 24, 24, 284, 214, 3, 2, 'NA-Q-2025-0024', 1, null, date '2025-05-08', date '2025-06-07', date '2025-05-16', null, 9800, 11067, 141267, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');
insert into crm_quotes (quote_id, opportunity_id, account_id, customer_id, contact_id, user_owner_id, quote_status_id, approval_status_id, quote_no, version_no, parent_quote_id, quote_date, expiry_date, accepted_date, rejected_date, discount_amt, tax_amt, total_amt, terms_text, special_notes) values (25, 25, 25, 25, 25, 220, 3, 2, 'NA-Q-2025-0025', 1, null, date '2025-05-12', date '2025-06-11', date '2025-05-21', null, 7910, 8932.65, 114022.65, 'Standard North America commercial terms with annual billing and implementation milestones.', 'Quote routed through approval workflow due to deal size.');

insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (1, 1, 1, 4, 'North America quote line for product 4', 4, 18000, 5040, 5691.6, 72651.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (2, 1, 2, 7, 'North America quote line for product 7', 2, 16000, 2240, 2529.6, 32289.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (3, 1, 3, 10, 'North America quote line for product 10', 2, 35000, 4900, 5533.5, 70633.5);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (4, 2, 1, 5, 'North America quote line for product 5', 2, 30000, 4200, 4743, 60543);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (5, 2, 2, 8, 'North America quote line for product 8', 3, 9000, 1890, 2134.35, 27244.35);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (6, 2, 3, 11, 'North America quote line for product 11', 3, 18000, 3780, 4268.7, 54488.7);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (7, 3, 1, 6, 'North America quote line for product 6', 3, 22000, 4620, 5217.3, 66597.3);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (8, 3, 2, 9, 'North America quote line for product 9', 4, 26000, 7280, 8221.2, 104941.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (9, 3, 3, 12, 'North America quote line for product 12', 1, 14000, 980, 1106.7, 14126.7);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (10, 4, 1, 7, 'North America quote line for product 7', 4, 16000, 4480, 5059.2, 64579.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (11, 4, 2, 10, 'North America quote line for product 10', 1, 35000, 2450, 2766.75, 35316.75);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (12, 4, 3, 13, 'North America quote line for product 13', 2, 8000, 1120, 1264.8, 16144.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (13, 5, 1, 8, 'North America quote line for product 8', 2, 9000, 1260, 2176.2, 18916.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (14, 5, 2, 11, 'North America quote line for product 11', 2, 18000, 2520, 4352.4, 37832.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (15, 6, 1, 9, 'North America quote line for product 9', 3, 26000, 5460, 9430.2, 81970.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (16, 6, 2, 12, 'North America quote line for product 12', 3, 14000, 2940, 5077.8, 44137.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (17, 6, 3, 15, 'North America quote line for product 15', 1, 20000, 1400, 2418, 21018);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (18, 7, 1, 10, 'North America quote line for product 10', 3, 35000, 7350, 15624, 113274);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (19, 7, 2, 13, 'North America quote line for product 13', 1, 8000, 560, 1190.4, 8630.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (20, 7, 3, 16, 'North America quote line for product 16', 3, 6000, 1260, 2678.4, 19418.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (21, 7, 4, 1, 'North America quote line for product 1', 4, 12000, 3360, 7142.4, 51782.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (22, 8, 1, 11, 'North America quote line for product 11', 1, 18000, 1260, 1422.9, 18162.9);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (23, 8, 2, 14, 'North America quote line for product 14', 2, 15000, 2100, 2371.5, 30271.5);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (24, 8, 3, 17, 'North America quote line for product 17', 4, 9000, 2520, 2845.8, 36325.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (25, 9, 1, 12, 'North America quote line for product 12', 2, 14000, 1960, 2213.4, 28253.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (26, 9, 2, 15, 'North America quote line for product 15', 3, 20000, 4200, 4743, 60543);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (27, 9, 3, 18, 'North America quote line for product 18', 2, 7000, 980, 1106.7, 14126.7);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (28, 10, 1, 13, 'North America quote line for product 13', 3, 8000, 1680, 1897.2, 24217.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (29, 10, 2, 16, 'North America quote line for product 16', 2, 6000, 840, 948.6, 12108.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (30, 11, 1, 14, 'North America quote line for product 14', 1, 15000, 1050, 1185.75, 15135.75);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (31, 11, 2, 17, 'North America quote line for product 17', 3, 9000, 1890, 2134.35, 27244.35);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (32, 11, 3, 2, 'North America quote line for product 2', 4, 24000, 6720, 7588.8, 96868.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (33, 12, 1, 15, 'North America quote line for product 15', 2, 20000, 2800, 4836, 42036);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (34, 12, 2, 18, 'North America quote line for product 18', 4, 7000, 1960, 3385.2, 29425.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (35, 12, 3, 3, 'North America quote line for product 3', 2, 48000, 6720, 11606.4, 100886.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (36, 13, 1, 16, 'North America quote line for product 16', 4, 6000, 1680, 2901.6, 25221.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (37, 13, 2, 1, 'North America quote line for product 1', 2, 12000, 1680, 2901.6, 25221.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (38, 13, 3, 4, 'North America quote line for product 4', 3, 18000, 3780, 6528.6, 56748.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (39, 14, 1, 17, 'North America quote line for product 17', 2, 9000, 1260, 2678.4, 19418.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (40, 14, 2, 2, 'North America quote line for product 2', 3, 24000, 5040, 10713.6, 77673.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (41, 14, 3, 5, 'North America quote line for product 5', 4, 30000, 8400, 17856, 129456);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (42, 14, 4, 8, 'North America quote line for product 8', 2, 9000, 1260, 2678.4, 19418.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (43, 15, 1, 18, 'North America quote line for product 18', 3, 7000, 1470, 1660.05, 21190.05);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (44, 15, 2, 3, 'North America quote line for product 3', 4, 48000, 13440, 15177.6, 193737.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (45, 16, 1, 1, 'North America quote line for product 1', 4, 12000, 3360, 3794.4, 48434.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (46, 16, 2, 4, 'North America quote line for product 4', 2, 18000, 2520, 2845.8, 36325.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (47, 16, 3, 7, 'North America quote line for product 7', 3, 16000, 3360, 3794.4, 48434.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (48, 17, 1, 2, 'North America quote line for product 2', 2, 24000, 3360, 3794.4, 48434.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (49, 17, 2, 5, 'North America quote line for product 5', 3, 30000, 6300, 7114.5, 90814.5);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (50, 17, 3, 8, 'North America quote line for product 8', 4, 9000, 2520, 2845.8, 36325.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (51, 18, 1, 3, 'North America quote line for product 3', 3, 48000, 10080, 11383.2, 145303.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (52, 18, 2, 6, 'North America quote line for product 6', 4, 22000, 6160, 6956.4, 88796.4);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (53, 18, 3, 9, 'North America quote line for product 9', 2, 26000, 3640, 4110.6, 52470.6);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (54, 19, 1, 4, 'North America quote line for product 4', 4, 18000, 5040, 8704.8, 75664.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (55, 19, 2, 7, 'North America quote line for product 7', 2, 16000, 2240, 3868.8, 33628.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (56, 19, 3, 10, 'North America quote line for product 10', 2, 35000, 4900, 8463, 73563);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (57, 20, 1, 5, 'North America quote line for product 5', 2, 30000, 4200, 7254, 63054);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (58, 20, 2, 8, 'North America quote line for product 8', 3, 9000, 1890, 3264.3, 28374.3);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (59, 21, 1, 6, 'North America quote line for product 6', 3, 22000, 4620, 9820.8, 71200.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (60, 21, 2, 9, 'North America quote line for product 9', 4, 26000, 7280, 15475.2, 112195.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (61, 21, 3, 12, 'North America quote line for product 12', 1, 14000, 980, 2083.2, 15103.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (62, 21, 4, 15, 'North America quote line for product 15', 2, 20000, 2800, 5952, 43152);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (63, 22, 1, 7, 'North America quote line for product 7', 4, 16000, 4480, 5059.2, 64579.2);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (64, 22, 2, 10, 'North America quote line for product 10', 1, 35000, 2450, 2766.75, 35316.75);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (65, 22, 3, 13, 'North America quote line for product 13', 2, 8000, 1120, 1264.8, 16144.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (66, 23, 1, 8, 'North America quote line for product 8', 2, 9000, 1260, 1422.9, 18162.9);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (67, 23, 2, 11, 'North America quote line for product 11', 2, 18000, 2520, 2845.8, 36325.8);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (68, 23, 3, 14, 'North America quote line for product 14', 3, 15000, 3150, 3557.25, 45407.25);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (69, 24, 1, 9, 'North America quote line for product 9', 3, 26000, 5460, 6165.9, 78705.9);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (70, 24, 2, 12, 'North America quote line for product 12', 3, 14000, 2940, 3320.1, 42380.1);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (71, 24, 3, 15, 'North America quote line for product 15', 1, 20000, 1400, 1581, 20181);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (72, 25, 1, 10, 'North America quote line for product 10', 3, 35000, 7350, 8300.25, 105950.25);
insert into crm_quote_lines (quote_line_id, quote_id, line_no, product_id, description, quantity, unit_price, discount_amt, tax_amt, line_amt) values (73, 25, 2, 13, 'North America quote line for product 13', 1, 8000, 560, 632.4, 8072.4);


--------------------------------------------------------------------------------
-- Seed segment 2: leads, opportunities, pipeline history, quotes, part 3.
--------------------------------------------------------------------------------




insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (1, 1, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 201, date '2025-02-11');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (2, 1, 'TOTAL_AMT', '0', '175574.7', 201, date '2025-02-13');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (3, 2, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 207, date '2025-02-16');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (4, 2, 'TOTAL_AMT', '0', '142276.05', 207, date '2025-02-18');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (5, 3, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 213, date '2025-02-21');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (6, 3, 'TOTAL_AMT', '0', '185665.2', 213, date '2025-02-23');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (7, 4, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 219, date '2025-02-22');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (8, 4, 'TOTAL_AMT', '0', '116040.75', 219, date '2025-02-24');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (9, 5, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 225, date '2025-02-27');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (10, 5, 'TOTAL_AMT', '0', '56748.6', 225, date '2025-03-01');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (11, 6, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 226, date '2025-03-04');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (12, 6, 'TOTAL_AMT', '0', '147126', 226, date '2025-03-06');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (13, 7, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 232, date '2025-03-09');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (14, 7, 'TOTAL_AMT', '0', '193105.2', 232, date '2025-03-11');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (15, 8, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 203, date '2025-03-10');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (16, 8, 'TOTAL_AMT', '0', '84760.2', 203, date '2025-03-12');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (17, 9, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 209, date '2025-03-15');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (18, 9, 'TOTAL_AMT', '0', '102923.1', 209, date '2025-03-17');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (19, 10, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 215, date '2025-03-20');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (20, 10, 'TOTAL_AMT', '0', '36325.8', 215, date '2025-03-22');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (21, 11, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 216, date '2025-03-25');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (22, 11, 'TOTAL_AMT', '0', '139248.9', 216, date '2025-03-27');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (23, 12, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 222, date '2025-03-26');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (24, 12, 'TOTAL_AMT', '0', '172347.6', 222, date '2025-03-28');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (25, 13, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 228, date '2025-03-31');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (26, 13, 'TOTAL_AMT', '0', '107191.8', 228, date '2025-04-02');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (27, 14, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 234, date '2025-04-05');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (28, 14, 'TOTAL_AMT', '0', '245966.4', 234, date '2025-04-07');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (29, 15, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 205, date '2025-04-10');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (30, 15, 'TOTAL_AMT', '0', '214927.65', 205, date '2025-04-12');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (31, 16, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 206, date '2025-04-11');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (32, 16, 'TOTAL_AMT', '0', '133194.6', 206, date '2025-04-13');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (33, 17, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 212, date '2025-04-16');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (34, 17, 'TOTAL_AMT', '0', '175574.7', 212, date '2025-04-18');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (35, 18, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 218, date '2025-04-21');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (36, 18, 'TOTAL_AMT', '0', '286570.2', 218, date '2025-04-23');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (37, 19, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 224, date '2025-04-26');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (38, 19, 'TOTAL_AMT', '0', '182856.6', 224, date '2025-04-28');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (39, 20, 'QUOTE_STATUS_ID', 'DRAFT', 'ACCEPTED', 230, date '2025-04-27');
insert into crm_quote_history (quote_hist_id, quote_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (40, 20, 'TOTAL_AMT', '0', '91428.3', 230, date '2025-04-29');

update crm_leads l
set lead_subject = (
        select substr(
                   case lt.code
                       when 'HOT' then 'Priority'
                       when 'WARM' then 'Qualified'
                       when 'STRATEGIC' then 'Strategic'
                       else 'Pipeline'
                   end || ' lead ' || to_char(l.lead_id) ||
                   case
                       when a.name is not null then ' - ' || substr(a.name, 1, 120)
                       else ' - Standalone prospect'
                   end,
                   1,
                   255
               )
        from crm_lead_types lt
        left join crm_accounts a
          on a.account_id = l.account_id
        where lt.lead_type_id = l.lead_type_id
    );

update crm_leads
set lead_source_id = case
        when mod(lead_id, 37) = 0 then 10
        when mod(lead_id, 35) = 0 then 9
        when mod(lead_id, 33) = 0 then 8
        else lead_source_id
    end;

update crm_leads l
set converted_opportunity_id = (
        select min(o.opportunity_id)
        from crm_opportunities o
        where o.lead_id = l.lead_id
    )
where exists (
    select 1
    from crm_opportunities o
    where o.lead_id = l.lead_id
);

update crm_opportunities
set next_review_date = case
        when opportunity_stage_id in (7, 8) then nvl(closed_date, current_stage_date)
        when opportunity_stage_id in (5, 6) then nvl(next_action_date, current_stage_date) + 3
        when opportunity_stage_id in (3, 4) then nvl(next_action_date, current_stage_date) + 5
        else nvl(next_action_date, current_stage_date) + 7
    end;

update crm_accounts a
set account_relationship_status_id = (
        select case
                   when exists (
                        select 1
                        from crm_customers c
                        where c.account_id = a.account_id
                          and c.customer_status_id = 3
                   ) then 3
                   when exists (
                        select 1
                        from crm_customers c
                        where c.account_id = a.account_id
                          and c.customer_status_id = 4
                   ) then 4
                   when exists (
                        select 1
                        from crm_customers c
                        where c.account_id = a.account_id
                          and c.customer_status_id in (1, 2)
                   ) then 2
                   else 1
               end
        from dual
    );

insert into crm_opportunity_products (opportunity_product_id, opportunity_id, product_id, interest_rank_no, estimated_quantity, estimated_value_amt, interest_notes)
with latest_quotes as (
    select opportunity_id,
           max(version_no) max_version
    from crm_quotes
    group by opportunity_id
),
quoted_products_raw as (
    select q.opportunity_id,
           ql.product_id,
           min(ql.line_no) min_line_no,
           sum(ql.quantity) estimated_quantity,
           round(sum(ql.line_amt), 2) estimated_value_amt
    from crm_quotes q
    join latest_quotes lq
      on lq.opportunity_id = q.opportunity_id
     and lq.max_version = q.version_no
    join crm_quote_lines ql
      on ql.quote_id = q.quote_id
    group by q.opportunity_id, ql.product_id
),
quoted_products as (
    select opportunity_id,
           product_id,
           row_number() over(partition by opportunity_id order by estimated_value_amt desc, min_line_no, product_id) interest_rank_no,
           estimated_quantity,
           estimated_value_amt,
           'Derived from current quote mix.' interest_notes
    from quoted_products_raw
),
open_products as (
    select o.opportunity_id,
           case ranks.rank_no
               when 1 then mod(o.opportunity_id - 1, 18) + 1
               when 2 then mod(o.opportunity_id + 5, 18) + 1
               else mod(o.opportunity_id + 10, 18) + 1
           end product_id,
           ranks.rank_no interest_rank_no,
           greatest(1, round(o.value_amt * case ranks.rank_no when 1 then 0.55 when 2 then 0.30 else 0.15 end / 12000)) estimated_quantity,
           round(o.value_amt * case ranks.rank_no when 1 then 0.55 when 2 then 0.30 else 0.15 end, 2) estimated_value_amt,
           'Modeled from opportunity value before quote.' interest_notes
    from crm_opportunities o
    cross join (
        select 1 rank_no from dual
        union all
        select 2 from dual
        union all
        select 3 from dual
    ) ranks
    where not exists (
              select 1
              from crm_quotes q
              where q.opportunity_id = o.opportunity_id
          )
      and ranks.rank_no <= case
                               when o.opportunity_category_id in (3, 4) then 3
                               else 2
                           end
),
all_products as (
    select opportunity_id,
           product_id,
           interest_rank_no,
           estimated_quantity,
           estimated_value_amt,
           interest_notes
    from quoted_products
    union all
    select opportunity_id,
           product_id,
           interest_rank_no,
           estimated_quantity,
           estimated_value_amt,
           interest_notes
    from open_products
),
numbered_products as (
    select row_number() over(order by opportunity_id, interest_rank_no, product_id) opportunity_product_id,
           opportunity_id,
           product_id,
           interest_rank_no,
           estimated_quantity,
           estimated_value_amt,
           interest_notes
    from all_products
)
select opportunity_product_id,
       opportunity_id,
       product_id,
       interest_rank_no,
       estimated_quantity,
       estimated_value_amt,
       interest_notes
from numbered_products;



--------------------------------------------------------------------------------
-- Seed segment 3: orders, approvals, bookings, invoices, payments.
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Orders, approvals, bookings, invoices, and payments
--------------------------------------------------------------------------------
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (1, 1, 1, 1, 201, 4, 2, 'Y', date '2025-02-17', date '2025-03-02', 120348.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (1, 1, 1, 2, 6, 22000, 4, 5280, 7031.2, 89751.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (2, 1, 2, 4, 11, 18000, 1, 1080, 1438.2, 18358.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (3, 1, 3, 6, 16, 6000, 2, 720, 958.8, 12238.8);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (2, 2, 2, 1, 207, 4, null, 'N', date '2025-02-23', date '2025-03-09', 88731.3);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (4, 2, 1, 3, 7, 16000, 2, 1920, 2556.8, 32636.8);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (5, 2, 2, 4, 12, 14000, 2, 1680, 2237.2, 28557.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (6, 2, 3, 6, 17, 9000, 3, 1620, 2157.3, 27537.3);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (3, 3, 3, 1, 213, 4, null, 'N', date '2025-03-01', date '2025-03-16', 59154.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (7, 3, 1, 3, 8, 9000, 3, 1620, 2157.3, 27537.3);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (8, 3, 2, 5, 13, 8000, 3, 1440, 1917.6, 24477.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (9, 3, 3, 6, 18, 7000, 1, 420, 559.3, 7139.3);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (4, 4, 4, 1, 219, 4, 2, 'Y', date '2025-03-07', date '2025-03-23', 158084.5);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (10, 4, 1, 3, 9, 26000, 4, 6240, 8309.6, 106069.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (11, 4, 2, 5, 14, 15000, 1, 900, 1198.5, 15298.5);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (12, 4, 3, 1, 1, 12000, 3, 2160, 2876.4, 36716.4);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (5, 5, 5, 1, 225, 4, 2, 'Y', date '2025-03-08', date '2025-03-25', 181636.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (13, 5, 1, 4, 10, 35000, 1, 2100, 4277, 37177);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (14, 5, 2, 5, 15, 20000, 2, 2400, 4888, 42488);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (15, 5, 3, 1, 2, 24000, 4, 5760, 11731.2, 101971.2);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (6, 6, 6, 1, 226, 4, 2, 'Y', date '2025-03-08', date '2025-03-26', 159330);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (16, 6, 1, 4, 11, 18000, 2, 2160, 4399.2, 38239.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (17, 6, 2, 6, 16, 6000, 3, 1080, 2199.6, 19119.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (18, 6, 3, 1, 3, 48000, 2, 5760, 11731.2, 101971.2);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (7, 7, 7, 1, 232, 4, 2, 'Y', date '2025-03-14', date '2025-04-02', 114492);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (19, 7, 1, 4, 12, 14000, 3, 2520, 6316.8, 45796.8);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (20, 7, 2, 6, 17, 9000, 1, 540, 1353.6, 9813.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (21, 7, 3, 2, 4, 18000, 3, 3240, 8121.6, 58881.6);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (8, 8, 8, 1, 203, 4, 2, 'Y', date '2025-03-20', date '2025-04-09', 144825.8);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (22, 8, 1, 5, 13, 8000, 1, 480, 639.2, 8159.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (23, 8, 2, 6, 18, 7000, 2, 840, 1118.6, 14278.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (24, 8, 3, 2, 5, 30000, 4, 7200, 9588, 122388);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (9, 9, 9, 1, 209, 4, 2, 'Y', date '2025-03-26', date '2025-04-16', 124427.8);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (25, 9, 1, 5, 14, 15000, 2, 1800, 2397, 30597);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (26, 9, 2, 1, 1, 12000, 4, 2880, 3835.2, 48955.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (27, 9, 3, 2, 6, 22000, 2, 2640, 3515.6, 44875.6);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (10, 10, 10, 1, 215, 4, 2, 'Y', date '2025-03-27', date '2025-04-08', 159104.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (28, 10, 1, 5, 15, 20000, 3, 3600, 4794, 61194);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (29, 10, 2, 1, 2, 24000, 2, 2880, 3835.2, 48955.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (30, 10, 3, 3, 7, 16000, 3, 2880, 3835.2, 48955.2);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (11, 11, 11, 1, 216, 4, 2, 'Y', date '2025-04-02', date '2025-04-15', 189701.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (31, 11, 1, 6, 16, 6000, 1, 360, 479.4, 6119.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (32, 11, 2, 1, 3, 48000, 3, 8640, 11505.6, 146865.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (33, 11, 3, 3, 8, 9000, 4, 2160, 2876.4, 36716.4);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (12, 12, 12, 1, 222, 4, 2, 'Y', date '2025-04-02', date '2025-04-16', 150832.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (34, 12, 1, 6, 17, 9000, 2, 1080, 2199.6, 19119.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (35, 12, 2, 2, 4, 18000, 4, 4320, 8798.4, 76478.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (36, 12, 3, 3, 9, 26000, 2, 3120, 6354.4, 55234.4);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (13, 13, 13, 1, 228, 4, 2, 'Y', date '2025-04-08', date '2025-04-23', 160392.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (37, 13, 1, 6, 18, 7000, 3, 1260, 2566.2, 22306.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (38, 13, 2, 2, 5, 30000, 2, 3600, 7332, 63732);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (39, 13, 3, 4, 10, 35000, 2, 4200, 8554, 74354);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (14, 14, 14, 1, 234, 4, 2, 'Y', date '2025-04-14', date '2025-04-30', 157017.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (40, 14, 1, 1, 1, 12000, 2, 1440, 3609.6, 26169.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (41, 14, 2, 2, 6, 22000, 3, 3960, 9926.4, 71966.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (42, 14, 3, 4, 11, 18000, 3, 3240, 8121.6, 58881.6);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (15, 15, 15, 1, 205, 4, 2, 'Y', date '2025-04-15', date '2025-05-02', 152985);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (43, 15, 1, 1, 2, 24000, 3, 4320, 5752.8, 73432.8);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (44, 15, 2, 3, 7, 16000, 4, 3840, 5113.6, 65273.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (45, 15, 3, 4, 12, 14000, 1, 840, 1118.6, 14278.6);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (16, 16, 16, 1, 206, 4, 2, 'Y', date '2025-04-21', date '2025-05-09', 230497.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (46, 16, 1, 1, 3, 48000, 4, 11520, 15340.8, 195820.8);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (47, 16, 2, 3, 8, 9000, 2, 1080, 1438.2, 18358.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (48, 16, 3, 5, 13, 8000, 2, 960, 1278.4, 16318.4);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (17, 17, 17, 1, 212, 4, 2, 'Y', date '2025-04-27', date '2025-05-16', 162164.1);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (49, 17, 1, 2, 4, 18000, 2, 2160, 2876.4, 36716.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (50, 17, 2, 3, 9, 26000, 3, 4680, 6232.2, 79552.2);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (51, 17, 3, 5, 14, 15000, 3, 2700, 3595.5, 45895.5);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (18, 18, 18, 1, 218, 4, 2, 'Y', date '2025-04-27', date '2025-05-17', 219278.5);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (52, 18, 1, 2, 5, 30000, 3, 5400, 7191, 91791);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (53, 18, 2, 4, 10, 35000, 3, 6300, 8389.5, 107089.5);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (54, 18, 3, 5, 15, 20000, 1, 1200, 1598, 20398);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (19, 19, 19, 1, 224, 4, 2, 'Y', date '2025-05-03', date '2025-05-24', 125339.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (55, 19, 1, 2, 6, 22000, 4, 5280, 10753.6, 93473.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (56, 19, 2, 4, 11, 18000, 1, 1080, 2199.6, 19119.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (57, 19, 3, 6, 16, 6000, 2, 720, 1466.4, 12746.4);
insert into crm_orders (order_id, customer_id, quote_id, order_source_id, user_sales_id, order_status_id, approval_status_id, approval_required, order_date, delivery_date, total_amt) values (20, 20, 20, 1, 230, 4, null, 'N', date '2025-05-04', date '2025-05-16', 92411.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (58, 20, 1, 3, 7, 16000, 2, 1920, 3910.4, 33990.4);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (59, 20, 2, 4, 12, 14000, 2, 1680, 3421.6, 29741.6);
insert into crm_bookings (booking_id, order_id, line_no, product_type_id, product_id, price, quantity, discount_amt, tax_amt, line_amt) values (60, 20, 3, 6, 17, 9000, 3, 1620, 3299.4, 28679.4);

insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (1, 1, 'PRICE', '21340', '22000', 401, date '2025-02-20');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (2, 2, 'PRICE', '17460', '18000', 401, date '2025-02-21');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (3, 3, 'PRICE', '5820', '6000', 401, date '2025-02-22');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (4, 4, 'PRICE', '15520', '16000', 402, date '2025-03-01');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (5, 5, 'PRICE', '13580', '14000', 402, date '2025-03-02');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (6, 6, 'PRICE', '8730', '9000', 402, date '2025-02-25');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (7, 7, 'PRICE', '8730', '9000', 403, date '2025-03-04');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (8, 8, 'PRICE', '7760', '8000', 403, date '2025-03-05');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (9, 9, 'PRICE', '6790', '7000', 403, date '2025-03-06');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (10, 10, 'PRICE', '25220', '26000', 404, date '2025-03-13');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (11, 11, 'PRICE', '14550', '15000', 404, date '2025-03-14');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (12, 12, 'PRICE', '11640', '12000', 404, date '2025-03-09');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (13, 13, 'PRICE', '33950', '35000', 405, date '2025-03-11');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (14, 14, 'PRICE', '19400', '20000', 405, date '2025-03-12');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (15, 15, 'PRICE', '23280', '24000', 405, date '2025-03-13');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (16, 16, 'PRICE', '17460', '18000', 406, date '2025-03-14');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (17, 17, 'PRICE', '5820', '6000', 406, date '2025-03-15');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (18, 18, 'PRICE', '46560', '48000', 406, date '2025-03-10');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (19, 19, 'PRICE', '13580', '14000', 407, date '2025-03-17');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (20, 20, 'PRICE', '8730', '9000', 407, date '2025-03-18');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (21, 21, 'PRICE', '17460', '18000', 407, date '2025-03-19');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (22, 22, 'PRICE', '7760', '8000', 401, date '2025-03-26');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (23, 23, 'PRICE', '6790', '7000', 401, date '2025-03-27');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (24, 24, 'PRICE', '29100', '30000', 401, date '2025-03-22');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (25, 25, 'PRICE', '14550', '15000', 402, date '2025-03-29');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (26, 26, 'PRICE', '11640', '12000', 402, date '2025-03-30');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (27, 27, 'PRICE', '21340', '22000', 402, date '2025-03-31');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (28, 28, 'PRICE', '19400', '20000', 403, date '2025-04-02');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (29, 29, 'PRICE', '23280', '24000', 403, date '2025-04-03');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (30, 30, 'PRICE', '15520', '16000', 403, date '2025-03-29');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (31, 31, 'PRICE', '5820', '6000', 404, date '2025-04-05');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (32, 32, 'PRICE', '46560', '48000', 404, date '2025-04-06');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (33, 33, 'PRICE', '8730', '9000', 404, date '2025-04-07');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (34, 34, 'PRICE', '8730', '9000', 405, date '2025-04-08');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (35, 35, 'PRICE', '17460', '18000', 405, date '2025-04-09');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (36, 36, 'PRICE', '25220', '26000', 405, date '2025-04-04');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (37, 37, 'PRICE', '6790', '7000', 406, date '2025-04-11');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (38, 38, 'PRICE', '29100', '30000', 406, date '2025-04-12');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (39, 39, 'PRICE', '33950', '35000', 406, date '2025-04-13');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (40, 40, 'PRICE', '11640', '12000', 407, date '2025-04-20');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (41, 41, 'PRICE', '21340', '22000', 407, date '2025-04-21');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (42, 42, 'PRICE', '17460', '18000', 407, date '2025-04-16');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (43, 43, 'PRICE', '23280', '24000', 401, date '2025-04-18');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (44, 44, 'PRICE', '15520', '16000', 401, date '2025-04-19');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (45, 45, 'PRICE', '13580', '14000', 401, date '2025-04-20');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (46, 46, 'PRICE', '46560', '48000', 402, date '2025-04-27');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (47, 47, 'PRICE', '8730', '9000', 402, date '2025-04-28');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (48, 48, 'PRICE', '7760', '8000', 402, date '2025-04-23');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (49, 49, 'PRICE', '17460', '18000', 403, date '2025-04-30');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (50, 50, 'PRICE', '25220', '26000', 403, date '2025-05-01');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (51, 51, 'PRICE', '14550', '15000', 403, date '2025-05-02');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (52, 52, 'PRICE', '29100', '30000', 404, date '2025-05-03');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (53, 53, 'PRICE', '33950', '35000', 404, date '2025-05-04');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (54, 54, 'PRICE', '19400', '20000', 404, date '2025-04-29');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (55, 55, 'PRICE', '21340', '22000', 405, date '2025-05-06');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (56, 56, 'PRICE', '17460', '18000', 405, date '2025-05-07');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (57, 57, 'PRICE', '5820', '6000', 405, date '2025-05-08');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (58, 58, 'PRICE', '15520', '16000', 406, date '2025-05-10');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (59, 59, 'PRICE', '13580', '14000', 406, date '2025-05-11');
insert into crm_booking_history (booking_hist_id, booking_id, field_name, old_value, new_value, changed_by_user_id, changed_on) values (60, 60, 'PRICE', '8730', '9000', 406, date '2025-05-06');

insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (1, null, 1, 3, 1, 1, 201, date '2025-02-06', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (2, null, 1, 3, 2, 2, 2, date '2025-02-08', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (3, null, 2, 2, 1, 1, 207, date '2025-02-10', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (4, null, 2, 2, 2, 2, 3, date '2025-02-12', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (5, null, 3, 3, 1, 1, 213, date '2025-02-14', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (6, null, 3, 3, 2, 2, 2, date '2025-02-16', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (7, null, 4, 2, 1, 1, 219, date '2025-02-18', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (8, null, 4, 2, 2, 2, 3, date '2025-02-20', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (9, null, 6, 2, 1, 1, 226, date '2025-02-26', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (10, null, 6, 2, 2, 2, 3, date '2025-02-28', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (11, null, 7, 3, 1, 1, 232, date '2025-03-02', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (12, null, 7, 3, 2, 2, 2, date '2025-03-04', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (13, null, 8, 2, 1, 1, 203, date '2025-03-06', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (14, null, 8, 2, 2, 2, 3, date '2025-03-08', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (15, null, 9, 2, 1, 1, 209, date '2025-03-10', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (16, null, 9, 2, 2, 2, 3, date '2025-03-12', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (17, null, 11, 2, 1, 1, 216, date '2025-03-18', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (18, null, 11, 2, 2, 2, 3, date '2025-03-20', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (19, null, 12, 3, 1, 1, 222, date '2025-03-22', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (20, null, 12, 3, 2, 2, 2, date '2025-03-24', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (21, null, 13, 2, 1, 1, 228, date '2025-03-26', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (22, null, 13, 2, 2, 2, 3, date '2025-03-28', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (23, null, 14, 3, 1, 1, 234, date '2025-03-30', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (24, null, 14, 3, 2, 2, 2, date '2025-04-01', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (25, null, 15, 3, 1, 1, 205, date '2025-04-03', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (26, null, 15, 3, 2, 2, 2, date '2025-04-05', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (27, null, 16, 2, 1, 1, 206, date '2025-04-07', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (28, null, 16, 2, 2, 2, 3, date '2025-04-09', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (29, null, 17, 3, 1, 1, 212, date '2025-04-11', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (30, null, 17, 3, 2, 2, 2, date '2025-04-13', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (31, null, 18, 3, 1, 1, 218, date '2025-04-15', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (32, null, 18, 3, 2, 2, 2, date '2025-04-17', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (33, null, 19, 3, 1, 1, 224, date '2025-04-19', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (34, null, 19, 3, 2, 2, 2, date '2025-04-21', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (35, null, 20, 2, 1, 1, 230, date '2025-04-23', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (36, null, 20, 2, 2, 2, 3, date '2025-04-25', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (37, null, 21, 3, 1, 1, 231, date '2025-04-27', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (38, null, 21, 3, 2, 2, 2, date '2025-04-29', 'Quote approved for commercial release.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (39, null, 22, 2, 1, 1, 202, date '2025-05-01', 'Quote submitted for approval.');
insert into crm_approval_actions (approval_action_id, order_id, quote_id, approval_rule_id, approval_status_id, action_seq_no, actor_user_id, action_on, comments) values (40, null, 22, 2, 2, 2, 3, date '2025-05-03', 'Quote approved for commercial release.');

insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (1, 1, 'NA-INV-2025-00001', 4, date '2025-02-23', date '2025-03-25', 9428.2, 120348.2, 120348.2, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (2, 2, 'NA-INV-2025-00002', 4, date '2025-03-02', date '2025-04-01', 6951.3, 88731.3, 88731.3, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (3, 3, 'NA-INV-2025-00003', 4, date '2025-03-09', date '2025-04-08', 4634.2, 59154.2, 59154.2, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (4, 4, 'NA-INV-2025-00004', 4, date '2025-03-12', date '2025-04-11', 12384.5, 158084.5, 158084.5, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (5, 5, 'NA-INV-2025-00005', 4, date '2025-03-14', date '2025-04-13', 20896.2, 181636.2, 181636.2, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (6, 6, 'NA-INV-2025-00006', 4, date '2025-03-15', date '2025-04-14', 18330, 159330, 159330, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (7, 7, 'NA-INV-2025-00007', 4, date '2025-03-22', date '2025-04-16', 15792, 114492, 114492, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (8, 8, 'NA-INV-2025-00008', 4, date '2025-03-25', date '2025-04-24', 11345.8, 144825.8, 144825.8, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (9, 9, 'NA-INV-2025-00009', 4, date '2025-04-01', date '2025-05-01', 9747.8, 124427.8, 124427.8, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (10, 10, 'NA-INV-2025-00010', 4, date '2025-04-03', date '2025-05-03', 12464.4, 159104.4, 159104.4, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (11, 11, 'NA-INV-2025-00011', 4, date '2025-04-10', date '2025-05-10', 14861.4, 189701.4, 189701.4, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (12, 12, 'NA-INV-2025-00012', 4, date '2025-04-07', date '2025-05-07', 17352.4, 150832.4, 150832.4, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (13, 13, 'NA-INV-2025-00013', 4, date '2025-04-14', date '2025-05-14', 18452.2, 160392.2, 160392.2, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (14, 14, 'NA-INV-2025-00014', 4, date '2025-04-21', date '2025-05-16', 21657.6, 157017.6, 157017.6, 0);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (15, 15, 'NA-INV-2025-00015', 3, date '2025-04-23', date '2025-05-23', 11985, 152985, 76492.5, 76492.5);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (16, 16, 'NA-INV-2025-00016', 3, date '2025-04-26', date '2025-05-26', 18057.4, 230497.4, 115248.7, 115248.7);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (17, 17, 'NA-INV-2025-00017', 3, date '2025-05-03', date '2025-06-02', 12704.1, 162164.1, 81082.05, 81082.05);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (18, 18, 'NA-INV-2025-00018', 3, date '2025-05-04', date '2025-06-03', 17178.5, 219278.5, 109639.25, 109639.25);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (19, 19, 'NA-INV-2025-00019', 3, date '2025-05-11', date '2025-06-10', 14419.6, 125339.6, 62669.8, 62669.8);
insert into crm_invoices (invoice_id, order_id, invoice_no, invoice_status_id, invoice_date, due_date, tax_amt, total_amt, paid_amt, outstanding_amt) values (20, 20, 'NA-INV-2025-00020', 3, date '2025-05-09', date '2025-06-08', 10631.4, 92411.4, 46205.7, 46205.7);

insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (1, 1, date '2025-03-06', 120348.2, 1, 2, 'NA-PAY-000001');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (2, 2, date '2025-03-14', 88731.3, 2, 2, 'NA-PAY-000002');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (3, 3, date '2025-03-22', 59154.2, 3, 2, 'NA-PAY-000003');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (4, 4, date '2025-03-26', 158084.5, 4, 2, 'NA-PAY-000004');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (5, 5, date '2025-03-24', 181636.2, 5, 2, 'NA-PAY-000005');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (6, 6, date '2025-03-26', 159330, 1, 2, 'NA-PAY-000006');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (7, 7, date '2025-04-03', 114492, 2, 2, 'NA-PAY-000007');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (8, 8, date '2025-04-07', 144825.8, 3, 2, 'NA-PAY-000008');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (9, 9, date '2025-04-15', 124427.8, 4, 2, 'NA-PAY-000009');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (10, 10, date '2025-04-13', 159104.4, 5, 2, 'NA-PAY-000010');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (11, 11, date '2025-04-21', 189701.4, 1, 2, 'NA-PAY-000011');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (12, 12, date '2025-04-19', 150832.4, 2, 2, 'NA-PAY-000012');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (13, 13, date '2025-04-27', 160392.2, 3, 2, 'NA-PAY-000013');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (14, 14, date '2025-05-05', 157017.6, 4, 2, 'NA-PAY-000014');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (15, 15, date '2025-05-03', 76492.5, 5, 2, 'NA-PAY-000015');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (16, 16, date '2025-05-07', 115248.7, 1, 2, 'NA-PAY-000016');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (17, 17, date '2025-05-15', 81082.05, 2, 2, 'NA-PAY-000017');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (18, 18, date '2025-05-17', 109639.25, 3, 2, 'NA-PAY-000018');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (19, 19, date '2025-05-25', 62669.8, 4, 2, 'NA-PAY-000019');
insert into crm_payments (payment_id, invoice_id, pay_date, pay_amt, payment_mode_id, payment_status_id, reference_no) values (20, 20, date '2025-05-19', 46205.7, 5, 2, 'NA-PAY-000020');

insert into crm_order_history (order_hist_id, order_id, field_name, old_value, new_value, changed_by_user_id, changed_on)
with order_events as (
    select o.order_id,
           'ORDER_STATUS_ID' field_name,
           case
               when o.approval_required = 'Y' then 'PENDING_APPROVAL'
               else 'CONFIRMED'
           end old_value,
           os.code new_value,
           o.user_sales_id changed_by_user_id,
           o.order_date + case when o.approval_required = 'Y' then 2 else 1 end changed_on
    from crm_orders o
    join crm_order_statuses os
      on os.order_status_id = o.order_status_id
    union all
    select o.order_id,
           'DELIVERY_DATE',
           to_char(o.order_date + case when o.approval_required = 'Y' then 10 else 7 end, 'YYYY-MM-DD'),
           to_char(o.delivery_date, 'YYYY-MM-DD'),
           o.user_sales_id,
           o.order_date + case when o.approval_required = 'Y' then 4 else 2 end
    from crm_orders o
    where o.delivery_date is not null
)
select row_number() over(order by order_id, field_name, changed_on),
       order_id,
       field_name,
       old_value,
       new_value,
       changed_by_user_id,
       changed_on
from order_events;

insert into crm_invoice_history (invoice_hist_id, invoice_id, field_name, old_value, new_value, changed_by_user_id, changed_on)
with invoice_events as (
    select i.invoice_id,
           'INVOICE_STATUS_ID' field_name,
           case
               when nvl(i.paid_amt, 0) > 0 then 'ISSUED'
               else 'DRAFT'
           end old_value,
           s.code new_value,
           fu.user_id changed_by_user_id,
           i.invoice_date + 1 changed_on
    from crm_invoices i
    join crm_invoice_statuses s
      on s.invoice_status_id = i.invoice_status_id
    join crm_orders o
      on o.order_id = i.order_id
    join crm_customers c
      on c.customer_id = o.customer_id
    join crm_users fu
      on fu.role_id = 5
     and fu.branch_id = c.branch_id
    union all
    select i.invoice_id,
           'OUTSTANDING_AMT',
           to_char(nvl(i.total_amt, 0), 'FM9999999990D00'),
           to_char(nvl(i.outstanding_amt, 0), 'FM9999999990D00'),
           fu.user_id,
           nvl(i.due_date, i.invoice_date) + 1
    from crm_invoices i
    join crm_orders o
      on o.order_id = i.order_id
    join crm_customers c
      on c.customer_id = o.customer_id
    join crm_users fu
      on fu.role_id = 5
     and fu.branch_id = c.branch_id
    where nvl(i.outstanding_amt, 0) <> nvl(i.total_amt, 0)
)
select row_number() over(order by invoice_id, field_name, changed_on),
       invoice_id,
       field_name,
       old_value,
       new_value,
       changed_by_user_id,
       changed_on
from invoice_events;

insert into crm_payment_history (payment_hist_id, payment_id, field_name, old_value, new_value, changed_by_user_id, changed_on)
with payment_events as (
    select p.payment_id,
           'REFERENCE_NO' field_name,
           null old_value,
           p.reference_no new_value,
           fu.user_id changed_by_user_id,
           p.pay_date changed_on
    from crm_payments p
    join crm_invoices i
      on i.invoice_id = p.invoice_id
    join crm_orders o
      on o.order_id = i.order_id
    join crm_customers c
      on c.customer_id = o.customer_id
    join crm_users fu
      on fu.role_id = 5
     and fu.branch_id = c.branch_id
    union all
    select p.payment_id,
           'PAYMENT_STATUS_ID',
           'PENDING',
           ps.code,
           fu.user_id,
           p.pay_date + case when ps.code in ('FAILED', 'REVERSED') then 1 else 0 end
    from crm_payments p
    join crm_payment_statuses ps
      on ps.payment_status_id = p.payment_status_id
    join crm_invoices i
      on i.invoice_id = p.invoice_id
    join crm_orders o
      on o.order_id = i.order_id
    join crm_customers c
      on c.customer_id = o.customer_id
    join crm_users fu
      on fu.role_id = 5
     and fu.branch_id = c.branch_id
    where ps.code <> 'PENDING'
)
select row_number() over(order by payment_id, field_name, changed_on),
       payment_id,
       field_name,
       old_value,
       new_value,
       changed_by_user_id,
       changed_on
from payment_events;


--------------------------------------------------------------------------------
-- Seed segment 4: activities, activity relations, targets, forecasts, part 1.
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Activities and activity relations
--------------------------------------------------------------------------------
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (1, 1, 1, null, 201, 201, 'Lead qualification touchpoint #1', 'North America activity generated for lead record 1.', date '2025-01-07', date '2025-01-08', date '2025-01-10', null, date '2025-01-06');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (1, 1, 'LEAD', 1, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (2, 2, 1, null, 207, 207, 'Lead qualification touchpoint #2', 'North America activity generated for lead record 2.', date '2025-01-09', date '2025-01-10', date '2025-01-13', null, date '2025-01-08');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (2, 2, 'LEAD', 2, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (3, 3, 1, null, 213, 213, 'Lead qualification touchpoint #3', 'North America activity generated for lead record 3.', date '2025-01-11', date '2025-01-12', date '2025-01-16', null, date '2025-01-10');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (3, 3, 'LEAD', 3, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (4, 4, 2, 4, 219, 219, 'Lead qualification touchpoint #4', 'North America activity generated for lead record 4.', date '2025-01-13', date '2025-01-14', date '2025-01-19', date '2025-01-18', date '2025-01-12');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (4, 4, 'LEAD', 4, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (5, 5, 1, null, 225, 225, 'Lead qualification touchpoint #5', 'North America activity generated for lead record 5.', date '2025-01-15', date '2025-01-16', date '2025-01-17', null, date '2025-01-14');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (5, 5, 'LEAD', 5, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (6, 6, 4, 3, 226, 106, 'Lead qualification touchpoint #6', 'North America activity generated for lead record 6.', date '2025-01-17', date '2025-01-18', date '2025-01-20', null, date '2025-01-16');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (6, 6, 'LEAD', 6, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (7, 1, 1, null, 232, 232, 'Lead qualification touchpoint #7', 'North America activity generated for lead record 7.', date '2025-01-19', date '2025-01-20', date '2025-01-23', null, date '2025-01-18');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (7, 7, 'LEAD', 7, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (8, 2, 2, 2, 203, 203, 'Lead qualification touchpoint #8', 'North America activity generated for lead record 8.', date '2025-01-21', date '2025-01-22', date '2025-01-26', date '2025-01-25', date '2025-01-20');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (8, 8, 'LEAD', 8, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (9, 3, 1, null, 209, 209, 'Lead qualification touchpoint #9', 'North America activity generated for lead record 9.', date '2025-01-23', date '2025-01-24', date '2025-01-29', null, date '2025-01-22');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (9, 9, 'LEAD', 9, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (10, 4, 1, null, 215, 215, 'Lead qualification touchpoint #10', 'North America activity generated for lead record 10.', date '2025-01-25', date '2025-01-26', date '2025-01-27', null, date '2025-01-24');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (10, 10, 'LEAD', 10, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (11, 5, 3, null, 216, 216, 'Lead qualification touchpoint #11', 'North America activity generated for lead record 11.', date '2025-01-27', date '2025-01-28', date '2025-01-30', null, date '2025-01-26');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (11, 11, 'LEAD', 11, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (12, 6, 2, 6, 222, 105, 'Lead qualification touchpoint #12', 'North America activity generated for lead record 12.', date '2025-01-29', date '2025-01-30', date '2025-02-02', date '2025-02-01', date '2025-01-28');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (12, 12, 'LEAD', 12, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (13, 1, 1, null, 228, 228, 'Lead qualification touchpoint #13', 'North America activity generated for lead record 13.', date '2025-01-31', date '2025-02-01', date '2025-02-05', null, date '2025-01-30');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (13, 13, 'LEAD', 13, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (14, 2, 1, null, 234, 234, 'Lead qualification touchpoint #14', 'North America activity generated for lead record 14.', date '2025-02-02', date '2025-02-03', date '2025-02-08', null, date '2025-02-01');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (14, 14, 'LEAD', 14, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (15, 3, 1, null, 205, 205, 'Lead qualification touchpoint #15', 'North America activity generated for lead record 15.', date '2025-02-04', date '2025-02-05', date '2025-02-06', null, date '2025-02-03');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (15, 15, 'LEAD', 15, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (16, 4, 2, 4, 206, 206, 'Lead qualification touchpoint #16', 'North America activity generated for lead record 16.', date '2025-02-06', date '2025-02-07', date '2025-02-09', date '2025-02-08', date '2025-02-05');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (16, 16, 'LEAD', 16, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (17, 5, 1, null, 212, 212, 'Lead qualification touchpoint #17', 'North America activity generated for lead record 17.', date '2025-02-08', date '2025-02-09', date '2025-02-12', null, date '2025-02-07');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (17, 17, 'LEAD', 17, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (18, 6, 4, 3, 218, 104, 'Lead qualification touchpoint #18', 'North America activity generated for lead record 18.', date '2025-02-10', date '2025-02-11', date '2025-02-15', null, date '2025-02-09');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (18, 18, 'LEAD', 18, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (19, 1, 1, null, 224, 224, 'Lead qualification touchpoint #19', 'North America activity generated for lead record 19.', date '2025-02-12', date '2025-02-13', date '2025-02-18', null, date '2025-02-11');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (19, 19, 'LEAD', 19, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (20, 2, 2, 2, 230, 230, 'Lead qualification touchpoint #20', 'North America activity generated for lead record 20.', date '2025-02-14', date '2025-02-15', date '2025-02-16', date '2025-02-15', date '2025-02-13');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (20, 20, 'LEAD', 20, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (21, 3, 1, null, 231, 231, 'Lead qualification touchpoint #21', 'North America activity generated for lead record 21.', date '2025-02-16', date '2025-02-17', date '2025-02-19', null, date '2025-02-15');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (21, 21, 'LEAD', 21, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (22, 4, 3, null, 202, 202, 'Lead qualification touchpoint #22', 'North America activity generated for lead record 22.', date '2025-02-18', date '2025-02-19', date '2025-02-22', null, date '2025-02-17');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (22, 22, 'LEAD', 22, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (23, 5, 1, null, 208, 208, 'Lead qualification touchpoint #23', 'North America activity generated for lead record 23.', date '2025-02-20', date '2025-02-21', date '2025-02-25', null, date '2025-02-19');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (23, 23, 'LEAD', 23, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (24, 6, 2, 6, 214, 103, 'Lead qualification touchpoint #24', 'North America activity generated for lead record 24.', date '2025-02-22', date '2025-02-23', date '2025-02-28', date '2025-02-27', date '2025-02-21');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (24, 24, 'LEAD', 24, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (25, 1, 1, null, 220, 220, 'Lead qualification touchpoint #25', 'North America activity generated for lead record 25.', date '2025-02-24', date '2025-02-25', date '2025-02-26', null, date '2025-02-23');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (25, 25, 'LEAD', 25, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (281, 5, 1, null, 231, 231, 'Lead qualification touchpoint #281', 'North America activity generated for lead record 281.', date '2025-05-27', date '2025-05-28', date '2025-05-30', null, date '2025-05-26');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (281, 281, 'LEAD', 281, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (282, 6, 4, 3, 202, 101, 'Lead qualification touchpoint #282', 'North America activity generated for lead record 282.', date '2025-05-29', date '2025-05-30', date '2025-06-02', null, date '2025-05-28');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (282, 282, 'LEAD', 282, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (283, 1, 1, null, 208, 208, 'Lead qualification touchpoint #283', 'North America activity generated for lead record 283.', date '2025-05-31', date '2025-06-01', date '2025-06-05', null, date '2025-05-30');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (283, 283, 'LEAD', 283, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (284, 2, 2, 2, 214, 214, 'Lead qualification touchpoint #284', 'North America activity generated for lead record 284.', date '2025-06-02', date '2025-06-03', date '2025-06-08', date '2025-06-07', date '2025-06-01');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (284, 284, 'LEAD', 284, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (285, 3, 1, null, 220, 220, 'Lead qualification touchpoint #285', 'North America activity generated for lead record 285.', date '2025-06-04', date '2025-06-05', date '2025-06-06', null, date '2025-06-03');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (285, 285, 'LEAD', 285, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (286, 4, 3, null, 221, 221, 'Lead qualification touchpoint #286', 'North America activity generated for lead record 286.', date '2025-06-06', date '2025-06-07', date '2025-06-09', null, date '2025-06-05');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (286, 286, 'LEAD', 286, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (287, 5, 1, null, 227, 227, 'Lead qualification touchpoint #287', 'North America activity generated for lead record 287.', date '2025-06-08', date '2025-06-09', date '2025-06-12', null, date '2025-06-07');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (287, 287, 'LEAD', 287, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (288, 6, 2, 6, 233, 107, 'Lead qualification touchpoint #288', 'North America activity generated for lead record 288.', date '2025-06-10', date '2025-06-11', date '2025-06-15', date '2025-06-14', date '2025-06-09');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (288, 288, 'LEAD', 288, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (289, 1, 1, null, 204, 204, 'Lead qualification touchpoint #289', 'North America activity generated for lead record 289.', date '2025-06-12', date '2025-06-13', date '2025-06-18', null, date '2025-06-11');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (289, 289, 'LEAD', 289, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (290, 2, 1, null, 210, 210, 'Lead qualification touchpoint #290', 'North America activity generated for lead record 290.', date '2025-06-14', date '2025-06-15', date '2025-06-16', null, date '2025-06-13');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (290, 290, 'LEAD', 290, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (291, 3, 1, null, 211, 211, 'Lead qualification touchpoint #291', 'North America activity generated for lead record 291.', date '2025-06-16', date '2025-06-17', date '2025-06-19', null, date '2025-06-15');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (291, 291, 'LEAD', 291, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (292, 4, 2, 4, 217, 217, 'Lead qualification touchpoint #292', 'North America activity generated for lead record 292.', date '2025-06-18', date '2025-06-19', date '2025-06-22', date '2025-06-21', date '2025-06-17');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (292, 292, 'LEAD', 292, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (293, 5, 1, null, 223, 223, 'Lead qualification touchpoint #293', 'North America activity generated for lead record 293.', date '2025-06-20', date '2025-06-21', date '2025-06-25', null, date '2025-06-19');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (293, 293, 'LEAD', 293, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (294, 6, 4, 3, 229, 106, 'Lead qualification touchpoint #294', 'North America activity generated for lead record 294.', date '2025-06-22', date '2025-06-23', date '2025-06-28', null, date '2025-06-21');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (294, 294, 'LEAD', 294, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (295, 1, 1, null, 235, 235, 'Lead qualification touchpoint #295', 'North America activity generated for lead record 295.', date '2025-06-24', date '2025-06-25', date '2025-06-26', null, date '2025-06-23');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (295, 295, 'LEAD', 295, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (296, 2, 2, 2, 201, 201, 'Lead qualification touchpoint #296', 'North America activity generated for lead record 296.', date '2025-06-26', date '2025-06-27', date '2025-06-29', date '2025-06-28', date '2025-06-25');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (296, 296, 'LEAD', 296, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (297, 3, 3, null, 207, 207, 'Lead qualification touchpoint #297', 'North America activity generated for lead record 297.', date '2025-06-28', date '2025-06-29', date '2025-07-02', null, date '2025-06-27');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (297, 297, 'LEAD', 297, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (298, 4, 1, null, 213, 213, 'Lead qualification touchpoint #298', 'North America activity generated for lead record 298.', date '2025-06-30', date '2025-07-01', date '2025-07-05', null, date '2025-06-29');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (298, 298, 'LEAD', 298, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (299, 5, 1, null, 219, 219, 'Lead qualification touchpoint #299', 'North America activity generated for lead record 299.', date '2025-07-02', date '2025-07-03', date '2025-07-08', null, date '2025-07-01');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (299, 299, 'LEAD', 299, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (300, 6, 2, 6, 225, 105, 'Lead qualification touchpoint #300', 'North America activity generated for lead record 300.', date '2025-07-04', date '2025-07-05', date '2025-07-06', date '2025-07-05', date '2025-07-03');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (300, 300, 'LEAD', 300, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (301, 1, 1, null, 226, 226, 'Lead qualification touchpoint #301', 'North America activity generated for lead record 301.', date '2025-07-06', date '2025-07-07', date '2025-07-09', null, date '2025-07-05');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (301, 301, 'LEAD', 301, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (302, 2, 1, null, 232, 232, 'Lead qualification touchpoint #302', 'North America activity generated for lead record 302.', date '2025-07-08', date '2025-07-09', date '2025-07-12', null, date '2025-07-07');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (302, 302, 'LEAD', 302, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (303, 3, 1, null, 203, 203, 'Lead qualification touchpoint #303', 'North America activity generated for lead record 303.', date '2025-07-10', date '2025-07-11', date '2025-07-15', null, date '2025-07-09');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (303, 303, 'LEAD', 303, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (304, 4, 2, 4, 209, 209, 'Lead qualification touchpoint #304', 'North America activity generated for lead record 304.', date '2025-07-12', date '2025-07-13', date '2025-07-18', date '2025-07-17', date '2025-07-11');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (304, 304, 'LEAD', 304, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (305, 5, 1, null, 215, 215, 'Lead qualification touchpoint #305', 'North America activity generated for lead record 305.', date '2025-07-14', date '2025-07-15', date '2025-07-16', null, date '2025-07-13');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (305, 305, 'LEAD', 305, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (306, 6, 4, 3, 216, 104, 'Lead qualification touchpoint #306', 'North America activity generated for lead record 306.', date '2025-07-16', date '2025-07-17', date '2025-07-19', null, date '2025-07-15');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (306, 306, 'LEAD', 306, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (307, 1, 1, null, 222, 222, 'Lead qualification touchpoint #307', 'North America activity generated for lead record 307.', date '2025-07-18', date '2025-07-19', date '2025-07-22', null, date '2025-07-17');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (307, 307, 'LEAD', 307, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (308, 2, 3, null, 228, 228, 'Lead qualification touchpoint #308', 'North America activity generated for lead record 308.', date '2025-07-20', date '2025-07-21', date '2025-07-25', null, date '2025-07-19');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (308, 308, 'LEAD', 308, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (309, 3, 1, null, 234, 234, 'Lead qualification touchpoint #309', 'North America activity generated for lead record 309.', date '2025-07-22', date '2025-07-23', date '2025-07-28', null, date '2025-07-21');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (309, 309, 'LEAD', 309, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (310, 4, 1, null, 205, 205, 'Lead qualification touchpoint #310', 'North America activity generated for lead record 310.', date '2025-07-24', date '2025-07-25', date '2025-07-26', null, date '2025-07-23');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (310, 310, 'LEAD', 310, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (311, 5, 1, null, 206, 206, 'Lead qualification touchpoint #311', 'North America activity generated for lead record 311.', date '2025-07-26', date '2025-07-27', date '2025-07-29', null, date '2025-07-25');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (311, 311, 'LEAD', 311, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (312, 6, 2, 6, 212, 103, 'Lead qualification touchpoint #312', 'North America activity generated for lead record 312.', date '2025-07-28', date '2025-07-29', date '2025-08-01', date '2025-07-31', date '2025-07-27');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (312, 312, 'LEAD', 312, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (313, 1, 1, null, 218, 218, 'Lead qualification touchpoint #313', 'North America activity generated for lead record 313.', date '2025-07-30', date '2025-07-31', date '2025-08-04', null, date '2025-07-29');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (313, 313, 'LEAD', 313, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (314, 2, 1, null, 224, 224, 'Lead qualification touchpoint #314', 'North America activity generated for lead record 314.', date '2025-08-01', date '2025-08-02', date '2025-08-07', null, date '2025-07-31');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (314, 314, 'LEAD', 314, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (315, 3, 1, null, 230, 230, 'Lead qualification touchpoint #315', 'North America activity generated for lead record 315.', date '2025-08-03', date '2025-08-04', date '2025-08-05', null, date '2025-08-02');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (315, 315, 'LEAD', 315, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (316, 4, 2, 4, 231, 231, 'Lead qualification touchpoint #316', 'North America activity generated for lead record 316.', date '2025-08-05', date '2025-08-06', date '2025-08-08', date '2025-08-07', date '2025-08-04');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (316, 316, 'LEAD', 316, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (317, 5, 1, null, 202, 202, 'Lead qualification touchpoint #317', 'North America activity generated for lead record 317.', date '2025-08-07', date '2025-08-08', date '2025-08-11', null, date '2025-08-06');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (317, 317, 'LEAD', 317, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (318, 6, 4, 3, 208, 102, 'Lead qualification touchpoint #318', 'North America activity generated for lead record 318.', date '2025-08-09', date '2025-08-10', date '2025-08-14', null, date '2025-08-08');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (318, 318, 'LEAD', 318, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (319, 1, 3, null, 214, 214, 'Lead qualification touchpoint #319', 'North America activity generated for lead record 319.', date '2025-08-11', date '2025-08-12', date '2025-08-17', null, date '2025-08-10');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (319, 319, 'LEAD', 319, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (320, 2, 2, 2, 220, 220, 'Lead qualification touchpoint #320', 'North America activity generated for lead record 320.', date '2025-08-13', date '2025-08-14', date '2025-08-15', date '2025-08-14', date '2025-08-12');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (320, 320, 'LEAD', 320, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (321, 3, 1, null, 221, 221, 'Lead qualification touchpoint #321', 'North America activity generated for lead record 321.', date '2025-08-15', date '2025-08-16', date '2025-08-18', null, date '2025-08-14');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (321, 321, 'LEAD', 321, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (322, 4, 1, null, 227, 227, 'Lead qualification touchpoint #322', 'North America activity generated for lead record 322.', date '2025-08-17', date '2025-08-18', date '2025-08-21', null, date '2025-08-16');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (322, 322, 'LEAD', 322, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (323, 5, 1, null, 233, 233, 'Lead qualification touchpoint #323', 'North America activity generated for lead record 323.', date '2025-08-19', date '2025-08-20', date '2025-08-24', null, date '2025-08-18');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (323, 323, 'LEAD', 323, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (324, 6, 2, 6, 204, 101, 'Lead qualification touchpoint #324', 'North America activity generated for lead record 324.', date '2025-08-21', date '2025-08-22', date '2025-08-27', date '2025-08-26', date '2025-08-20');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (324, 324, 'LEAD', 324, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (325, 1, 1, null, 210, 210, 'Lead qualification touchpoint #325', 'North America activity generated for lead record 325.', date '2025-08-23', date '2025-08-24', date '2025-08-25', null, date '2025-08-22');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (325, 325, 'LEAD', 325, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (326, 2, 1, null, 211, 211, 'Lead qualification touchpoint #326', 'North America activity generated for lead record 326.', date '2025-08-25', date '2025-08-26', date '2025-08-28', null, date '2025-08-24');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (326, 326, 'LEAD', 326, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (327, 3, 1, null, 217, 217, 'Lead qualification touchpoint #327', 'North America activity generated for lead record 327.', date '2025-08-27', date '2025-08-28', date '2025-08-31', null, date '2025-08-26');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (327, 327, 'LEAD', 327, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (328, 4, 2, 4, 223, 223, 'Lead qualification touchpoint #328', 'North America activity generated for lead record 328.', date '2025-08-29', date '2025-08-30', date '2025-09-03', date '2025-09-02', date '2025-08-28');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (328, 328, 'LEAD', 328, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (329, 5, 1, null, 229, 229, 'Lead qualification touchpoint #329', 'North America activity generated for lead record 329.', date '2025-08-31', date '2025-09-01', date '2025-09-06', null, date '2025-08-30');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (329, 329, 'LEAD', 329, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (330, 6, 3, null, 235, 107, 'Lead qualification touchpoint #330', 'North America activity generated for lead record 330.', date '2025-09-02', date '2025-09-03', date '2025-09-04', null, date '2025-09-01');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (330, 330, 'LEAD', 330, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (331, 1, 1, null, 201, 201, 'Lead qualification touchpoint #331', 'North America activity generated for lead record 331.', date '2025-09-04', date '2025-09-05', date '2025-09-07', null, date '2025-09-03');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (331, 331, 'LEAD', 331, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (332, 2, 2, 2, 207, 207, 'Lead qualification touchpoint #332', 'North America activity generated for lead record 332.', date '2025-09-06', date '2025-09-07', date '2025-09-10', date '2025-09-09', date '2025-09-05');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (332, 332, 'LEAD', 332, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (333, 3, 1, null, 213, 213, 'Lead qualification touchpoint #333', 'North America activity generated for lead record 333.', date '2025-09-08', date '2025-09-09', date '2025-09-13', null, date '2025-09-07');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (333, 333, 'LEAD', 333, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (334, 4, 1, null, 219, 219, 'Lead qualification touchpoint #334', 'North America activity generated for lead record 334.', date '2025-09-10', date '2025-09-11', date '2025-09-16', null, date '2025-09-09');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (334, 334, 'LEAD', 334, 'Y');
insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on) values (335, 5, 1, null, 225, 225, 'Lead qualification touchpoint #335', 'North America activity generated for lead record 335.', date '2025-09-12', date '2025-09-13', date '2025-09-14', null, date '2025-09-11');
insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary) values (335, 335, 'LEAD', 335, 'Y');


--------------------------------------------------------------------------------
-- Seed segment 4: activities, activity relations, targets, forecasts, part 2.
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
-- Targets, forecasts, and duplicate match rules
--------------------------------------------------------------------------------
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (1, 'BRANCH', null, 1, null, date '2026-01-01', date '2026-01-31', 425000, 10);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (2, 'BRANCH', null, 2, null, date '2026-01-01', date '2026-01-31', 470000, 11);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (3, 'BRANCH', null, 3, null, date '2026-01-01', date '2026-01-31', 515000, 12);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (4, 'BRANCH', null, 4, null, date '2026-01-01', date '2026-01-31', 560000, 13);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (5, 'BRANCH', null, 5, null, date '2026-01-01', date '2026-01-31', 605000, 9);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (6, 'BRANCH', null, 6, null, date '2026-01-01', date '2026-01-31', 650000, 10);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (7, 'BRANCH', null, 7, null, date '2026-01-01', date '2026-01-31', 695000, 11);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (8, 'BRANCH', null, 1, null, date '2026-02-01', date '2026-02-28', 437000, 11);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (9, 'BRANCH', null, 2, null, date '2026-02-01', date '2026-02-28', 482000, 12);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (10, 'BRANCH', null, 3, null, date '2026-02-01', date '2026-02-28', 527000, 13);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (11, 'BRANCH', null, 4, null, date '2026-02-01', date '2026-02-28', 572000, 9);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (12, 'BRANCH', null, 5, null, date '2026-02-01', date '2026-02-28', 617000, 10);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (13, 'BRANCH', null, 6, null, date '2026-02-01', date '2026-02-28', 662000, 11);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (14, 'BRANCH', null, 7, null, date '2026-02-01', date '2026-02-28', 707000, 12);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (15, 'BRANCH', null, 1, null, date '2026-03-01', date '2026-03-31', 449000, 12);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (16, 'BRANCH', null, 2, null, date '2026-03-01', date '2026-03-31', 494000, 13);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (17, 'BRANCH', null, 3, null, date '2026-03-01', date '2026-03-31', 539000, 9);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (18, 'BRANCH', null, 4, null, date '2026-03-01', date '2026-03-31', 584000, 10);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (19, 'BRANCH', null, 5, null, date '2026-03-01', date '2026-03-31', 629000, 11);
insert into crm_sales_targets (target_id, target_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, target_amt, target_count) values (20, 'BRANCH', null, 6, null, date '2026-03-01', date '2026-03-31', 674000, 12);

insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (1, 1, 'REGION', null, null, 1, date '2025-01-01', date '2025-01-31', date '2025-01-15', 5535000);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (2, 2, 'REGION', null, null, 1, date '2025-01-01', date '2025-01-31', date '2025-01-15', 4715000);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (3, 3, 'REGION', null, null, 1, date '2025-01-01', date '2025-01-31', date '2025-01-15', 3895000);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (4, 4, 'REGION', null, null, 1, date '2025-01-01', date '2025-01-31', date '2025-01-15', 3198000);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (5, 1, 'REGION', null, null, 1, date '2025-02-01', date '2025-02-28', date '2025-02-15', 5663250);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (6, 2, 'REGION', null, null, 1, date '2025-02-01', date '2025-02-28', date '2025-02-15', 4824250);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (7, 3, 'REGION', null, null, 1, date '2025-02-01', date '2025-02-28', date '2025-02-15', 3985250);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (8, 4, 'REGION', null, null, 1, date '2025-02-01', date '2025-02-28', date '2025-02-15', 3272100);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (9, 1, 'REGION', null, null, 1, date '2025-03-01', date '2025-03-31', date '2025-03-15', 5791500);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (10, 2, 'REGION', null, null, 1, date '2025-03-01', date '2025-03-31', date '2025-03-15', 4933500);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (11, 3, 'REGION', null, null, 1, date '2025-03-01', date '2025-03-31', date '2025-03-15', 4075500);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (12, 4, 'REGION', null, null, 1, date '2025-03-01', date '2025-03-31', date '2025-03-15', 3346200);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (13, 1, 'REGION', null, null, 1, date '2025-04-01', date '2025-04-30', date '2025-04-15', 5919750);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (14, 2, 'REGION', null, null, 1, date '2025-04-01', date '2025-04-30', date '2025-04-15', 5042750);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (15, 3, 'REGION', null, null, 1, date '2025-04-01', date '2025-04-30', date '2025-04-15', 4165750);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (16, 4, 'REGION', null, null, 1, date '2025-04-01', date '2025-04-30', date '2025-04-15', 3420300);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (17, 1, 'REGION', null, null, 1, date '2025-05-01', date '2025-05-31', date '2025-05-15', 6048000);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (18, 2, 'REGION', null, null, 1, date '2025-05-01', date '2025-05-31', date '2025-05-15', 5152000);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (19, 3, 'REGION', null, null, 1, date '2025-05-01', date '2025-05-31', date '2025-05-15', 4256000);
insert into crm_forecasts (forecast_id, forecast_category_id, forecast_scope_code, user_id, branch_id, region_id, period_start_date, period_end_date, snapshot_date, forecast_amt) values (20, 4, 'REGION', null, null, 1, date '2025-05-01', date '2025-05-31', date '2025-05-15', 3494400);

insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on)
select 900 + i.invoice_id - 125,
       4,
       4,
       null,
       fu.user_id,
       fu.user_id,
       'Invoice collection follow-up ' || i.invoice_no,
       'Follow up overdue invoice balance of ' || to_char(i.outstanding_amt, 'FM9999999990D00') || ' for order ' || o.order_id || '.',
       i.due_date + 3,
       i.due_date + 4,
       i.due_date + 5,
       null,
       i.due_date + 2
from crm_invoices i
join crm_orders o
  on o.order_id = i.order_id
join crm_customers c
  on c.customer_id = o.customer_id
join crm_users fu
  on fu.role_id = 5
 and fu.branch_id = c.branch_id
where i.invoice_id between 126 and 140;

insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary)
select 900 + i.invoice_id - 125,
       900 + i.invoice_id - 125,
       'INVOICE',
       i.invoice_id,
       'Y'
from crm_invoices i
where i.invoice_id between 126 and 140;

insert into crm_activities (activity_id, activity_type_id, activity_status_id, activity_outcome_id, owner_user_id, assigned_user_id, subject, detail, scheduled_start_on, scheduled_end_on, due_on, completed_on, reminder_on)
select 915 + p.payment_id - 215,
       1,
       case when p.payment_status_id = 4 then 4 else 1 end,
       case when p.payment_status_id = 3 then 6 else null end,
       fu.user_id,
       fu.user_id,
       'Payment exception follow-up ' || p.reference_no,
       'Resolve ' || ps.code || ' payment for invoice ' || i.invoice_no || '.',
       p.pay_date + 1,
       p.pay_date + 2,
       p.pay_date + 3,
       null,
       p.pay_date
from crm_payments p
join crm_payment_statuses ps
  on ps.payment_status_id = p.payment_status_id
join crm_invoices i
  on i.invoice_id = p.invoice_id
join crm_orders o
  on o.order_id = i.order_id
join crm_customers c
  on c.customer_id = o.customer_id
join crm_users fu
  on fu.role_id = 5
 and fu.branch_id = c.branch_id
where p.payment_id between 216 and 225;

insert into crm_activity_relations (activity_relation_id, activity_id, related_entity_type, related_entity_id, is_primary)
select 915 + p.payment_id - 215,
       915 + p.payment_id - 215,
       'PAYMENT',
       p.payment_id,
       'Y'
from crm_payments p
where p.payment_id between 216 and 225;



--------------------------------------------------------------------------------
-- Synchronize identity columns after manual seed loads or app-driven inserts.
--------------------------------------------------------------------------------

alter table crm_lead_types modify lead_type_id generated by default on null as identity (start with limit value);
alter table crm_lead_states modify lead_state_id generated by default on null as identity (start with limit value);
alter table crm_lead_sources modify lead_source_id generated by default on null as identity (start with limit value);
alter table crm_lead_disqualification_reasons modify lead_disqual_reason_id generated by default on null as identity (start with limit value);
alter table crm_opportunity_stages modify opportunity_stage_id generated by default on null as identity (start with limit value);
alter table crm_opportunity_categories modify opportunity_category_id generated by default on null as identity (start with limit value);
alter table crm_opportunity_close_reasons modify opportunity_close_reason_id generated by default on null as identity (start with limit value);
alter table crm_quote_statuses modify quote_status_id generated by default on null as identity (start with limit value);
alter table crm_customer_statuses modify customer_status_id generated by default on null as identity (start with limit value);
alter table crm_customer_priorities modify customer_priority_id generated by default on null as identity (start with limit value);
alter table crm_activity_types modify activity_type_id generated by default on null as identity (start with limit value);
alter table crm_activity_statuses modify activity_status_id generated by default on null as identity (start with limit value);
alter table crm_activity_outcomes modify activity_outcome_id generated by default on null as identity (start with limit value);
alter table crm_contact_roles modify contact_role_id generated by default on null as identity (start with limit value);
alter table crm_contact_channels modify contact_channel_id generated by default on null as identity (start with limit value);
alter table crm_approval_statuses modify approval_status_id generated by default on null as identity (start with limit value);
alter table crm_payment_modes modify payment_mode_id generated by default on null as identity (start with limit value);
alter table crm_payment_statuses modify payment_status_id generated by default on null as identity (start with limit value);
alter table crm_order_statuses modify order_status_id generated by default on null as identity (start with limit value);
alter table crm_invoice_statuses modify invoice_status_id generated by default on null as identity (start with limit value);
alter table crm_forecast_categories modify forecast_category_id generated by default on null as identity (start with limit value);
alter table crm_order_sources modify order_source_id generated by default on null as identity (start with limit value);
alter table crm_regions modify region_id generated by default on null as identity (start with limit value);
alter table crm_branches modify branch_id generated by default on null as identity (start with limit value);
alter table crm_roles modify role_id generated by default on null as identity (start with limit value);
alter table crm_users modify user_id generated by default on null as identity (start with limit value);
alter table crm_industries modify industry_id generated by default on null as identity (start with limit value);
alter table crm_product_types modify product_type_id generated by default on null as identity (start with limit value);
alter table crm_products modify product_id generated by default on null as identity (start with limit value);
alter table crm_account_relationship_statuses modify account_relationship_status_id generated by default on null as identity (start with limit value);
alter table crm_accounts modify account_id generated by default on null as identity (start with limit value);
alter table crm_contacts modify contact_id generated by default on null as identity (start with limit value);
alter table crm_account_contact_roles modify account_contact_role_id generated by default on null as identity (start with limit value);
alter table crm_customers modify customer_id generated by default on null as identity (start with limit value);
alter table crm_leads modify lead_id generated by default on null as identity (start with limit value);
alter table crm_lead_history modify lead_hist_id generated by default on null as identity (start with limit value);
alter table crm_opportunities modify opportunity_id generated by default on null as identity (start with limit value);
alter table crm_opportunity_stage_history modify opp_stage_hist_id generated by default on null as identity (start with limit value);
alter table crm_opportunity_history modify opportunity_hist_id generated by default on null as identity (start with limit value);
alter table crm_opportunity_contacts modify opportunity_contact_id generated by default on null as identity (start with limit value);
alter table crm_opportunity_products modify opportunity_product_id generated by default on null as identity (start with limit value);
alter table crm_customer_contacts modify customer_contact_id generated by default on null as identity (start with limit value);
alter table crm_customer_history modify customer_hist_id generated by default on null as identity (start with limit value);
alter table crm_quotes modify quote_id generated by default on null as identity (start with limit value);
alter table crm_quote_lines modify quote_line_id generated by default on null as identity (start with limit value);
alter table crm_quote_history modify quote_hist_id generated by default on null as identity (start with limit value);
alter table crm_activities modify activity_id generated by default on null as identity (start with limit value);
alter table crm_activity_relations modify activity_relation_id generated by default on null as identity (start with limit value);
alter table crm_approval_rules modify approval_rule_id generated by default on null as identity (start with limit value);
alter table crm_access_rules modify access_rule_id generated by default on null as identity (start with limit value);
alter table crm_orders modify order_id generated by default on null as identity (start with limit value);
alter table crm_order_history modify order_hist_id generated by default on null as identity (start with limit value);
alter table crm_approval_actions modify approval_action_id generated by default on null as identity (start with limit value);
alter table crm_bookings modify booking_id generated by default on null as identity (start with limit value);
alter table crm_booking_history modify booking_hist_id generated by default on null as identity (start with limit value);
alter table crm_invoices modify invoice_id generated by default on null as identity (start with limit value);
alter table crm_invoice_history modify invoice_hist_id generated by default on null as identity (start with limit value);
alter table crm_payments modify payment_id generated by default on null as identity (start with limit value);
alter table crm_payment_history modify payment_hist_id generated by default on null as identity (start with limit value);
alter table crm_sales_targets modify target_id generated by default on null as identity (start with limit value);
alter table crm_forecasts modify forecast_id generated by default on null as identity (start with limit value);
alter table crm_duplicate_match_rules modify match_rule_id generated by default on null as identity (start with limit value);

--------------------------------------------------------------------------------
-- Dynamic date rebase (anchor = 2025-04-01 -> sysdate - 90 days)
--------------------------------------------------------------------------------

declare
    v_offset number;
begin
    -- anchor the data midpoint to 90 days before today
    v_offset := trunc(sysdate) - 90 - date '2025-04-01';

    -- crm_leads
    update crm_leads set
        status_date      = status_date      + v_offset,
        created_on        = status_date      + v_offset - 7,
        updated_on        = status_date      + v_offset;

    -- crm_lead_history (only changed_on; no created_on/updated_on)
    update crm_lead_history set
        changed_on = changed_on + v_offset;

    -- crm_opportunities
    update crm_opportunities set
        expected_close_date = expected_close_date + v_offset,
        current_stage_date  = current_stage_date  + v_offset,
        next_action_date    = case when next_action_date is not null then next_action_date + v_offset end,
        next_review_date    = case when next_review_date is not null then next_review_date + v_offset end,
        closed_date         = case when closed_date is not null then closed_date + v_offset end,
        created_on          = nvl(current_stage_date + v_offset - 14, created_on),
        updated_on          = nvl(closed_date + v_offset, current_stage_date + v_offset);

    -- crm_opportunity_stage_history
    update crm_opportunity_stage_history set
        changed_on = changed_on + v_offset;

    -- crm_opportunity_history
    update crm_opportunity_history set
        changed_on = changed_on + v_offset;

    -- crm_quotes
    update crm_quotes set
        quote_date     = quote_date     + v_offset,
        expiry_date    = case when expiry_date is not null then expiry_date + v_offset end,
        accepted_date  = case when accepted_date is not null then accepted_date + v_offset end,
        rejected_date  = case when rejected_date is not null then rejected_date + v_offset end,
        created_on     = quote_date     + v_offset,
        updated_on     = quote_date     + v_offset;

    -- crm_quote_history
    update crm_quote_history set
        changed_on = changed_on + v_offset;

    -- crm_orders
    update crm_orders set
        order_date    = order_date    + v_offset,
        delivery_date = case when delivery_date is not null then delivery_date + v_offset end,
        created_on    = order_date    + v_offset,
        updated_on    = order_date    + v_offset;

    -- crm_order_history
    update crm_order_history set
        changed_on = changed_on + v_offset;

    -- crm_invoices
    update crm_invoices set
        invoice_date = invoice_date + v_offset,
        due_date     = due_date     + v_offset,
        created_on   = invoice_date + v_offset,
        updated_on   = invoice_date + v_offset;

    -- crm_invoice_history
    update crm_invoice_history set
        changed_on = changed_on + v_offset;

    -- crm_payments
    update crm_payments set
        pay_date   = pay_date   + v_offset,
        created_on = pay_date   + v_offset,
        updated_on = pay_date   + v_offset;

    -- crm_payment_history
    update crm_payment_history set
        changed_on = changed_on + v_offset;

    -- crm_bookings (orders already shifted, so just pull their new order_date)
    update crm_bookings set
        created_on = (select o.order_date from crm_orders o where o.order_id = crm_bookings.order_id),
        updated_on = (select o.order_date from crm_orders o where o.order_id = crm_bookings.order_id);

    -- crm_booking_history
    update crm_booking_history set
        changed_on = changed_on + v_offset;

    -- crm_approval_actions
    update crm_approval_actions set
        action_on  = action_on  + v_offset,
        created_on = action_on  + v_offset,
        updated_on = action_on  + v_offset;

    -- crm_activities
    update crm_activities set
        scheduled_start_on = case when scheduled_start_on is not null then scheduled_start_on + v_offset end,
        scheduled_end_on   = case when scheduled_end_on is not null then scheduled_end_on + v_offset end,
        due_on             = case when due_on is not null then due_on + v_offset end,
        completed_on       = case when completed_on is not null then completed_on + v_offset end,
        reminder_on        = case when reminder_on is not null then reminder_on + v_offset end,
        created_on         = nvl(due_on + v_offset - 3, created_on),
        updated_on         = nvl(completed_on + v_offset, due_on + v_offset);

    -- crm_forecasts
    update crm_forecasts set
        period_start_date = period_start_date + v_offset,
        period_end_date   = period_end_date   + v_offset,
        snapshot_date     = snapshot_date     + v_offset,
        created_on        = snapshot_date     + v_offset,
        updated_on        = snapshot_date     + v_offset;

    -- crm_sales_targets
    update crm_sales_targets set
        period_start_date = period_start_date + v_offset,
        period_end_date   = period_end_date   + v_offset,
        created_on        = period_start_date + v_offset,
        updated_on        = period_start_date + v_offset;

    -- crm_customers
    update crm_customers set
        created_on = (select min(l.created_on) from crm_leads l where l.converted_customer_id = crm_customers.customer_id),
        updated_on = (select min(l.created_on) from crm_leads l where l.converted_customer_id = crm_customers.customer_id)
    where exists (select 1 from crm_leads l where l.converted_customer_id = crm_customers.customer_id);

    -- crm_customer_history
    update crm_customer_history set
        changed_on = changed_on + v_offset;

    -- crm_accounts: align to earliest lead created_on for that account
    update crm_accounts a set
        created_on = (select min(l.created_on) from crm_leads l where l.account_id = a.account_id),
        updated_on = (select max(l.updated_on) from crm_leads l where l.account_id = a.account_id)
    where exists (select 1 from crm_leads l where l.account_id = a.account_id);

    -- crm_contacts: align to earliest lead created_on for that contact
    update crm_contacts c set
        created_on = (select min(l.created_on) from crm_leads l where l.contact_id = c.contact_id),
        updated_on = (select max(l.updated_on) from crm_leads l where l.contact_id = c.contact_id)
    where exists (select 1 from crm_leads l where l.contact_id = c.contact_id);

    -- ensure open opportunities have past review/stage dates for overdue/stale metrics
    update crm_opportunities set
        next_review_date   = trunc(sysdate) - 45,
        current_stage_date = trunc(sysdate) - 60
    where opportunity_id in (21, 22, 23);

    update crm_opportunities set
        next_review_date   = trunc(sysdate) - 20,
        current_stage_date = trunc(sysdate) - 35
    where opportunity_id in (24, 25);

end;
/
commit;
