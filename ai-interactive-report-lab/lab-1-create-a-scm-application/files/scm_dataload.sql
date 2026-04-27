whenever sqlerror exit failure rollback
set define off
set feedback off
set serveroutput on size unlimited

prompt ============================================
prompt SCM data export generated in dependency order
prompt ============================================

prompt
prompt Base table inserts
prompt ------------------
prompt
prompt SCM_BUSINESS_PARTNERS
prompt
prompt SCM_ITEMS
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (37, 'NL2IRITEM001', 'NL2IR Item
001', 'Seeded replenishment demo item 001 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'CHILLED', 'COLD', 366, 31, true
, false, true, false, false, true, false, false, .85, .021, to_timestamp_tz('202
6-02-13 16:18:49.661696 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEE
D');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (38, 'NL2IRITEM002', 'NL2IR Item
002', 'Seeded replenishment demo item 002 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_B', 'EA', 'CASE', 'ACTIVE', 'CONTROLLED', 'SECURE', 367, 32, true, f
alse, true, false, true, false, false, false, .95, .022, to_timestamp_tz('2026-0
2-14 16:18:49.662141 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED')
;
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (39, 'NL2IRITEM003', 'NL2IR Item
003', 'Seeded replenishment demo item 003 for NL2IR reporting.', 'MEDICAL', 'CLI
NICAL', 'FAMILY_C', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, t
rue, false, false, true, false, false, false, false, 1.05, .023, to_timestamp_tz
('2026-02-15 16:18:49.662190 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (40, 'NL2IRITEM004', 'NL2IR Item
004', 'Seeded replenishment demo item 004 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_D', 'EA', 'BOX', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tru
e, true, false, false, false, false, false, false, 1.15, .024, to_timestamp_tz('
2026-02-16 16:18:49.662227 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_
SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (41, 'NL2IRITEM005', 'NL2IR Item
005', 'Seeded replenishment demo item 005 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_E', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null
, true, false, false, false, false, false, false, false, 1.25, .025, to_timestam
p_tz('2026-02-17 16:18:49.662262 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), '
NL2IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (42, 'NL2IRITEM006', 'NL2IR Item
006', 'Seeded replenishment demo item 006 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_F', 'EA', 'CASE', 'ACTIVE', 'CHILLED', 'COLD', 371, 36, true
, false, true, false, false, true, true, false, 1.35, .026, to_timestamp_tz('202
6-02-18 16:18:49.662295 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEE
D');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (43, 'NL2IRITEM007', 'NL2IR Item
007', 'Seeded replenishment demo item 007 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'CONTROLLED', 'SECURE', 372, 37, true, f
alse, true, false, true, false, false, true, 1.45, .027, to_timestamp_tz('2026-0
2-19 16:18:49.662333 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED')
;
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (44, 'NL2IRITEM008', 'NL2IR Item
008', 'Seeded replenishment demo item 008 for NL2IR reporting.', 'MEDICAL', 'CLI
NICAL', 'FAMILY_B', 'EA', 'BOX', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, true, false, true, false, false, false, false, 1.55, .028, to_timestamp_tz('
2026-02-20 16:18:49.662365 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_
SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (45, 'NL2IRITEM009', 'NL2IR Item
009', 'Seeded replenishment demo item 009 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_C', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, false, false, false, false, false, false, false, 1.65, .029, to_timestamp_tz
('2026-02-21 16:18:49.662397 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (46, 'NL2IRITEM010', 'NL2IR Item
010', 'Seeded replenishment demo item 010 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_D', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null
, true, false, false, false, false, false, false, false, 1.75, .03, to_timestamp
_tz('2026-02-22 16:18:49.662431 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'N
L2IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (47, 'NL2IRITEM011', 'NL2IR Item
011', 'Seeded replenishment demo item 011 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_E', 'EA', 'CASE', 'ACTIVE', 'CHILLED', 'COLD', 376, 41, true
, false, true, false, false, true, false, false, 1.85, .031, to_timestamp_tz('20
26-02-23 16:18:49.662486 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SE
ED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (48, 'NL2IRITEM012', 'NL2IR Item
012', 'Seeded replenishment demo item 012 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_F', 'EA', 'BOX', 'ACTIVE', 'CONTROLLED', 'SECURE', 377, 42, true, tr
ue, true, false, true, false, true, false, 1.95, .032, to_timestamp_tz('2026-02-
24 16:18:49.662540 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (49, 'NL2IRITEM013', 'NL2IR Item
013', 'Seeded replenishment demo item 013 for NL2IR reporting.', 'MEDICAL', 'CLI
NICAL', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, t
rue, false, false, true, false, false, false, false, 2.05, .033, to_timestamp_tz
('2026-02-25 16:18:49.662572 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (50, 'NL2IRITEM014', 'NL2IR Item
014', 'Seeded replenishment demo item 014 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_B', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, false, false, false, false, false, false, true, 2.15, .034, to_timestamp_tz(
'2026-02-26 16:18:49.662602 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR
_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (51, 'NL2IRITEM015', 'NL2IR Item
015', 'Seeded replenishment demo item 015 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_C', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null
, true, false, false, false, false, false, false, false, 2.25, .035, to_timestam
p_tz('2026-02-27 16:18:49.662636 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), '
NL2IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (52, 'NL2IRITEM016', 'NL2IR Item
016', 'Seeded replenishment demo item 016 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_D', 'EA', 'BOX', 'ACTIVE', 'CHILLED', 'COLD', 381, 31, true,
 true, true, false, false, true, false, false, 2.35, .036, to_timestamp_tz('2026
-02-28 16:18:49.662666 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED
');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (53, 'NL2IRITEM017', 'NL2IR Item
017', 'Seeded replenishment demo item 017 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_E', 'EA', 'CASE', 'ACTIVE', 'CONTROLLED', 'SECURE', 382, 32, true, f
alse, true, false, true, false, false, false, 2.45, .037, to_timestamp_tz('2026-
03-01 16:18:49.662696 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED'
);
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (54, 'NL2IRITEM018', 'NL2IR Item
018', 'Seeded replenishment demo item 018 for NL2IR reporting.', 'MEDICAL', 'CLI
NICAL', 'FAMILY_F', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, t
rue, false, false, true, false, false, true, false, 2.55, .038, to_timestamp_tz(
'2026-03-02 16:18:49.662726 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR
_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (55, 'NL2IRITEM019', 'NL2IR Item
019', 'Seeded replenishment demo item 019 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, false, false, false, false, false, false, false, 2.65, .039, to_timestamp_tz
('2026-03-03 16:18:49.662758 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (56, 'NL2IRITEM020', 'NL2IR Item
020', 'Seeded replenishment demo item 020 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_B', 'EA', 'BOX', 'ACTIVE', 'STANDARD', 'GENERAL', null, null,
 true, true, false, false, false, false, false, false, 2.75, .04, to_timestamp_t
z('2026-03-04 16:18:49.662788 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2
IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (57, 'NL2IRITEM021', 'NL2IR Item
021', 'Seeded replenishment demo item 021 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_C', 'EA', 'CASE', 'ACTIVE', 'CHILLED', 'COLD', 386, 36, true
, false, true, false, false, true, false, true, 2.85, .041, to_timestamp_tz('202
6-03-05 16:18:49.662819 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEE
D');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (58, 'NL2IRITEM022', 'NL2IR Item
022', 'Seeded replenishment demo item 022 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_D', 'EA', 'CASE', 'ACTIVE', 'CONTROLLED', 'SECURE', 387, 37, true, f
alse, true, false, true, false, false, false, 2.95, .042, to_timestamp_tz('2026-
03-06 16:18:49.662849 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED'
);
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (59, 'NL2IRITEM023', 'NL2IR Item
023', 'Seeded replenishment demo item 023 for NL2IR reporting.', 'MEDICAL', 'CLI
NICAL', 'FAMILY_E', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, t
rue, false, false, true, false, false, false, false, 3.05, .043, to_timestamp_tz
('2026-03-07 16:18:49.662881 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (60, 'NL2IRITEM024', 'NL2IR Item
024', 'Seeded replenishment demo item 024 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_F', 'EA', 'BOX', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tru
e, true, false, false, false, false, true, false, 3.15, .044, to_timestamp_tz('2
026-03-08 16:18:49.662911 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_S
EED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (61, 'NL2IRITEM025', 'NL2IR Item
025', 'Seeded replenishment demo item 025 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null
, true, false, false, false, false, false, false, false, 3.25, .045, to_timestam
p_tz('2026-03-09 16:18:49.662940 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), '
NL2IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (62, 'NL2IRITEM026', 'NL2IR Item
026', 'Seeded replenishment demo item 026 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_B', 'EA', 'CASE', 'ACTIVE', 'CHILLED', 'COLD', 391, 41, true
, false, true, false, false, true, false, false, 3.35, .046, to_timestamp_tz('20
26-03-10 16:18:49.662969 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SE
ED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (63, 'NL2IRITEM027', 'NL2IR Item
027', 'Seeded replenishment demo item 027 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_C', 'EA', 'CASE', 'ACTIVE', 'CONTROLLED', 'SECURE', 392, 42, true, f
alse, true, false, true, false, false, false, 3.45, .047, to_timestamp_tz('2026-
03-11 16:18:49.662999 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED'
);
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (64, 'NL2IRITEM028', 'NL2IR Item
028', 'Seeded replenishment demo item 028 for NL2IR reporting.', 'MEDICAL', 'CLI
NICAL', 'FAMILY_D', 'EA', 'BOX', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, true, false, true, false, false, false, true, 3.55, .048, to_timestamp_tz('2
026-03-12 16:18:49.663032 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_S
EED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (65, 'NL2IRITEM029', 'NL2IR Item
029', 'Seeded replenishment demo item 029 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_E', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, false, false, false, false, false, false, false, 3.65, .049, to_timestamp_tz
('2026-03-13 16:18:49.663062 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (66, 'NL2IRITEM030', 'NL2IR Item
030', 'Seeded replenishment demo item 030 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_F', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null
, true, false, false, false, false, false, true, false, 3.75, .05, to_timestamp_
tz('2026-02-12 16:18:49.663091 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL
2IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (67, 'NL2IRITEM031', 'NL2IR Item
031', 'Seeded replenishment demo item 031 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'CHILLED', 'COLD', 396, 31, true
, false, true, false, false, true, false, false, 3.85, .051, to_timestamp_tz('20
26-02-13 16:18:49.663122 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SE
ED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (68, 'NL2IRITEM032', 'NL2IR Item
032', 'Seeded replenishment demo item 032 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_B', 'EA', 'BOX', 'ACTIVE', 'CONTROLLED', 'SECURE', 397, 32, true, tr
ue, true, false, true, false, false, false, 3.95, .052, to_timestamp_tz('2026-02
-14 16:18:49.663154 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');

insert into scm_items overriding system value (item_id, item_code, item_name, i
tem_description, item_category_code, item_subcategory_code, item_family_code, ba
se_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_cla
ss_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, s
erial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatu
re_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stan
dard_volume_cbm, created_at, created_by) values (69, 'NL2IRITEM033', 'NL2IR Item
 033', 'Seeded replenishment demo item 033 for NL2IR reporting.', 'MEDICAL', 'CL
INICAL', 'FAMILY_C', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null,
true, false, false, true, false, false, false, false, 4.05, .053, to_timestamp_t
z('2026-02-15 16:18:49.663184 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2
IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (70, 'NL2IRITEM034', 'NL2IR Item
034', 'Seeded replenishment demo item 034 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_D', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, false, false, false, false, false, false, false, 4.15, .054, to_timestamp_tz
('2026-02-16 16:18:49.663213 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (71, 'NL2IRITEM035', 'NL2IR Item
035', 'Seeded replenishment demo item 035 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_E', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null
, true, false, false, false, false, false, false, true, 4.25, .055, to_timestamp
_tz('2026-02-17 16:18:49.663242 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'N
L2IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (72, 'NL2IRITEM036', 'NL2IR Item
036', 'Seeded replenishment demo item 036 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_F', 'EA', 'BOX', 'ACTIVE', 'CHILLED', 'COLD', 401, 36, true,
 true, true, false, false, true, true, false, 4.35, .056, to_timestamp_tz('2026-
02-18 16:18:49.663273 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED'
);
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (73, 'NL2IRITEM037', 'NL2IR Item
037', 'Seeded replenishment demo item 037 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'CONTROLLED', 'SECURE', 402, 37, true, f
alse, true, false, true, false, false, false, 4.45, .057, to_timestamp_tz('2026-
02-19 16:18:49.663314 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED'
);
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (74, 'NL2IRITEM038', 'NL2IR Item
038', 'Seeded replenishment demo item 038 for NL2IR reporting.', 'MEDICAL', 'CLI
NICAL', 'FAMILY_B', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, t
rue, false, false, true, false, false, false, false, 4.55, .058, to_timestamp_tz
('2026-02-20 16:18:49.663345 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (75, 'NL2IRITEM039', 'NL2IR Item
039', 'Seeded replenishment demo item 039 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_C', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, false, false, false, false, false, false, false, 4.65, .059, to_timestamp_tz
('2026-02-21 16:18:49.663374 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2I
R_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (76, 'NL2IRITEM040', 'NL2IR Item
040', 'Seeded replenishment demo item 040 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_D', 'EA', 'BOX', 'ACTIVE', 'STANDARD', 'GENERAL', null, null,
 true, true, false, false, false, false, false, false, 4.75, .06, to_timestamp_t
z('2026-02-22 16:18:49.663405 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2
IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (77, 'NL2IRITEM041', 'NL2IR Item
041', 'Seeded replenishment demo item 041 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_E', 'EA', 'CASE', 'ACTIVE', 'CHILLED', 'COLD', 406, 41, true
, false, true, false, false, true, false, false, 4.85, .061, to_timestamp_tz('20
26-02-23 16:18:49.663434 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SE
ED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (78, 'NL2IRITEM042', 'NL2IR Item
042', 'Seeded replenishment demo item 042 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_F', 'EA', 'CASE', 'ACTIVE', 'CONTROLLED', 'SECURE', 407, 42, true, f
alse, true, false, true, false, true, true, 4.95, .062, to_timestamp_tz('2026-02
-24 16:18:49.663464 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');

insert into scm_items overriding system value (item_id, item_code, item_name, i
tem_description, item_category_code, item_subcategory_code, item_family_code, ba
se_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_cla
ss_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, s
erial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatu
re_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stan
dard_volume_cbm, created_at, created_by) values (79, 'NL2IRITEM043', 'NL2IR Item
 043', 'Seeded replenishment demo item 043 for NL2IR reporting.', 'MEDICAL', 'CL
INICAL', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null,
true, false, false, true, false, false, false, false, 5.05, .063, to_timestamp_t
z('2026-02-25 16:18:49.663493 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2
IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (80, 'NL2IRITEM044', 'NL2IR Item
044', 'Seeded replenishment demo item 044 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_B', 'EA', 'BOX', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tru
e, true, false, false, false, false, false, false, 5.15, .064, to_timestamp_tz('
2026-02-26 16:18:49.663533 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_
SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (81, 'NL2IRITEM045', 'NL2IR Item
045', 'Seeded replenishment demo item 045 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_C', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null
, true, false, false, false, false, false, false, false, 5.25, .065, to_timestam
p_tz('2026-02-27 16:18:49.663573 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), '
NL2IR_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (82, 'NL2IRITEM046', 'NL2IR Item
046', 'Seeded replenishment demo item 046 for NL2IR reporting.', 'ELECTRONICS',
'HANDHELD', 'FAMILY_D', 'EA', 'CASE', 'ACTIVE', 'CHILLED', 'COLD', 411, 31, true
, false, true, false, false, true, false, false, 5.35, .066, to_timestamp_tz('20
26-02-28 16:18:49.663603 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SE
ED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (83, 'NL2IRITEM047', 'NL2IR Item
047', 'Seeded replenishment demo item 047 for NL2IR reporting.', 'FOOD', 'AMBIEN
T', 'FAMILY_E', 'EA', 'CASE', 'ACTIVE', 'CONTROLLED', 'SECURE', 412, 32, true, f
alse, true, false, true, false, false, false, 5.45, .067, to_timestamp_tz('2026-
03-01 16:18:49.663634 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED'
);
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (84, 'NL2IRITEM048', 'NL2IR Item
048', 'Seeded replenishment demo item 048 for NL2IR reporting.', 'MEDICAL', 'CLI
NICAL', 'FAMILY_F', 'EA', 'BOX', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, true, false, true, false, false, true, false, 5.55, .068, to_timestamp_tz('2
026-03-02 16:18:49.663664 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR_S
EED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (85, 'NL2IRITEM049', 'NL2IR Item
049', 'Seeded replenishment demo item 049 for NL2IR reporting.', 'APPAREL', 'GAR
MENT', 'FAMILY_A', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null, tr
ue, false, false, false, false, false, false, true, 5.65, .069, to_timestamp_tz(
'2026-03-03 16:18:49.663695 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'NL2IR
_SEED');
insert into scm_items overriding system value (item_id, item_code, item_name, it
em_description, item_category_code, item_subcategory_code, item_family_code, bas
e_uom_code, pack_uom_code, item_status_code, handling_profile_code, storage_clas
s_code, shelf_life_days, minimum_remaining_shelf_life_days, lot_control_flag, se
rial_control_flag, expiry_control_flag, fragile_flag, hazardous_flag, temperatur
e_control_flag, high_value_flag, restricted_item_flag, standard_weight_kg, stand
ard_volume_cbm, created_at, created_by) values (86, 'NL2IRITEM050', 'NL2IR Item
050', 'Seeded replenishment demo item 050 for NL2IR reporting.', 'SPARES', 'SERV
ICE_PART', 'FAMILY_B', 'EA', 'CASE', 'ACTIVE', 'STANDARD', 'GENERAL', null, null
, true, false, false, false, false, false, false, false, 5.75, .07, to_timestamp
_tz('2026-03-04 16:18:49.663724 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 'N
L2IR_SEED');
prompt
prompt SCM_USER_ROLES
prompt
prompt SCM_WAREHOUSES
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (5, 'NL2IRWH001', 'NL2IR Warehouse 001', 'DISTRIBUTION', '
ACTIVE', '101 Demo Logistics Park', 'Sector A', 'Bengaluru', 'Karnataka', '56000
1', 'IN', to_timestamp_tz('2026-01-14 16:18:49.213399 +00:00','YYYY-MM-DD HH24:M
I:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (6, 'NL2IRWH002', 'NL2IR Warehouse 002', 'FULFILMENT', 'AC
TIVE', '102 Demo Logistics Park', 'Sector B', 'Hyderabad', 'Telangana', '560002'
, 'IN', to_timestamp_tz('2026-01-15 16:18:49.214021 +00:00','YYYY-MM-DD HH24:MI:
SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (7, 'NL2IRWH003', 'NL2IR Warehouse 003', 'RETURNS', 'ACTIV
E', '103 Demo Logistics Park', 'Sector C', 'Mumbai', 'Maharashtra', '560003', 'I
N', to_timestamp_tz('2026-01-16 16:18:49.214077 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (8, 'NL2IRWH004', 'NL2IR Warehouse 004', 'CROSS_DOCK', 'AC
TIVE', '104 Demo Logistics Park', 'Sector D', 'Pune', 'Maharashtra', '560004', '
IN', to_timestamp_tz('2026-01-17 16:18:49.214113 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (9, 'NL2IRWH005', 'NL2IR Warehouse 005', 'SPARES', 'ACTIVE
', '105 Demo Logistics Park', 'Sector E', 'Chennai', 'Tamil Nadu', '560005', 'IN
', to_timestamp_tz('2026-01-18 16:18:49.214144 +00:00','YYYY-MM-DD HH24:MI:SS.FF
6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (10, 'NL2IRWH006', 'NL2IR Warehouse 006', 'DISTRIBUTION',
'ACTIVE', '106 Demo Logistics Park', 'Sector F', 'Bengaluru', 'Karnataka', '5600
06', 'IN', to_timestamp_tz('2026-01-19 16:18:49.214176 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (11, 'NL2IRWH007', 'NL2IR Warehouse 007', 'FULFILMENT', 'A
CTIVE', '107 Demo Logistics Park', 'Sector G', 'Hyderabad', 'Telangana', '560007
', 'IN', to_timestamp_tz('2026-01-20 16:18:49.214205 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (12, 'NL2IRWH008', 'NL2IR Warehouse 008', 'RETURNS', 'ACTI
VE', '108 Demo Logistics Park', 'Sector H', 'Mumbai', 'Maharashtra', '560008', '
IN', to_timestamp_tz('2026-01-21 16:18:49.214237 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (13, 'NL2IRWH009', 'NL2IR Warehouse 009', 'CROSS_DOCK', 'A
CTIVE', '109 Demo Logistics Park', 'Sector I', 'Pune', 'Maharashtra', '560009',
'IN', to_timestamp_tz('2026-01-22 16:18:49.214267 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (14, 'NL2IRWH010', 'NL2IR Warehouse 010', 'SPARES', 'ACTIV
E', '110 Demo Logistics Park', 'Sector J', 'Chennai', 'Tamil Nadu', '560010', 'I
N', to_timestamp_tz('2026-01-23 16:18:49.214296 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (15, 'NL2IRWH011', 'NL2IR Warehouse 011', 'DISTRIBUTION',
'ACTIVE', '111 Demo Logistics Park', 'Sector K', 'Bengaluru', 'Karnataka', '5600
11', 'IN', to_timestamp_tz('2026-01-24 16:18:49.214324 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (16, 'NL2IRWH012', 'NL2IR Warehouse 012', 'FULFILMENT', 'A
CTIVE', '112 Demo Logistics Park', 'Sector L', 'Hyderabad', 'Telangana', '560012
', 'IN', to_timestamp_tz('2026-01-25 16:18:49.214353 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (17, 'NL2IRWH013', 'NL2IR Warehouse 013', 'RETURNS', 'ACTI
VE', '113 Demo Logistics Park', 'Sector M', 'Mumbai', 'Maharashtra', '560013', '
IN', to_timestamp_tz('2026-01-26 16:18:49.214402 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (18, 'NL2IRWH014', 'NL2IR Warehouse 014', 'CROSS_DOCK', 'A
CTIVE', '114 Demo Logistics Park', 'Sector N', 'Pune', 'Maharashtra', '560014',
'IN', to_timestamp_tz('2026-01-27 16:18:49.214439 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (19, 'NL2IRWH015', 'NL2IR Warehouse 015', 'SPARES', 'ACTIV
E', '115 Demo Logistics Park', 'Sector O', 'Chennai', 'Tamil Nadu', '560015', 'I
N', to_timestamp_tz('2026-01-28 16:18:49.214469 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (20, 'NL2IRWH016', 'NL2IR Warehouse 016', 'DISTRIBUTION',
'ACTIVE', '116 Demo Logistics Park', 'Sector P', 'Bengaluru', 'Karnataka', '5600
16', 'IN', to_timestamp_tz('2026-01-29 16:18:49.214498 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (21, 'NL2IRWH017', 'NL2IR Warehouse 017', 'FULFILMENT', 'A
CTIVE', '117 Demo Logistics Park', 'Sector Q', 'Hyderabad', 'Telangana', '560017
', 'IN', to_timestamp_tz('2026-01-30 16:18:49.214542 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (22, 'NL2IRWH018', 'NL2IR Warehouse 018', 'RETURNS', 'ACTI
VE', '118 Demo Logistics Park', 'Sector R', 'Mumbai', 'Maharashtra', '560018', '
IN', to_timestamp_tz('2026-01-31 16:18:49.214570 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (23, 'NL2IRWH019', 'NL2IR Warehouse 019', 'CROSS_DOCK', 'A
CTIVE', '119 Demo Logistics Park', 'Sector S', 'Pune', 'Maharashtra', '560019',
'IN', to_timestamp_tz('2026-02-01 16:18:49.214598 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (24, 'NL2IRWH020', 'NL2IR Warehouse 020', 'SPARES', 'ACTIV
E', '120 Demo Logistics Park', 'Sector T', 'Chennai', 'Tamil Nadu', '560020', 'I
N', to_timestamp_tz('2026-02-02 16:18:49.214625 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (25, 'NL2IRWH021', 'NL2IR Warehouse 021', 'DISTRIBUTION',
'ACTIVE', '121 Demo Logistics Park', 'Sector U', 'Bengaluru', 'Karnataka', '5600
21', 'IN', to_timestamp_tz('2026-02-03 16:18:49.214652 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (26, 'NL2IRWH022', 'NL2IR Warehouse 022', 'FULFILMENT', 'A
CTIVE', '122 Demo Logistics Park', 'Sector V', 'Hyderabad', 'Telangana', '560022
', 'IN', to_timestamp_tz('2026-02-04 16:18:49.214681 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (27, 'NL2IRWH023', 'NL2IR Warehouse 023', 'RETURNS', 'ACTI
VE', '123 Demo Logistics Park', 'Sector W', 'Mumbai', 'Maharashtra', '560023', '
IN', to_timestamp_tz('2026-02-05 16:18:49.214708 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (28, 'NL2IRWH024', 'NL2IR Warehouse 024', 'CROSS_DOCK', 'A
CTIVE', '124 Demo Logistics Park', 'Sector X', 'Pune', 'Maharashtra', '560024',
'IN', to_timestamp_tz('2026-02-06 16:18:49.214734 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (29, 'NL2IRWH025', 'NL2IR Warehouse 025', 'SPARES', 'ACTIV
E', '125 Demo Logistics Park', 'Sector Y', 'Chennai', 'Tamil Nadu', '560025', 'I
N', to_timestamp_tz('2026-02-07 16:18:49.214761 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (30, 'NL2IRWH026', 'NL2IR Warehouse 026', 'DISTRIBUTION',
'ACTIVE', '126 Demo Logistics Park', 'Sector Z', 'Bengaluru', 'Karnataka', '5600
26', 'IN', to_timestamp_tz('2026-02-08 16:18:49.214789 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (31, 'NL2IRWH027', 'NL2IR Warehouse 027', 'FULFILMENT', 'A
CTIVE', '127 Demo Logistics Park', 'Sector A', 'Hyderabad', 'Telangana', '560027
', 'IN', to_timestamp_tz('2026-02-09 16:18:49.214815 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (32, 'NL2IRWH028', 'NL2IR Warehouse 028', 'RETURNS', 'ACTI
VE', '128 Demo Logistics Park', 'Sector B', 'Mumbai', 'Maharashtra', '560028', '
IN', to_timestamp_tz('2026-02-10 16:18:49.214946 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (33, 'NL2IRWH029', 'NL2IR Warehouse 029', 'CROSS_DOCK', 'A
CTIVE', '129 Demo Logistics Park', 'Sector C', 'Pune', 'Maharashtra', '560029',
'IN', to_timestamp_tz('2026-02-11 16:18:49.214976 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (34, 'NL2IRWH030', 'NL2IR Warehouse 030', 'SPARES', 'ACTIV
E', '130 Demo Logistics Park', 'Sector D', 'Chennai', 'Tamil Nadu', '560030', 'I
N', to_timestamp_tz('2026-02-12 16:18:49.215002 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (35, 'NL2IRWH031', 'NL2IR Warehouse 031', 'DISTRIBUTION',
'ACTIVE', '131 Demo Logistics Park', 'Sector E', 'Bengaluru', 'Karnataka', '5600
31', 'IN', to_timestamp_tz('2026-02-13 16:18:49.215031 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (36, 'NL2IRWH032', 'NL2IR Warehouse 032', 'FULFILMENT', 'A
CTIVE', '132 Demo Logistics Park', 'Sector F', 'Hyderabad', 'Telangana', '560032
', 'IN', to_timestamp_tz('2026-02-14 16:18:49.215059 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (37, 'NL2IRWH033', 'NL2IR Warehouse 033', 'RETURNS', 'ACTI
VE', '133 Demo Logistics Park', 'Sector G', 'Mumbai', 'Maharashtra', '560033', '
IN', to_timestamp_tz('2026-02-15 16:18:49.215085 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (38, 'NL2IRWH034', 'NL2IR Warehouse 034', 'CROSS_DOCK', 'A
CTIVE', '134 Demo Logistics Park', 'Sector H', 'Pune', 'Maharashtra', '560034',
'IN', to_timestamp_tz('2026-02-16 16:18:49.215111 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (39, 'NL2IRWH035', 'NL2IR Warehouse 035', 'SPARES', 'ACTIV
E', '135 Demo Logistics Park', 'Sector I', 'Chennai', 'Tamil Nadu', '560035', 'I
N', to_timestamp_tz('2026-02-17 16:18:49.215139 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (40, 'NL2IRWH036', 'NL2IR Warehouse 036', 'DISTRIBUTION',
'ACTIVE', '136 Demo Logistics Park', 'Sector J', 'Bengaluru', 'Karnataka', '5600
36', 'IN', to_timestamp_tz('2026-02-18 16:18:49.215166 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (41, 'NL2IRWH037', 'NL2IR Warehouse 037', 'FULFILMENT', 'A
CTIVE', '137 Demo Logistics Park', 'Sector K', 'Hyderabad', 'Telangana', '560037
', 'IN', to_timestamp_tz('2026-02-19 16:18:49.215193 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (42, 'NL2IRWH038', 'NL2IR Warehouse 038', 'RETURNS', 'ACTI
VE', '138 Demo Logistics Park', 'Sector L', 'Mumbai', 'Maharashtra', '560038', '
IN', to_timestamp_tz('2026-02-20 16:18:49.215219 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (43, 'NL2IRWH039', 'NL2IR Warehouse 039', 'CROSS_DOCK', 'A
CTIVE', '139 Demo Logistics Park', 'Sector M', 'Pune', 'Maharashtra', '560039',
'IN', to_timestamp_tz('2026-02-21 16:18:49.215245 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (44, 'NL2IRWH040', 'NL2IR Warehouse 040', 'SPARES', 'ACTIV
E', '140 Demo Logistics Park', 'Sector N', 'Chennai', 'Tamil Nadu', '560040', 'I
N', to_timestamp_tz('2026-02-22 16:18:49.215273 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (45, 'NL2IRWH041', 'NL2IR Warehouse 041', 'DISTRIBUTION',
'ACTIVE', '141 Demo Logistics Park', 'Sector O', 'Bengaluru', 'Karnataka', '5600
41', 'IN', to_timestamp_tz('2026-02-23 16:18:49.215300 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (46, 'NL2IRWH042', 'NL2IR Warehouse 042', 'FULFILMENT', 'A
CTIVE', '142 Demo Logistics Park', 'Sector P', 'Hyderabad', 'Telangana', '560042
', 'IN', to_timestamp_tz('2026-02-24 16:18:49.215326 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (47, 'NL2IRWH043', 'NL2IR Warehouse 043', 'RETURNS', 'ACTI
VE', '143 Demo Logistics Park', 'Sector Q', 'Mumbai', 'Maharashtra', '560043', '
IN', to_timestamp_tz('2026-02-25 16:18:49.215352 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (48, 'NL2IRWH044', 'NL2IR Warehouse 044', 'CROSS_DOCK', 'A
CTIVE', '144 Demo Logistics Park', 'Sector R', 'Pune', 'Maharashtra', '560044',
'IN', to_timestamp_tz('2026-02-26 16:18:49.215382 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (49, 'NL2IRWH045', 'NL2IR Warehouse 045', 'SPARES', 'ACTIV
E', '145 Demo Logistics Park', 'Sector S', 'Chennai', 'Tamil Nadu', '560045', 'I
N', to_timestamp_tz('2026-02-27 16:18:49.215408 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (50, 'NL2IRWH046', 'NL2IR Warehouse 046', 'DISTRIBUTION',
'ACTIVE', '146 Demo Logistics Park', 'Sector T', 'Bengaluru', 'Karnataka', '5600
46', 'IN', to_timestamp_tz('2026-02-28 16:18:49.215434 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (51, 'NL2IRWH047', 'NL2IR Warehouse 047', 'FULFILMENT', 'A
CTIVE', '147 Demo Logistics Park', 'Sector U', 'Hyderabad', 'Telangana', '560047
', 'IN', to_timestamp_tz('2026-03-01 16:18:49.215460 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (52, 'NL2IRWH048', 'NL2IR Warehouse 048', 'RETURNS', 'ACTI
VE', '148 Demo Logistics Park', 'Sector V', 'Mumbai', 'Maharashtra', '560048', '
IN', to_timestamp_tz('2026-03-02 16:18:49.215487 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (53, 'NL2IRWH049', 'NL2IR Warehouse 049', 'CROSS_DOCK', 'A
CTIVE', '149 Demo Logistics Park', 'Sector W', 'Pune', 'Maharashtra', '560049',
'IN', to_timestamp_tz('2026-03-03 16:18:49.215515 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), 'NL2IR_SEED');
insert into scm_warehouses overriding system value (warehouse_id, warehouse_code
, warehouse_name, warehouse_type_code, warehouse_status_code, address_line_1, ad
dress_line_2, city_name, state_region_name, postal_code, country_code, created_a
t, created_by) values (54, 'NL2IRWH050', 'NL2IR Warehouse 050', 'SPARES', 'ACTIV
E', '150 Demo Logistics Park', 'Sector X', 'Chennai', 'Tamil Nadu', '560050', 'I
N', to_timestamp_tz('2026-03-04 16:18:49.215554 +00:00','YYYY-MM-DD HH24:MI:SS.F
F6 TZH:TZM'), 'NL2IR_SEED');
prompt
prompt SCM_ALERT_RULES
prompt
prompt SCM_APPLICATION_USERS
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (10, 'NL2IR_USER_0
01', 'NL2IR Planner 001', 'nl2ir.user.001@example.com', 'ACTIVE', 5, true, 0, 'S
eeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (11, 'NL2IR_USER_0
02', 'NL2IR Planner 002', 'nl2ir.user.002@example.com', 'ACTIVE', 6, true, 1, 'S
eeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (12, 'NL2IR_USER_0
03', 'NL2IR Planner 003', 'nl2ir.user.003@example.com', 'ACTIVE', 7, true, 2, 'S
eeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (13, 'NL2IR_USER_0
04', 'NL2IR Planner 004', 'nl2ir.user.004@example.com', 'ACTIVE', 8, true, 3, 'S
eeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (14, 'NL2IR_USER_0
05', 'NL2IR Planner 005', 'nl2ir.user.005@example.com', 'ACTIVE', 9, true, 4, 'S
eeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (15, 'NL2IR_USER_0
06', 'NL2IR Planner 006', 'nl2ir.user.006@example.com', 'ACTIVE', 10, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (16, 'NL2IR_USER_0
07', 'NL2IR Planner 007', 'nl2ir.user.007@example.com', 'ACTIVE', 11, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (17, 'NL2IR_USER_0
08', 'NL2IR Planner 008', 'nl2ir.user.008@example.com', 'ACTIVE', 12, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (18, 'NL2IR_USER_0
09', 'NL2IR Planner 009', 'nl2ir.user.009@example.com', 'ACTIVE', 13, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (19, 'NL2IR_USER_0
10', 'NL2IR Planner 010', 'nl2ir.user.010@example.com', 'ACTIVE', 14, true, 4, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (20, 'NL2IR_USER_0
11', 'NL2IR Planner 011', 'nl2ir.user.011@example.com', 'ACTIVE', 15, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (21, 'NL2IR_USER_0
12', 'NL2IR Planner 012', 'nl2ir.user.012@example.com', 'ACTIVE', 16, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (22, 'NL2IR_USER_0
13', 'NL2IR Planner 013', 'nl2ir.user.013@example.com', 'ACTIVE', 17, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (23, 'NL2IR_USER_0
14', 'NL2IR Planner 014', 'nl2ir.user.014@example.com', 'ACTIVE', 18, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (24, 'NL2IR_USER_0
15', 'NL2IR Planner 015', 'nl2ir.user.015@example.com', 'ACTIVE', 19, true, 4, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (25, 'NL2IR_USER_0
16', 'NL2IR Planner 016', 'nl2ir.user.016@example.com', 'ACTIVE', 20, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (26, 'NL2IR_USER_0
17', 'NL2IR Planner 017', 'nl2ir.user.017@example.com', 'ACTIVE', 21, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (27, 'NL2IR_USER_0
18', 'NL2IR Planner 018', 'nl2ir.user.018@example.com', 'ACTIVE', 22, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (28, 'NL2IR_USER_0
19', 'NL2IR Planner 019', 'nl2ir.user.019@example.com', 'ACTIVE', 23, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (29, 'NL2IR_USER_0
20', 'NL2IR Planner 020', 'nl2ir.user.020@example.com', 'ACTIVE', 24, true, 4, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (30, 'NL2IR_USER_0
21', 'NL2IR Planner 021', 'nl2ir.user.021@example.com', 'ACTIVE', 25, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (31, 'NL2IR_USER_0
22', 'NL2IR Planner 022', 'nl2ir.user.022@example.com', 'ACTIVE', 26, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (32, 'NL2IR_USER_0
23', 'NL2IR Planner 023', 'nl2ir.user.023@example.com', 'ACTIVE', 27, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (33, 'NL2IR_USER_0
24', 'NL2IR Planner 024', 'nl2ir.user.024@example.com', 'ACTIVE', 28, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (34, 'NL2IR_USER_0
25', 'NL2IR Planner 025', 'nl2ir.user.025@example.com', 'ACTIVE', 29, true, 4, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (35, 'NL2IR_USER_0
26', 'NL2IR Planner 026', 'nl2ir.user.026@example.com', 'ACTIVE', 30, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (36, 'NL2IR_USER_0
27', 'NL2IR Planner 027', 'nl2ir.user.027@example.com', 'ACTIVE', 31, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (37, 'NL2IR_USER_0
28', 'NL2IR Planner 028', 'nl2ir.user.028@example.com', 'ACTIVE', 32, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (38, 'NL2IR_USER_0
29', 'NL2IR Planner 029', 'nl2ir.user.029@example.com', 'ACTIVE', 33, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (39, 'NL2IR_USER_0
30', 'NL2IR Planner 030', 'nl2ir.user.030@example.com', 'ACTIVE', 34, true, 4, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (40, 'NL2IR_USER_0
31', 'NL2IR Planner 031', 'nl2ir.user.031@example.com', 'ACTIVE', 35, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (41, 'NL2IR_USER_0
32', 'NL2IR Planner 032', 'nl2ir.user.032@example.com', 'ACTIVE', 36, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (42, 'NL2IR_USER_0
33', 'NL2IR Planner 033', 'nl2ir.user.033@example.com', 'ACTIVE', 37, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (43, 'NL2IR_USER_0
34', 'NL2IR Planner 034', 'nl2ir.user.034@example.com', 'ACTIVE', 38, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (44, 'NL2IR_USER_0
35', 'NL2IR Planner 035', 'nl2ir.user.035@example.com', 'ACTIVE', 39, true, 4, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (45, 'NL2IR_USER_0
36', 'NL2IR Planner 036', 'nl2ir.user.036@example.com', 'ACTIVE', 40, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (46, 'NL2IR_USER_0
37', 'NL2IR Planner 037', 'nl2ir.user.037@example.com', 'ACTIVE', 41, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (47, 'NL2IR_USER_0
38', 'NL2IR Planner 038', 'nl2ir.user.038@example.com', 'ACTIVE', 42, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (48, 'NL2IR_USER_0
39', 'NL2IR Planner 039', 'nl2ir.user.039@example.com', 'ACTIVE', 43, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (49, 'NL2IR_USER_0
40', 'NL2IR Planner 040', 'nl2ir.user.040@example.com', 'ACTIVE', 44, true, 4, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (50, 'NL2IR_USER_0
41', 'NL2IR Planner 041', 'nl2ir.user.041@example.com', 'ACTIVE', 45, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (51, 'NL2IR_USER_0
42', 'NL2IR Planner 042', 'nl2ir.user.042@example.com', 'ACTIVE', 46, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (52, 'NL2IR_USER_0
43', 'NL2IR Planner 043', 'nl2ir.user.043@example.com', 'ACTIVE', 47, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (53, 'NL2IR_USER_0
44', 'NL2IR Planner 044', 'nl2ir.user.044@example.com', 'ACTIVE', 48, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (54, 'NL2IR_USER_0
45', 'NL2IR Planner 045', 'nl2ir.user.045@example.com', 'ACTIVE', 49, true, 4, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (55, 'NL2IR_USER_0
46', 'NL2IR Planner 046', 'nl2ir.user.046@example.com', 'ACTIVE', 50, true, 0, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (56, 'NL2IR_USER_0
47', 'NL2IR Planner 047', 'nl2ir.user.047@example.com', 'ACTIVE', 51, true, 1, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (57, 'NL2IR_USER_0
48', 'NL2IR Planner 048', 'nl2ir.user.048@example.com', 'ACTIVE', 52, true, 2, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (58, 'NL2IR_USER_0
49', 'NL2IR Planner 049', 'nl2ir.user.049@example.com', 'ACTIVE', 53, true, 3, '
Seeded application user for replenishment alert triage and review.');
insert into scm_application_users overriding system value (application_user_id,
user_name, full_name, email_address, user_status_code, default_warehouse_id, can
_receive_alerts, approval_authority_level, user_notes) values (59, 'NL2IR_USER_0
50', 'NL2IR Planner 050', 'nl2ir.user.050@example.com', 'ACTIVE', 54, true, 4, '
Seeded application user for replenishment alert triage and review.');
prompt
prompt SCM_APPROVAL_POLICIES
prompt
prompt SCM_AUDIT_EVENTS
prompt
prompt SCM_BUSINESS_LISTS
prompt
prompt SCM_INVENTORY_LOTS
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (19, 37, 'NL2IRLOT001', 'S
UPLOT001', date '2025-12-13', date '2026-02-26', date '2026-07-13', date '2026-0
8-12', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (20, 38, 'NL2IRLOT002', 'S
UPLOT002', date '2025-12-12', date '2026-02-25', date '2026-07-14', date '2026-0
8-13', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (21, 39, 'NL2IRLOT003', 'S
UPLOT003', date '2025-12-11', date '2026-02-24', date '2026-07-15', date '2026-0
8-14', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (22, 40, 'NL2IRLOT004', 'S
UPLOT004', date '2025-12-10', date '2026-02-23', date '2026-07-16', date '2026-0
8-15', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (23, 41, 'NL2IRLOT005', 'S
UPLOT005', date '2025-12-09', date '2026-02-22', date '2026-07-17', date '2026-0
8-16', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (24, 42, 'NL2IRLOT006', 'S
UPLOT006', date '2025-12-08', date '2026-02-21', date '2026-07-18', date '2026-0
8-17', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (25, 43, 'NL2IRLOT007', 'S
UPLOT007', date '2025-12-07', date '2026-02-20', date '2026-07-19', date '2026-0
8-18', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (26, 44, 'NL2IRLOT008', 'S
UPLOT008', date '2025-12-06', date '2026-02-19', date '2026-07-20', date '2026-0
8-19', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (27, 45, 'NL2IRLOT009', 'S
UPLOT009', date '2025-12-05', date '2026-02-18', date '2026-07-21', date '2026-0
8-20', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (28, 46, 'NL2IRLOT010', 'S
UPLOT010', date '2025-12-04', date '2026-02-17', date '2026-07-22', date '2026-0
8-21', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (29, 47, 'NL2IRLOT011', 'S
UPLOT011', date '2025-12-03', date '2026-02-16', date '2026-07-23', date '2026-0
8-22', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (30, 48, 'NL2IRLOT012', 'S
UPLOT012', date '2025-12-02', date '2026-02-15', date '2026-07-24', date '2026-0
8-23', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (31, 49, 'NL2IRLOT013', 'S
UPLOT013', date '2025-12-01', date '2026-02-14', date '2026-07-25', date '2026-0
8-24', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (32, 50, 'NL2IRLOT014', 'S
UPLOT014', date '2025-11-30', date '2026-02-13', date '2026-07-26', date '2026-0
8-25', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (33, 51, 'NL2IRLOT015', 'S
UPLOT015', date '2025-11-29', date '2026-02-12', date '2026-07-27', date '2026-0
8-26', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (34, 52, 'NL2IRLOT016', 'S
UPLOT016', date '2025-11-28', date '2026-02-11', date '2026-07-28', date '2026-0
8-27', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (35, 53, 'NL2IRLOT017', 'S
UPLOT017', date '2025-11-27', date '2026-02-10', date '2026-07-29', date '2026-0
8-28', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (36, 54, 'NL2IRLOT018', 'S
UPLOT018', date '2025-11-26', date '2026-02-09', date '2026-07-30', date '2026-0
8-29', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (37, 55, 'NL2IRLOT019', 'S
UPLOT019', date '2025-11-25', date '2026-02-08', date '2026-07-31', date '2026-0
8-30', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (38, 56, 'NL2IRLOT020', 'S
UPLOT020', date '2025-11-24', date '2026-02-27', date '2026-08-01', date '2026-0
8-31', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (39, 57, 'NL2IRLOT021', 'S
UPLOT021', date '2025-11-23', date '2026-02-26', date '2026-08-02', date '2026-0
9-01', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (40, 58, 'NL2IRLOT022', 'S
UPLOT022', date '2025-11-22', date '2026-02-25', date '2026-08-03', date '2026-0
9-02', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (41, 59, 'NL2IRLOT023', 'S
UPLOT023', date '2025-11-21', date '2026-02-24', date '2026-08-04', date '2026-0
9-03', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (42, 60, 'NL2IRLOT024', 'S
UPLOT024', date '2025-11-20', date '2026-02-23', date '2026-08-05', date '2026-0
9-04', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (43, 61, 'NL2IRLOT025', 'S
UPLOT025', date '2025-11-19', date '2026-02-22', date '2026-08-06', date '2026-0
9-05', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (44, 62, 'NL2IRLOT026', 'S
UPLOT026', date '2025-11-18', date '2026-02-21', date '2026-08-07', date '2026-0
9-06', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (45, 63, 'NL2IRLOT027', 'S
UPLOT027', date '2025-11-17', date '2026-02-20', date '2026-08-08', date '2026-0
9-07', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (46, 64, 'NL2IRLOT028', 'S
UPLOT028', date '2025-11-16', date '2026-02-19', date '2026-08-09', date '2026-0
9-08', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (47, 65, 'NL2IRLOT029', 'S
UPLOT029', date '2025-11-15', date '2026-02-18', date '2026-08-10', date '2026-0
9-09', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (48, 66, 'NL2IRLOT030', 'S
UPLOT030', date '2025-11-14', date '2026-02-17', date '2026-08-11', date '2026-0
9-10', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (49, 67, 'NL2IRLOT031', 'S
UPLOT031', date '2025-11-13', date '2026-02-16', date '2026-08-12', date '2026-0
9-11', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (50, 68, 'NL2IRLOT032', 'S
UPLOT032', date '2025-11-12', date '2026-02-15', date '2026-08-13', date '2026-0
9-12', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (51, 69, 'NL2IRLOT033', 'S
UPLOT033', date '2025-11-11', date '2026-02-14', date '2026-08-14', date '2026-0
9-13', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (52, 70, 'NL2IRLOT034', 'S
UPLOT034', date '2025-11-10', date '2026-02-13', date '2026-08-15', date '2026-0
9-14', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (53, 71, 'NL2IRLOT035', 'S
UPLOT035', date '2025-11-09', date '2026-02-12', date '2026-08-16', date '2026-0
9-15', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (54, 72, 'NL2IRLOT036', 'S
UPLOT036', date '2025-11-08', date '2026-02-11', date '2026-08-17', date '2026-0
9-16', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (55, 73, 'NL2IRLOT037', 'S
UPLOT037', date '2025-11-07', date '2026-02-10', date '2026-08-18', date '2026-0
9-17', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (56, 74, 'NL2IRLOT038', 'S
UPLOT038', date '2025-11-06', date '2026-02-09', date '2026-08-19', date '2026-0
9-18', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (57, 75, 'NL2IRLOT039', 'S
UPLOT039', date '2025-11-05', date '2026-02-08', date '2026-08-20', date '2026-0
9-19', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (58, 76, 'NL2IRLOT040', 'S
UPLOT040', date '2025-11-04', date '2026-02-27', date '2026-08-21', date '2026-0
9-20', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (59, 77, 'NL2IRLOT041', 'S
UPLOT041', date '2025-11-03', date '2026-02-26', date '2026-08-22', date '2026-0
9-21', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (60, 78, 'NL2IRLOT042', 'S
UPLOT042', date '2025-11-02', date '2026-02-25', date '2026-08-23', date '2026-0
9-22', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (61, 79, 'NL2IRLOT043', 'S
UPLOT043', date '2025-11-01', date '2026-02-24', date '2026-08-24', date '2026-0
9-23', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (62, 80, 'NL2IRLOT044', 'S
UPLOT044', date '2025-10-31', date '2026-02-23', date '2026-08-25', date '2026-0
9-24', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (63, 81, 'NL2IRLOT045', 'S
UPLOT045', date '2025-10-30', date '2026-02-22', date '2026-08-26', date '2026-0
9-25', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (64, 82, 'NL2IRLOT046', 'S
UPLOT046', date '2025-10-29', date '2026-02-21', date '2026-08-27', date '2026-0
9-26', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (65, 83, 'NL2IRLOT047', 'S
UPLOT047', date '2025-10-28', date '2026-02-20', date '2026-08-28', date '2026-0
9-27', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (66, 84, 'NL2IRLOT048', 'S
UPLOT048', date '2025-10-27', date '2026-02-19', date '2026-08-29', date '2026-0
9-28', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (67, 85, 'NL2IRLOT049', 'S
UPLOT049', date '2025-10-26', date '2026-02-18', date '2026-08-30', date '2026-0
9-29', 'ACTIVE');
insert into scm_inventory_lots overriding system value (inventory_lot_id, item_i
d, lot_number, supplier_lot_number, manufactured_on_date, received_on_date, best
_before_date, expiry_on_date, lot_status_code) values (68, 86, 'NL2IRLOT050', 'S
UPLOT050', date '2025-10-25', date '2026-02-17', date '2026-08-31', date '2026-0
9-30', 'ACTIVE');
prompt
prompt SCM_PARTNER_SITES
prompt
prompt SCM_PICK_WAVES
prompt
prompt SCM_RECORD_ATTACHMENTS
prompt
prompt SCM_RECORD_NOTES
prompt
prompt SCM_ROLE_PERMISSIONS
prompt
prompt SCM_STOCK_COUNTS
prompt
prompt SCM_WAREHOUSE_AREAS
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(21, 5, 'NL2IRAR001', 'Primary Picking Area 001', 'PICKING', 'ACTIVE', 1, true,
false, false, true, false, 'Seeded picking area for NL2IR replenishment demo war
ehouse 001');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(22, 6, 'NL2IRAR002', 'Primary Picking Area 002', 'PICKING', 'ACTIVE', 2, true,
false, false, true, false, 'Seeded picking area for NL2IR replenishment demo war
ehouse 002');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(23, 7, 'NL2IRAR003', 'Primary Picking Area 003', 'PICKING', 'ACTIVE', 3, true,
false, false, false, false, 'Seeded picking area for NL2IR replenishment demo wa
rehouse 003');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(24, 8, 'NL2IRAR004', 'Primary Picking Area 004', 'PICKING', 'ACTIVE', 4, true,
false, false, false, false, 'Seeded picking area for NL2IR replenishment demo wa
rehouse 004');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(25, 9, 'NL2IRAR005', 'Primary Picking Area 005', 'PICKING', 'ACTIVE', 5, true,
false, false, false, false, 'Seeded picking area for NL2IR replenishment demo wa
rehouse 005');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(26, 10, 'NL2IRAR006', 'Primary Picking Area 006', 'PICKING', 'ACTIVE', 6, true,
 false, true, true, false, 'Seeded picking area for NL2IR replenishment demo war
ehouse 006');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(27, 11, 'NL2IRAR007', 'Primary Picking Area 007', 'PICKING', 'ACTIVE', 7, true,
 false, false, true, true, 'Seeded picking area for NL2IR replenishment demo war
ehouse 007');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(28, 12, 'NL2IRAR008', 'Primary Picking Area 008', 'PICKING', 'ACTIVE', 8, true,
 false, false, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 008');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(29, 13, 'NL2IRAR009', 'Primary Picking Area 009', 'PICKING', 'ACTIVE', 9, true,
 false, false, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 009');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(30, 14, 'NL2IRAR010', 'Primary Picking Area 010', 'PICKING', 'ACTIVE', 10, true
, true, false, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 010');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(31, 15, 'NL2IRAR011', 'Primary Picking Area 011', 'PICKING', 'ACTIVE', 11, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 011');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(32, 16, 'NL2IRAR012', 'Primary Picking Area 012', 'PICKING', 'ACTIVE', 12, true
, false, true, true, false, 'Seeded picking area for NL2IR replenishment demo wa
rehouse 012');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(33, 17, 'NL2IRAR013', 'Primary Picking Area 013', 'PICKING', 'ACTIVE', 13, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 013');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(34, 18, 'NL2IRAR014', 'Primary Picking Area 014', 'PICKING', 'ACTIVE', 14, true
, false, false, false, true, 'Seeded picking area for NL2IR replenishment demo w
arehouse 014');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(35, 19, 'NL2IRAR015', 'Primary Picking Area 015', 'PICKING', 'ACTIVE', 15, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 015');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(36, 20, 'NL2IRAR016', 'Primary Picking Area 016', 'PICKING', 'ACTIVE', 16, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 016');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(37, 21, 'NL2IRAR017', 'Primary Picking Area 017', 'PICKING', 'ACTIVE', 17, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 017');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(38, 22, 'NL2IRAR018', 'Primary Picking Area 018', 'PICKING', 'ACTIVE', 18, true
, false, true, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 018');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(39, 23, 'NL2IRAR019', 'Primary Picking Area 019', 'PICKING', 'ACTIVE', 19, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 019');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(40, 24, 'NL2IRAR020', 'Primary Picking Area 020', 'PICKING', 'ACTIVE', 20, true
, true, false, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 020');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(41, 25, 'NL2IRAR021', 'Primary Picking Area 021', 'PICKING', 'ACTIVE', 21, true
, false, false, true, true, 'Seeded picking area for NL2IR replenishment demo wa
rehouse 021');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(42, 26, 'NL2IRAR022', 'Primary Picking Area 022', 'PICKING', 'ACTIVE', 22, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 022');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(43, 27, 'NL2IRAR023', 'Primary Picking Area 023', 'PICKING', 'ACTIVE', 23, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 023');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(44, 28, 'NL2IRAR024', 'Primary Picking Area 024', 'PICKING', 'ACTIVE', 24, true
, false, true, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 024');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(45, 29, 'NL2IRAR025', 'Primary Picking Area 025', 'PICKING', 'ACTIVE', 25, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 025');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(46, 30, 'NL2IRAR026', 'Primary Picking Area 026', 'PICKING', 'ACTIVE', 26, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 026');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(47, 31, 'NL2IRAR027', 'Primary Picking Area 027', 'PICKING', 'ACTIVE', 27, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 027');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(48, 32, 'NL2IRAR028', 'Primary Picking Area 028', 'PICKING', 'ACTIVE', 28, true
, false, false, false, true, 'Seeded picking area for NL2IR replenishment demo w
arehouse 028');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(49, 33, 'NL2IRAR029', 'Primary Picking Area 029', 'PICKING', 'ACTIVE', 29, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 029');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(50, 34, 'NL2IRAR030', 'Primary Picking Area 030', 'PICKING', 'ACTIVE', 30, true
, true, true, false, false, 'Seeded picking area for NL2IR replenishment demo wa
rehouse 030');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(51, 35, 'NL2IRAR031', 'Primary Picking Area 031', 'PICKING', 'ACTIVE', 31, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 031');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(52, 36, 'NL2IRAR032', 'Primary Picking Area 032', 'PICKING', 'ACTIVE', 32, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 032');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(53, 37, 'NL2IRAR033', 'Primary Picking Area 033', 'PICKING', 'ACTIVE', 33, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 033');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(54, 38, 'NL2IRAR034', 'Primary Picking Area 034', 'PICKING', 'ACTIVE', 34, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 034');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(55, 39, 'NL2IRAR035', 'Primary Picking Area 035', 'PICKING', 'ACTIVE', 35, true
, false, false, false, true, 'Seeded picking area for NL2IR replenishment demo w
arehouse 035');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(56, 40, 'NL2IRAR036', 'Primary Picking Area 036', 'PICKING', 'ACTIVE', 36, true
, false, true, true, false, 'Seeded picking area for NL2IR replenishment demo wa
rehouse 036');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(57, 41, 'NL2IRAR037', 'Primary Picking Area 037', 'PICKING', 'ACTIVE', 37, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 037');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(58, 42, 'NL2IRAR038', 'Primary Picking Area 038', 'PICKING', 'ACTIVE', 38, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 038');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(59, 43, 'NL2IRAR039', 'Primary Picking Area 039', 'PICKING', 'ACTIVE', 39, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 039');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(60, 44, 'NL2IRAR040', 'Primary Picking Area 040', 'PICKING', 'ACTIVE', 40, true
, true, false, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 040');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(61, 45, 'NL2IRAR041', 'Primary Picking Area 041', 'PICKING', 'ACTIVE', 41, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 041');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(62, 46, 'NL2IRAR042', 'Primary Picking Area 042', 'PICKING', 'ACTIVE', 42, true
, false, true, true, true, 'Seeded picking area for NL2IR replenishment demo war
ehouse 042');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(63, 47, 'NL2IRAR043', 'Primary Picking Area 043', 'PICKING', 'ACTIVE', 43, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 043');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(64, 48, 'NL2IRAR044', 'Primary Picking Area 044', 'PICKING', 'ACTIVE', 44, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 044');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(65, 49, 'NL2IRAR045', 'Primary Picking Area 045', 'PICKING', 'ACTIVE', 45, true
, false, false, false, false, 'Seeded picking area for NL2IR replenishment demo
warehouse 045');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(66, 50, 'NL2IRAR046', 'Primary Picking Area 046', 'PICKING', 'ACTIVE', 46, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 046');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(67, 51, 'NL2IRAR047', 'Primary Picking Area 047', 'PICKING', 'ACTIVE', 47, true
, false, false, true, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 047');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(68, 52, 'NL2IRAR048', 'Primary Picking Area 048', 'PICKING', 'ACTIVE', 48, true
, false, true, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 048');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(69, 53, 'NL2IRAR049', 'Primary Picking Area 049', 'PICKING', 'ACTIVE', 49, true
, false, false, false, true, 'Seeded picking area for NL2IR replenishment demo w
arehouse 049');
insert into scm_warehouse_areas overriding system value (warehouse_area_id, ware
house_id, area_code, area_name, area_type_code, area_status_code, sequence_numbe
r, allows_mixed_items, allows_damaged_stock, approved_for_high_value_flag, appro
ved_for_sensitive_goods_flag, approved_for_restricted_goods_flag, notes) values
(70, 54, 'NL2IRAR050', 'Primary Picking Area 050', 'PICKING', 'ACTIVE', 50, true
, true, false, false, false, 'Seeded picking area for NL2IR replenishment demo w
arehouse 050');
prompt
prompt SCM_APPROVAL_POLICY_STEPS
prompt
prompt SCM_BUSINESS_LIST_VALUES
prompt
prompt SCM_INBOUND_RECEIPTS
prompt
prompt SCM_ITEM_WAREHOUSE_POLICIES
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (73, 37, 5, 'FEFO',
 9, 13, 29, 46, 6, 2, 2, 3, 'A', 21, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (74, 38, 6, 'FEFO',
 10, 14, 30, 47, 7, 3, 3, 4, 'B', 22, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (75, 39, 7, 'FIFO',
 11, 15, 31, 48, 8, 4, 1, 5, 'C', 23, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (76, 40, 8, 'FIFO',
 12, 16, 32, 49, 9, 5, 2, 6, 'A', 24, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (77, 41, 9, 'FIFO',
 13, 17, 33, 50, 5, 6, 3, 7, 'B', 25, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (78, 42, 10, 'FEFO'
, 8, 18, 34, 51, 6, 1, 1, 8, 'C', 26, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (79, 43, 11, 'FEFO'
, 9, 19, 35, 52, 7, 2, 2, 9, 'A', 27, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (80, 44, 12, 'FIFO'
, 10, 12, 36, 53, 8, 3, 3, 2, 'B', 28, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (81, 45, 13, 'FIFO'
, 11, 13, 37, 54, 9, 4, 1, 3, 'C', 29, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (82, 46, 14, 'FIFO'
, 12, 14, 38, 55, 5, 5, 2, 4, 'A', 30, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (83, 47, 15, 'FEFO'
, 13, 15, 39, 56, 6, 6, 3, 5, 'B', 31, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (84, 48, 16, 'FEFO'
, 8, 16, 28, 57, 7, 1, 1, 6, 'C', 32, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (85, 49, 17, 'FIFO'
, 9, 17, 29, 58, 8, 2, 2, 7, 'A', 33, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (86, 50, 18, 'FIFO'
, 10, 18, 30, 59, 9, 3, 3, 8, 'B', 34, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (87, 51, 19, 'FIFO'
, 11, 19, 31, 45, 5, 4, 1, 9, 'C', 35, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (88, 52, 20, 'FEFO'
, 12, 12, 32, 46, 6, 5, 2, 2, 'A', 36, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (89, 53, 21, 'FEFO'
, 13, 13, 33, 47, 7, 6, 3, 3, 'B', 37, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (90, 54, 22, 'FIFO'
, 8, 14, 34, 48, 8, 1, 1, 4, 'C', 38, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (91, 55, 23, 'FIFO'
, 9, 15, 35, 49, 9, 2, 2, 5, 'A', 39, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (92, 56, 24, 'FIFO'
, 10, 16, 36, 50, 5, 3, 3, 6, 'B', 40, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (93, 57, 25, 'FEFO'
, 11, 17, 37, 51, 6, 4, 1, 7, 'C', 41, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (94, 58, 26, 'FEFO'
, 12, 18, 38, 52, 7, 5, 2, 8, 'A', 42, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (95, 59, 27, 'FIFO'
, 13, 19, 39, 53, 8, 6, 3, 9, 'B', 43, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (96, 60, 28, 'FIFO'
, 8, 12, 28, 54, 9, 1, 1, 2, 'C', 44, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (97, 61, 29, 'FIFO'
, 9, 13, 29, 55, 5, 2, 2, 3, 'A', 45, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (98, 62, 30, 'FEFO'
, 10, 14, 30, 56, 6, 3, 3, 4, 'B', 46, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (99, 63, 31, 'FEFO'
, 11, 15, 31, 57, 7, 4, 1, 5, 'C', 47, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (100, 64, 32, 'FIFO
', 12, 16, 32, 58, 8, 5, 2, 6, 'A', 48, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (101, 65, 33, 'FIFO
', 13, 17, 33, 59, 9, 6, 3, 7, 'B', 49, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (102, 66, 34, 'FIFO
', 8, 18, 34, 45, 5, 1, 1, 8, 'C', 50, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (103, 67, 35, 'FEFO
', 9, 19, 35, 46, 6, 2, 2, 9, 'A', 51, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (104, 68, 36, 'FEFO
', 10, 12, 36, 47, 7, 3, 3, 2, 'B', 52, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (105, 69, 37, 'FIFO
', 11, 13, 37, 48, 8, 4, 1, 3, 'C', 53, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (106, 70, 38, 'FIFO
', 12, 14, 38, 49, 9, 5, 2, 4, 'A', 54, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (107, 71, 39, 'FIFO
', 13, 15, 39, 50, 5, 6, 3, 5, 'B', 55, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (108, 72, 40, 'FEFO
', 8, 16, 28, 51, 6, 1, 1, 6, 'C', 56, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (109, 73, 41, 'FEFO
', 9, 17, 29, 52, 7, 2, 2, 7, 'A', 57, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (110, 74, 42, 'FIFO
', 10, 18, 30, 53, 8, 3, 3, 8, 'B', 58, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (111, 75, 43, 'FIFO
', 11, 19, 31, 54, 9, 4, 1, 9, 'C', 59, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (112, 76, 44, 'FIFO
', 12, 12, 32, 55, 5, 5, 2, 2, 'A', 60, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (113, 77, 45, 'FEFO
', 13, 13, 33, 56, 6, 6, 3, 3, 'B', 61, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (114, 78, 46, 'FEFO
', 8, 14, 34, 57, 7, 1, 1, 4, 'C', 62, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (115, 79, 47, 'FIFO
', 9, 15, 35, 58, 8, 2, 2, 5, 'A', 63, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (116, 80, 48, 'FIFO
', 10, 16, 36, 59, 9, 3, 3, 6, 'B', 64, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (117, 81, 49, 'FIFO
', 11, 17, 37, 45, 5, 4, 1, 7, 'C', 65, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (118, 82, 50, 'FEFO
', 12, 18, 38, 46, 6, 5, 2, 8, 'A', 66, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (119, 83, 51, 'FEFO
', 13, 19, 39, 47, 7, 6, 3, 9, 'B', 67, true, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (120, 84, 52, 'FIFO
', 8, 12, 28, 48, 8, 1, 1, 2, 'C', 68, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (121, 85, 53, 'FIFO
', 9, 13, 29, 49, 9, 2, 2, 3, 'A', 69, false, true, true);
insert into scm_item_warehouse_policies overriding system value (item_warehouse_
policy_id, item_id, warehouse_id, rotation_method_code, minimum_stock_quantity,
reorder_point_quantity, reorder_target_quantity, maximum_stock_quantity, safety_
stock_quantity, replenishment_lead_time_days, count_tolerance_quantity, count_to
lerance_percent, cycle_count_class_code, preferred_pick_area_id, quarantine_on_r
eceipt_flag, low_stock_alert_enabled_flag, is_active) values (122, 86, 54, 'FIFO
', 10, 14, 30, 50, 5, 3, 3, 4, 'B', 70, false, true, true);
prompt
prompt SCM_OUTBOUND_ORDERS
prompt
prompt SCM_STOCK_ADJUSTMENTS
prompt
prompt SCM_STOCK_TRANSFERS
prompt
prompt SCM_STORAGE_LOCATIONS
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (29, 5, 21, 'NL2IRLOC001', 'Primary Pick Face 0
01', 'PICK_FACE', 'ACTIVE', 'A01', 'B01', 'L01', 'P001', 105, 1, 1, false, true,
 false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (30, 6, 22, 'NL2IRLOC002', 'Primary Pick Face 0
02', 'PICK_FACE', 'ACTIVE', 'A02', 'B02', 'L02', 'P002', 110, 2, 2, false, true,
 false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (31, 7, 23, 'NL2IRLOC003', 'Primary Pick Face 0
03', 'PICK_FACE', 'ACTIVE', 'A03', 'B03', 'L03', 'P003', 115, 3, 3, false, false
, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (32, 8, 24, 'NL2IRLOC004', 'Primary Pick Face 0
04', 'PICK_FACE', 'ACTIVE', 'A04', 'B04', 'L04', 'P004', 120, 4, 4, false, false
, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (33, 9, 25, 'NL2IRLOC005', 'Primary Pick Face 0
05', 'PICK_FACE', 'ACTIVE', 'A05', 'B05', 'L05', 'P005', 125, 5, 5, false, false
, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (34, 10, 26, 'NL2IRLOC006', 'Primary Pick Face
006', 'PICK_FACE', 'ACTIVE', 'A06', 'B06', 'L01', 'P006', 130, 6, 6, true, true,
 false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (35, 11, 27, 'NL2IRLOC007', 'Primary Pick Face
007', 'PICK_FACE', 'ACTIVE', 'A07', 'B07', 'L02', 'P007', 135, 7, 7, false, true
, true, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (36, 12, 28, 'NL2IRLOC008', 'Primary Pick Face
008', 'PICK_FACE', 'ACTIVE', 'A08', 'B08', 'L03', 'P008', 140, 8, 8, false, fals
e, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (37, 13, 29, 'NL2IRLOC009', 'Primary Pick Face
009', 'PICK_FACE', 'ACTIVE', 'A09', 'B09', 'L04', 'P009', 145, 9, 9, false, fals
e, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (38, 14, 30, 'NL2IRLOC010', 'Primary Pick Face
010', 'PICK_FACE', 'ACTIVE', 'A10', 'B10', 'L05', 'P010', 150, 10, 10, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (39, 15, 31, 'NL2IRLOC011', 'Primary Pick Face
011', 'PICK_FACE', 'ACTIVE', 'A01', 'B11', 'L01', 'P011', 155, 11, 11, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (40, 16, 32, 'NL2IRLOC012', 'Primary Pick Face
012', 'PICK_FACE', 'ACTIVE', 'A02', 'B12', 'L02', 'P012', 160, 12, 12, true, tru
e, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (41, 17, 33, 'NL2IRLOC013', 'Primary Pick Face
013', 'PICK_FACE', 'ACTIVE', 'A03', 'B13', 'L03', 'P013', 165, 13, 13, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (42, 18, 34, 'NL2IRLOC014', 'Primary Pick Face
014', 'PICK_FACE', 'ACTIVE', 'A04', 'B14', 'L04', 'P014', 170, 14, 14, false, fa
lse, true, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (43, 19, 35, 'NL2IRLOC015', 'Primary Pick Face
015', 'PICK_FACE', 'ACTIVE', 'A05', 'B15', 'L05', 'P015', 175, 15, 15, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (44, 20, 36, 'NL2IRLOC016', 'Primary Pick Face
016', 'PICK_FACE', 'ACTIVE', 'A06', 'B16', 'L01', 'P016', 180, 16, 16, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (45, 21, 37, 'NL2IRLOC017', 'Primary Pick Face
017', 'PICK_FACE', 'ACTIVE', 'A07', 'B17', 'L02', 'P017', 185, 17, 17, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (46, 22, 38, 'NL2IRLOC018', 'Primary Pick Face
018', 'PICK_FACE', 'ACTIVE', 'A08', 'B18', 'L03', 'P018', 190, 18, 18, true, fal
se, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (47, 23, 39, 'NL2IRLOC019', 'Primary Pick Face
019', 'PICK_FACE', 'ACTIVE', 'A09', 'B19', 'L04', 'P019', 195, 19, 19, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (48, 24, 40, 'NL2IRLOC020', 'Primary Pick Face
020', 'PICK_FACE', 'ACTIVE', 'A10', 'B20', 'L05', 'P020', 200, 20, 20, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (49, 25, 41, 'NL2IRLOC021', 'Primary Pick Face
021', 'PICK_FACE', 'ACTIVE', 'A01', 'B01', 'L01', 'P021', 205, 21, 21, false, tr
ue, true, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (50, 26, 42, 'NL2IRLOC022', 'Primary Pick Face
022', 'PICK_FACE', 'ACTIVE', 'A02', 'B02', 'L02', 'P022', 210, 22, 22, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (51, 27, 43, 'NL2IRLOC023', 'Primary Pick Face
023', 'PICK_FACE', 'ACTIVE', 'A03', 'B03', 'L03', 'P023', 215, 23, 23, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (52, 28, 44, 'NL2IRLOC024', 'Primary Pick Face
024', 'PICK_FACE', 'ACTIVE', 'A04', 'B04', 'L04', 'P024', 220, 24, 24, true, fal
se, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (53, 29, 45, 'NL2IRLOC025', 'Primary Pick Face
025', 'PICK_FACE', 'ACTIVE', 'A05', 'B05', 'L05', 'P025', 225, 25, 25, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (54, 30, 46, 'NL2IRLOC026', 'Primary Pick Face
026', 'PICK_FACE', 'ACTIVE', 'A06', 'B06', 'L01', 'P026', 230, 26, 26, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (55, 31, 47, 'NL2IRLOC027', 'Primary Pick Face
027', 'PICK_FACE', 'ACTIVE', 'A07', 'B07', 'L02', 'P027', 235, 27, 27, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (56, 32, 48, 'NL2IRLOC028', 'Primary Pick Face
028', 'PICK_FACE', 'ACTIVE', 'A08', 'B08', 'L03', 'P028', 240, 28, 28, false, fa
lse, true, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (57, 33, 49, 'NL2IRLOC029', 'Primary Pick Face
029', 'PICK_FACE', 'ACTIVE', 'A09', 'B09', 'L04', 'P029', 245, 29, 29, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (58, 34, 50, 'NL2IRLOC030', 'Primary Pick Face
030', 'PICK_FACE', 'ACTIVE', 'A10', 'B10', 'L05', 'P030', 250, 30, 30, true, fal
se, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (59, 35, 51, 'NL2IRLOC031', 'Primary Pick Face
031', 'PICK_FACE', 'ACTIVE', 'A01', 'B11', 'L01', 'P031', 255, 31, 31, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (60, 36, 52, 'NL2IRLOC032', 'Primary Pick Face
032', 'PICK_FACE', 'ACTIVE', 'A02', 'B12', 'L02', 'P032', 260, 32, 32, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (61, 37, 53, 'NL2IRLOC033', 'Primary Pick Face
033', 'PICK_FACE', 'ACTIVE', 'A03', 'B13', 'L03', 'P033', 265, 33, 33, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (62, 38, 54, 'NL2IRLOC034', 'Primary Pick Face
034', 'PICK_FACE', 'ACTIVE', 'A04', 'B14', 'L04', 'P034', 270, 34, 34, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (63, 39, 55, 'NL2IRLOC035', 'Primary Pick Face
035', 'PICK_FACE', 'ACTIVE', 'A05', 'B15', 'L05', 'P035', 275, 35, 35, false, fa
lse, true, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (64, 40, 56, 'NL2IRLOC036', 'Primary Pick Face
036', 'PICK_FACE', 'ACTIVE', 'A06', 'B16', 'L01', 'P036', 280, 36, 36, true, tru
e, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (65, 41, 57, 'NL2IRLOC037', 'Primary Pick Face
037', 'PICK_FACE', 'ACTIVE', 'A07', 'B17', 'L02', 'P037', 285, 37, 37, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (66, 42, 58, 'NL2IRLOC038', 'Primary Pick Face
038', 'PICK_FACE', 'ACTIVE', 'A08', 'B18', 'L03', 'P038', 290, 38, 38, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (67, 43, 59, 'NL2IRLOC039', 'Primary Pick Face
039', 'PICK_FACE', 'ACTIVE', 'A09', 'B19', 'L04', 'P039', 295, 39, 39, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (68, 44, 60, 'NL2IRLOC040', 'Primary Pick Face
040', 'PICK_FACE', 'ACTIVE', 'A10', 'B20', 'L05', 'P040', 300, 40, 40, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (69, 45, 61, 'NL2IRLOC041', 'Primary Pick Face
041', 'PICK_FACE', 'ACTIVE', 'A01', 'B01', 'L01', 'P041', 305, 41, 41, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (70, 46, 62, 'NL2IRLOC042', 'Primary Pick Face
042', 'PICK_FACE', 'ACTIVE', 'A02', 'B02', 'L02', 'P042', 310, 42, 42, true, tru
e, true, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (71, 47, 63, 'NL2IRLOC043', 'Primary Pick Face
043', 'PICK_FACE', 'ACTIVE', 'A03', 'B03', 'L03', 'P043', 315, 43, 43, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (72, 48, 64, 'NL2IRLOC044', 'Primary Pick Face
044', 'PICK_FACE', 'ACTIVE', 'A04', 'B04', 'L04', 'P044', 320, 44, 44, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (73, 49, 65, 'NL2IRLOC045', 'Primary Pick Face
045', 'PICK_FACE', 'ACTIVE', 'A05', 'B05', 'L05', 'P045', 325, 45, 45, false, fa
lse, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (74, 50, 66, 'NL2IRLOC046', 'Primary Pick Face
046', 'PICK_FACE', 'ACTIVE', 'A06', 'B06', 'L01', 'P046', 330, 46, 46, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (75, 51, 67, 'NL2IRLOC047', 'Primary Pick Face
047', 'PICK_FACE', 'ACTIVE', 'A07', 'B07', 'L02', 'P047', 335, 47, 47, false, tr
ue, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (76, 52, 68, 'NL2IRLOC048', 'Primary Pick Face
048', 'PICK_FACE', 'ACTIVE', 'A08', 'B08', 'L03', 'P048', 340, 48, 48, true, fal
se, false, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (77, 53, 69, 'NL2IRLOC049', 'Primary Pick Face
049', 'PICK_FACE', 'ACTIVE', 'A09', 'B09', 'L04', 'P049', 345, 49, 49, false, fa
lse, true, true, true);
insert into scm_storage_locations overriding system value (storage_location_id,
warehouse_id, warehouse_area_id, location_code, location_name, location_type_cod
e, location_status_code, aisle_code, bay_code, level_code, position_code, max_ca
pacity_units, pick_sequence_number, putaway_sequence_number, approved_for_high_v
alue_flag, approved_for_sensitive_goods_flag, approved_for_restricted_goods_flag
, is_pickable, is_active) values (78, 54, 70, 'NL2IRLOC050', 'Primary Pick Face
050', 'PICK_FACE', 'ACTIVE', 'A10', 'B10', 'L05', 'P050', 350, 50, 50, false, fa
lse, false, true, true);
prompt
prompt SCM_USER_ROLE_ASSIGNMENTS
prompt
prompt SCM_INBOUND_RECEIPT_LINES
prompt
prompt SCM_INVENTORY_BALANCES
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (45, 29, 37, 19, 'AVAILABLE', 24, 1, 23, to_timestamp_tz('2026-04-
11 16:19:35.089510 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-11 16:19:35.089510 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 19);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (46, 30, 38, 20, 'AVAILABLE', 28, 2, 26, to_timestamp_tz('2026-04-
10 16:19:35.090033 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-10 16:19:35.090033 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 20);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (47, 31, 39, 21, 'AVAILABLE', 32, 3, 29, to_timestamp_tz('2026-04-
09 16:19:35.090148 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-09 16:19:35.090148 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 21);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (48, 32, 40, 22, 'AVAILABLE', 36, 4, 32, to_timestamp_tz('2026-04-
08 16:19:35.090243 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-08 16:19:35.090243 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 22);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (49, 33, 41, 23, 'AVAILABLE', 40, 0, 40, to_timestamp_tz('2026-04-
07 16:19:35.090324 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-07 16:19:35.090324 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 23);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (50, 34, 42, 24, 'AVAILABLE', 44, 1, 43, to_timestamp_tz('2026-04-
06 16:19:35.090399 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-06 16:19:35.090399 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 24);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (51, 35, 43, 25, 'AVAILABLE', 48, 2, 46, to_timestamp_tz('2026-04-
05 16:19:35.090466 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-12 16:19:35.090466 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 25);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (52, 36, 44, 26, 'AVAILABLE', 52, 3, 49, to_timestamp_tz('2026-04-
04 16:19:35.090571 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-11 16:19:35.090571 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 26);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (53, 37, 45, 27, 'AVAILABLE', 56, 4, 52, to_timestamp_tz('2026-04-
03 16:19:35.090654 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-10 16:19:35.090654 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 27);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (54, 38, 46, 28, 'AVAILABLE', 20, 0, 20, to_timestamp_tz('2026-04-
02 16:19:35.090733 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-09 16:19:35.090733 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 28);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (55, 39, 47, 29, 'AVAILABLE', 24, 1, 23, to_timestamp_tz('2026-04-
01 16:19:35.090817 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-08 16:19:35.090817 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 29);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (56, 40, 48, 30, 'AVAILABLE', 28, 2, 26, to_timestamp_tz('2026-03-
31 16:19:35.090894 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-07 16:19:35.090894 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 30);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (57, 41, 49, 31, 'AVAILABLE', 32, 3, 29, to_timestamp_tz('2026-03-
30 16:19:35.090962 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-06 16:19:35.090962 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 31);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (58, 42, 50, 32, 'AVAILABLE', 36, 4, 32, to_timestamp_tz('2026-03-
29 16:19:35.091038 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-12 16:19:35.091038 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 32);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (59, 43, 51, 33, 'AVAILABLE', 40, 0, 40, to_timestamp_tz('2026-04-
12 16:19:35.091104 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-11 16:19:35.091104 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 33);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (60, 44, 52, 34, 'AVAILABLE', 44, 1, 43, to_timestamp_tz('2026-04-
11 16:19:35.091161 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-10 16:19:35.091161 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 34);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (61, 45, 53, 35, 'AVAILABLE', 48, 2, 46, to_timestamp_tz('2026-04-
10 16:19:35.091207 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-09 16:19:35.091207 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 35);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (62, 46, 54, 36, 'AVAILABLE', 52, 3, 49, to_timestamp_tz('2026-04-
09 16:19:35.091256 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-08 16:19:35.091256 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 36);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (63, 47, 55, 37, 'AVAILABLE', 56, 4, 52, to_timestamp_tz('2026-04-
08 16:19:35.091300 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-07 16:19:35.091300 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 37);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (64, 48, 56, 38, 'AVAILABLE', 20, 0, 20, to_timestamp_tz('2026-04-
07 16:19:35.091346 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-06 16:19:35.091346 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 38);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (65, 49, 57, 39, 'AVAILABLE', 24, 1, 23, to_timestamp_tz('2026-04-
06 16:19:35.091406 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-12 16:19:35.091406 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 39);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (66, 50, 58, 40, 'AVAILABLE', 28, 2, 26, to_timestamp_tz('2026-04-
05 16:19:35.091454 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-11 16:19:35.091454 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 40);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (67, 51, 59, 41, 'AVAILABLE', 32, 3, 29, to_timestamp_tz('2026-04-
04 16:19:35.091498 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-10 16:19:35.091498 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 41);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (68, 52, 60, 42, 'AVAILABLE', 36, 4, 32, to_timestamp_tz('2026-04-
03 16:19:35.091563 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-09 16:19:35.091563 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 42);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (69, 53, 61, 43, 'AVAILABLE', 40, 0, 40, to_timestamp_tz('2026-04-
02 16:19:35.091613 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-08 16:19:35.091613 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 43);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (70, 54, 62, 44, 'AVAILABLE', 44, 1, 43, to_timestamp_tz('2026-04-
01 16:19:35.091662 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-07 16:19:35.091662 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 44);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (71, 55, 63, 45, 'AVAILABLE', 48, 2, 46, to_timestamp_tz('2026-03-
31 16:19:35.091762 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-06 16:19:35.091762 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 45);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (72, 56, 64, 46, 'AVAILABLE', 52, 3, 49, to_timestamp_tz('2026-03-
30 16:19:35.091986 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-12 16:19:35.091986 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 46);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (73, 57, 65, 47, 'AVAILABLE', 56, 4, 52, to_timestamp_tz('2026-03-
29 16:19:35.092087 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-11 16:19:35.092087 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 47);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (74, 58, 66, 48, 'AVAILABLE', 20, 0, 20, to_timestamp_tz('2026-04-
12 16:19:35.092145 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-10 16:19:35.092145 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 48);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (75, 59, 67, 49, 'AVAILABLE', 24, 1, 23, to_timestamp_tz('2026-04-
11 16:19:35.092197 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-09 16:19:35.092197 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 49);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (76, 60, 68, 50, 'AVAILABLE', 28, 2, 26, to_timestamp_tz('2026-04-
10 16:19:35.092247 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-08 16:19:35.092247 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 50);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (77, 61, 69, 51, 'AVAILABLE', 32, 3, 29, to_timestamp_tz('2026-04-
09 16:19:35.092297 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-07 16:19:35.092297 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 51);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (78, 62, 70, 52, 'AVAILABLE', 36, 4, 32, to_timestamp_tz('2026-04-
08 16:19:35.092345 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-06 16:19:35.092345 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 52);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (79, 63, 71, 53, 'AVAILABLE', 40, 0, 40, to_timestamp_tz('2026-04-
07 16:19:35.092395 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-12 16:19:35.092395 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 53);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (80, 64, 72, 54, 'AVAILABLE', 44, 1, 43, to_timestamp_tz('2026-04-
06 16:19:35.092442 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-11 16:19:35.092442 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 54);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (81, 65, 73, 55, 'AVAILABLE', 48, 2, 46, to_timestamp_tz('2026-04-
05 16:19:35.092491 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-10 16:19:35.092491 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 55);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (82, 66, 74, 56, 'AVAILABLE', 52, 3, 49, to_timestamp_tz('2026-04-
04 16:19:35.092555 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-09 16:19:35.092555 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 56);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (83, 67, 75, 57, 'AVAILABLE', 56, 4, 52, to_timestamp_tz('2026-04-
03 16:19:35.092601 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-08 16:19:35.092601 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 57);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (84, 68, 76, 58, 'AVAILABLE', 20, 0, 20, to_timestamp_tz('2026-04-
02 16:19:35.092651 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-07 16:19:35.092651 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 58);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (85, 69, 77, 59, 'AVAILABLE', 24, 1, 23, to_timestamp_tz('2026-04-
01 16:19:35.092699 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-06 16:19:35.092699 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 59);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (86, 70, 78, 60, 'AVAILABLE', 28, 2, 26, to_timestamp_tz('2026-03-
31 16:19:35.092744 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-12 16:19:35.092744 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 60);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (87, 71, 79, 61, 'AVAILABLE', 32, 3, 29, to_timestamp_tz('2026-03-
30 16:19:35.092789 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-11 16:19:35.092789 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 61);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (88, 72, 80, 62, 'AVAILABLE', 36, 4, 32, to_timestamp_tz('2026-03-
29 16:19:35.092836 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-10 16:19:35.092836 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 62);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (89, 73, 81, 63, 'AVAILABLE', 40, 0, 40, to_timestamp_tz('2026-04-
12 16:19:35.092896 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-09 16:19:35.092896 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 63);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (90, 74, 82, 64, 'AVAILABLE', 44, 1, 43, to_timestamp_tz('2026-04-
11 16:19:35.092942 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-08 16:19:35.092942 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 64);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (91, 75, 83, 65, 'AVAILABLE', 48, 2, 46, to_timestamp_tz('2026-04-
10 16:19:35.092986 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-07 16:19:35.092986 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 65);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (92, 76, 84, 66, 'AVAILABLE', 52, 3, 49, to_timestamp_tz('2026-04-
09 16:19:35.093033 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-06 16:19:35.093033 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 66);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (93, 77, 85, 67, 'AVAILABLE', 56, 4, 52, to_timestamp_tz('2026-04-
08 16:19:35.093078 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-12 16:19:35.093078 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 67);
insert into scm_inventory_balances overriding system value (inventory_balance_id
, storage_location_id, item_id, inventory_lot_id, stock_status_code, quantity_on
_hand, quantity_reserved, quantity_available, last_counted_at, last_moved_at, lo
t_key) values (94, 78, 86, 68, 'AVAILABLE', 20, 0, 20, to_timestamp_tz('2026-04-
07 16:19:35.093122 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz
('2026-04-11 16:19:35.093122 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 68);
prompt
prompt SCM_INVENTORY_TRANSACTIONS
prompt
prompt SCM_OPERATIONAL_EXCEPTIONS
prompt
prompt SCM_OPERATIONAL_TASKS
prompt
prompt SCM_OUTBOUND_ORDER_LINES
prompt
prompt SCM_QUARANTINE_CASES
prompt
prompt SCM_REPLENISHMENT_ALERTS
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (7, '
NL2IRALT001', 5, 37, 73, 29, null, 'LOW_STOCK', 'OPEN', 'CRITICAL', 2, 13, 29, 2
1, to_timestamp_tz('2026-03-25 16:19:35.382696 +00:00','YYYY-MM-DD HH24:MI:SS.FF
6 TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM001
 in warehouse NL2IRWH001.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (8, '
NL2IRALT002', 6, 38, 74, 30, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'LOW', 4, 14, 30
, 22, to_timestamp_tz('2026-03-26 16:19:35.383257 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), to_timestamp_tz('2026-04-11 16:19:35.383257 +00:00','YYYY-MM-DD
HH24:MI:SS.FF6 TZH:TZM'), 11, 'Seeded NL2IR replenishment alert for item NL2IRIT
EM002 in warehouse NL2IRWH002.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (9, '
NL2IRALT003', 7, 39, 75, 31, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'MEDIU
M', 6, 15, 31, 23, to_timestamp_tz('2026-03-27 16:19:35.383366 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-10 16:19:35.383366 +00:00'
,'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 12, 'Seeded NL2IR replenishment alert for
 item NL2IRITEM003 in warehouse NL2IRWH003.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (10,
'NL2IRALT004', 8, 40, 76, 32, null, 'AGING_REVIEW', 'CLOSED', 'HIGH', 8, 16, 32,
 24, to_timestamp_tz('2026-03-28 16:19:35.383427 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), to_timestamp_tz('2026-04-09 16:19:35.383427 +00:00','YYYY-MM-DD H
H24:MI:SS.FF6 TZH:TZM'), 13, 'Seeded NL2IR replenishment alert for item NL2IRITE
M004 in warehouse NL2IRWH004.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (11,
'NL2IRALT005', 9, 41, 77, 33, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'LOW', 0
, 17, 33, 25, to_timestamp_tz('2026-03-29 16:19:35.383481 +00:00','YYYY-MM-DD HH
24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-08 16:19:35.383481 +00:00','YYY
Y-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 14, 'Seeded NL2IR replenishment alert for item
 NL2IRITEM005 in warehouse NL2IRWH005.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (12,
'NL2IRALT006', 10, 42, 78, 34, null, 'LOW_STOCK', 'OPEN', 'MEDIUM', 2, 18, 34, 2
6, to_timestamp_tz('2026-03-30 16:19:35.383554 +00:00','YYYY-MM-DD HH24:MI:SS.FF
6 TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM006
 in warehouse NL2IRWH006.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (13,
'NL2IRALT007', 11, 43, 79, 35, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'LOW', 4, 19,
35, 27, to_timestamp_tz('2026-03-31 16:19:35.383601 +00:00','YYYY-MM-DD HH24:MI:
SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-12 16:19:35.383601 +00:00','YYYY-MM-D
D HH24:MI:SS.FF6 TZH:TZM'), 16, 'Seeded NL2IR replenishment alert for item NL2IR
ITEM007 in warehouse NL2IRWH007.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (14,
'NL2IRALT008', 12, 44, 80, 36, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'HIG
H', 6, 12, 36, 28, to_timestamp_tz('2026-04-01 16:19:35.383653 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-11 16:19:35.383653 +00:00'
,'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 17, 'Seeded NL2IR replenishment alert for
 item NL2IRITEM008 in warehouse NL2IRWH008.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (15,
'NL2IRALT009', 13, 45, 81, 37, null, 'AGING_REVIEW', 'CLOSED', 'MEDIUM', 8, 13,
37, 29, to_timestamp_tz('2026-04-02 16:19:35.383701 +00:00','YYYY-MM-DD HH24:MI:
SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-10 16:19:35.383701 +00:00','YYYY-MM-D
D HH24:MI:SS.FF6 TZH:TZM'), 18, 'Seeded NL2IR replenishment alert for item NL2IR
ITEM009 in warehouse NL2IRWH009.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (16,
'NL2IRALT010', 14, 46, 82, 38, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'CRITIC
AL', 0, 14, 38, 30, to_timestamp_tz('2026-03-24 16:19:35.383748 +00:00','YYYY-MM
-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-09 16:19:35.383748 +00:00
','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 19, 'Seeded NL2IR replenishment alert fo
r item NL2IRITEM010 in warehouse NL2IRWH010.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (17,
'NL2IRALT011', 15, 47, 83, 39, null, 'LOW_STOCK', 'OPEN', 'CRITICAL', 2, 15, 39,
 31, to_timestamp_tz('2026-03-25 16:19:35.383800 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM0
11 in warehouse NL2IRWH011.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (18,
'NL2IRALT012', 16, 48, 84, 40, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'HIGH', 4, 16,
 28, 20, to_timestamp_tz('2026-03-26 16:19:35.383850 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-13 16:19:35.383850 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), 21, 'Seeded NL2IR replenishment alert for item NL2I
RITEM012 in warehouse NL2IRWH012.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (19,
'NL2IRALT013', 17, 49, 85, 41, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'LOW
', 6, 17, 29, 21, to_timestamp_tz('2026-03-27 16:19:35.383895 +00:00','YYYY-MM-D
D HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-12 16:19:35.383895 +00:00',
'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 22, 'Seeded NL2IR replenishment alert for
item NL2IRITEM013 in warehouse NL2IRWH013.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (20,
'NL2IRALT014', 18, 50, 86, 42, null, 'AGING_REVIEW', 'CLOSED', 'LOW', 8, 18, 30,
 22, to_timestamp_tz('2026-03-28 16:19:35.383943 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), to_timestamp_tz('2026-04-11 16:19:35.383943 +00:00','YYYY-MM-DD H
H24:MI:SS.FF6 TZH:TZM'), 23, 'Seeded NL2IR replenishment alert for item NL2IRITE
M014 in warehouse NL2IRWH014.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (21,
'NL2IRALT015', 19, 51, 87, 43, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'MEDIUM
', 0, 19, 31, 23, to_timestamp_tz('2026-03-29 16:19:35.383990 +00:00','YYYY-MM-D
D HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-10 16:19:35.383990 +00:00',
'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 24, 'Seeded NL2IR replenishment alert for
item NL2IRITEM015 in warehouse NL2IRWH015.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (22,
'NL2IRALT016', 20, 52, 88, 44, null, 'LOW_STOCK', 'OPEN', 'HIGH', 2, 12, 32, 24,
 to_timestamp_tz('2026-03-30 16:19:35.384034 +00:00','YYYY-MM-DD HH24:MI:SS.FF6
TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM016 i
n warehouse NL2IRWH016.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (23,
'NL2IRALT017', 21, 53, 89, 45, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'LOW', 4, 13,
33, 25, to_timestamp_tz('2026-03-31 16:19:35.384080 +00:00','YYYY-MM-DD HH24:MI:
SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-08 16:19:35.384080 +00:00','YYYY-MM-D
D HH24:MI:SS.FF6 TZH:TZM'), 26, 'Seeded NL2IR replenishment alert for item NL2IR
ITEM017 in warehouse NL2IRWH017.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (24,
'NL2IRALT018', 22, 54, 90, 46, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'MED
IUM', 6, 14, 34, 26, to_timestamp_tz('2026-04-01 16:19:35.384127 +00:00','YYYY-M
M-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-13 16:19:35.384127 +00:0
0','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 27, 'Seeded NL2IR replenishment alert f
or item NL2IRITEM018 in warehouse NL2IRWH018.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (25,
'NL2IRALT019', 23, 55, 91, 47, null, 'AGING_REVIEW', 'CLOSED', 'LOW', 8, 15, 35,
 27, to_timestamp_tz('2026-04-02 16:19:35.384204 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), to_timestamp_tz('2026-04-12 16:19:35.384204 +00:00','YYYY-MM-DD H
H24:MI:SS.FF6 TZH:TZM'), 28, 'Seeded NL2IR replenishment alert for item NL2IRITE
M019 in warehouse NL2IRWH019.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (26,
'NL2IRALT020', 24, 56, 92, 48, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'CRITIC
AL', 0, 16, 36, 28, to_timestamp_tz('2026-03-24 16:19:35.384251 +00:00','YYYY-MM
-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-11 16:19:35.384251 +00:00
','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 29, 'Seeded NL2IR replenishment alert fo
r item NL2IRITEM020 in warehouse NL2IRWH020.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (27,
'NL2IRALT021', 25, 57, 93, 49, null, 'LOW_STOCK', 'OPEN', 'CRITICAL', 2, 17, 37,
 29, to_timestamp_tz('2026-03-25 16:19:35.384298 +00:00','YYYY-MM-DD HH24:MI:SS.
FF6 TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM0
21 in warehouse NL2IRWH021.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (28,
'NL2IRALT022', 26, 58, 94, 50, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'LOW', 4, 18,
38, 30, to_timestamp_tz('2026-03-26 16:19:35.384340 +00:00','YYYY-MM-DD HH24:MI:
SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-09 16:19:35.384340 +00:00','YYYY-MM-D
D HH24:MI:SS.FF6 TZH:TZM'), 31, 'Seeded NL2IR replenishment alert for item NL2IR
ITEM022 in warehouse NL2IRWH022.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (29,
'NL2IRALT023', 27, 59, 95, 51, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'LOW
', 6, 19, 39, 31, to_timestamp_tz('2026-03-27 16:19:35.384387 +00:00','YYYY-MM-D
D HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-08 16:19:35.384387 +00:00',
'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 32, 'Seeded NL2IR replenishment alert for
item NL2IRITEM023 in warehouse NL2IRWH023.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (30,
'NL2IRALT024', 28, 60, 96, 52, null, 'AGING_REVIEW', 'CLOSED', 'HIGH', 8, 12, 28
, 20, to_timestamp_tz('2026-03-28 16:19:35.384434 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), to_timestamp_tz('2026-04-13 16:19:35.384434 +00:00','YYYY-MM-DD
HH24:MI:SS.FF6 TZH:TZM'), 33, 'Seeded NL2IR replenishment alert for item NL2IRIT
EM024 in warehouse NL2IRWH024.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (31,
'NL2IRALT025', 29, 61, 97, 53, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'LOW',
0, 13, 29, 21, to_timestamp_tz('2026-03-29 16:19:35.384478 +00:00','YYYY-MM-DD H
H24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-12 16:19:35.384478 +00:00','YY
YY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 34, 'Seeded NL2IR replenishment alert for ite
m NL2IRITEM025 in warehouse NL2IRWH025.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (32,
'NL2IRALT026', 30, 62, 98, 54, null, 'LOW_STOCK', 'OPEN', 'LOW', 2, 14, 30, 22,
to_timestamp_tz('2026-03-30 16:19:35.384537 +00:00','YYYY-MM-DD HH24:MI:SS.FF6 T
ZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM026 in
 warehouse NL2IRWH026.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (33,
'NL2IRALT027', 31, 63, 99, 55, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'MEDIUM', 4, 1
5, 31, 23, to_timestamp_tz('2026-03-31 16:19:35.384582 +00:00','YYYY-MM-DD HH24:
MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-10 16:19:35.384582 +00:00','YYYY-M
M-DD HH24:MI:SS.FF6 TZH:TZM'), 36, 'Seeded NL2IR replenishment alert for item NL
2IRITEM027 in warehouse NL2IRWH027.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (34,
'NL2IRALT028', 32, 64, 100, 56, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'HI
GH', 6, 16, 32, 24, to_timestamp_tz('2026-04-01 16:19:35.384627 +00:00','YYYY-MM
-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-09 16:19:35.384627 +00:00
','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 37, 'Seeded NL2IR replenishment alert fo
r item NL2IRITEM028 in warehouse NL2IRWH028.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (35,
'NL2IRALT029', 33, 65, 101, 57, null, 'AGING_REVIEW', 'CLOSED', 'LOW', 8, 17, 33
, 25, to_timestamp_tz('2026-04-02 16:19:35.384672 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), to_timestamp_tz('2026-04-08 16:19:35.384672 +00:00','YYYY-MM-DD
HH24:MI:SS.FF6 TZH:TZM'), 38, 'Seeded NL2IR replenishment alert for item NL2IRIT
EM029 in warehouse NL2IRWH029.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (36,
'NL2IRALT030', 34, 66, 102, 58, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'CRITI
CAL', 0, 18, 34, 26, to_timestamp_tz('2026-03-24 16:19:35.384717 +00:00','YYYY-M
M-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-13 16:19:35.384717 +00:0
0','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 39, 'Seeded NL2IR replenishment alert f
or item NL2IRITEM030 in warehouse NL2IRWH030.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (37,
'NL2IRALT031', 35, 67, 103, 59, null, 'LOW_STOCK', 'OPEN', 'CRITICAL', 2, 19, 35
, 27, to_timestamp_tz('2026-03-25 16:19:35.384762 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM
031 in warehouse NL2IRWH031.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (38,
'NL2IRALT032', 36, 68, 104, 60, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'HIGH', 4, 12
, 36, 28, to_timestamp_tz('2026-03-26 16:19:35.384805 +00:00','YYYY-MM-DD HH24:M
I:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-11 16:19:35.384805 +00:00','YYYY-MM
-DD HH24:MI:SS.FF6 TZH:TZM'), 41, 'Seeded NL2IR replenishment alert for item NL2
IRITEM032 in warehouse NL2IRWH032.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (39,
'NL2IRALT033', 37, 69, 105, 61, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'ME
DIUM', 6, 13, 37, 29, to_timestamp_tz('2026-03-27 16:19:35.384849 +00:00','YYYY-
MM-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-10 16:19:35.384849 +00:
00','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 42, 'Seeded NL2IR replenishment alert
for item NL2IRITEM033 in warehouse NL2IRWH033.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (40,
'NL2IRALT034', 38, 70, 106, 62, null, 'AGING_REVIEW', 'CLOSED', 'LOW', 8, 14, 38
, 30, to_timestamp_tz('2026-03-28 16:19:35.384893 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), to_timestamp_tz('2026-04-09 16:19:35.384893 +00:00','YYYY-MM-DD
HH24:MI:SS.FF6 TZH:TZM'), 43, 'Seeded NL2IR replenishment alert for item NL2IRIT
EM034 in warehouse NL2IRWH034.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (41,
'NL2IRALT035', 39, 71, 107, 63, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'LOW',
 0, 15, 39, 31, to_timestamp_tz('2026-03-29 16:19:35.384939 +00:00','YYYY-MM-DD
HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-08 16:19:35.384939 +00:00','Y
YYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 44, 'Seeded NL2IR replenishment alert for it
em NL2IRITEM035 in warehouse NL2IRWH035.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (42,
'NL2IRALT036', 40, 72, 108, 64, null, 'LOW_STOCK', 'OPEN', 'HIGH', 2, 16, 28, 20
, to_timestamp_tz('2026-03-30 16:19:35.384984 +00:00','YYYY-MM-DD HH24:MI:SS.FF6
 TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM036
in warehouse NL2IRWH036.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (43,
'NL2IRALT037', 41, 73, 109, 65, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'LOW', 4, 17,
 29, 21, to_timestamp_tz('2026-03-31 16:19:35.385027 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-12 16:19:35.385027 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), 46, 'Seeded NL2IR replenishment alert for item NL2I
RITEM037 in warehouse NL2IRWH037.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (44,
'NL2IRALT038', 42, 74, 110, 66, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'LO
W', 6, 18, 30, 22, to_timestamp_tz('2026-04-01 16:19:35.385072 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-11 16:19:35.385072 +00:00'
,'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 47, 'Seeded NL2IR replenishment alert for
 item NL2IRITEM038 in warehouse NL2IRWH038.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (45,
'NL2IRALT039', 43, 75, 111, 67, null, 'AGING_REVIEW', 'CLOSED', 'MEDIUM', 8, 19,
 31, 23, to_timestamp_tz('2026-04-02 16:19:35.385118 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-10 16:19:35.385118 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), 48, 'Seeded NL2IR replenishment alert for item NL2I
RITEM039 in warehouse NL2IRWH039.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (46,
'NL2IRALT040', 44, 76, 112, 68, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'CRITI
CAL', 0, 12, 32, 24, to_timestamp_tz('2026-03-24 16:19:35.385161 +00:00','YYYY-M
M-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-09 16:19:35.385161 +00:0
0','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 49, 'Seeded NL2IR replenishment alert f
or item NL2IRITEM040 in warehouse NL2IRWH040.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (47,
'NL2IRALT041', 45, 77, 113, 69, null, 'LOW_STOCK', 'OPEN', 'CRITICAL', 2, 13, 33
, 25, to_timestamp_tz('2026-03-25 16:19:35.385226 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM
041 in warehouse NL2IRWH041.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (48,
'NL2IRALT042', 46, 78, 114, 70, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'MEDIUM', 4,
14, 34, 26, to_timestamp_tz('2026-03-26 16:19:35.385270 +00:00','YYYY-MM-DD HH24
:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-13 16:19:35.385270 +00:00','YYYY-
MM-DD HH24:MI:SS.FF6 TZH:TZM'), 51, 'Seeded NL2IR replenishment alert for item N
L2IRITEM042 in warehouse NL2IRWH042.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (49,
'NL2IRALT043', 47, 79, 115, 71, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'LO
W', 6, 15, 35, 27, to_timestamp_tz('2026-03-27 16:19:35.385313 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-12 16:19:35.385313 +00:00'
,'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 52, 'Seeded NL2IR replenishment alert for
 item NL2IRITEM043 in warehouse NL2IRWH043.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (50,
'NL2IRALT044', 48, 80, 116, 72, null, 'AGING_REVIEW', 'CLOSED', 'HIGH', 8, 16, 3
6, 28, to_timestamp_tz('2026-03-28 16:19:35.385399 +00:00','YYYY-MM-DD HH24:MI:S
S.FF6 TZH:TZM'), to_timestamp_tz('2026-04-11 16:19:35.385399 +00:00','YYYY-MM-DD
 HH24:MI:SS.FF6 TZH:TZM'), 53, 'Seeded NL2IR replenishment alert for item NL2IRI
TEM044 in warehouse NL2IRWH044.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (51,
'NL2IRALT045', 49, 81, 117, 73, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'MEDIU
M', 0, 17, 37, 29, to_timestamp_tz('2026-03-29 16:19:35.385445 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-10 16:19:35.385445 +00:00'
,'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 54, 'Seeded NL2IR replenishment alert for
 item NL2IRITEM045 in warehouse NL2IRWH045.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (52,
'NL2IRALT046', 50, 82, 118, 74, null, 'LOW_STOCK', 'OPEN', 'LOW', 2, 18, 38, 30,
 to_timestamp_tz('2026-03-30 16:19:35.385487 +00:00','YYYY-MM-DD HH24:MI:SS.FF6
TZH:TZM'), null, null, 'Seeded NL2IR replenishment alert for item NL2IRITEM046 i
n warehouse NL2IRWH046.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (53,
'NL2IRALT047', 51, 83, 119, 75, null, 'OUT_OF_STOCK', 'IN_REVIEW', 'LOW', 4, 19,
 39, 31, to_timestamp_tz('2026-03-31 16:19:35.385548 +00:00','YYYY-MM-DD HH24:MI
:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-08 16:19:35.385548 +00:00','YYYY-MM-
DD HH24:MI:SS.FF6 TZH:TZM'), 56, 'Seeded NL2IR replenishment alert for item NL2I
RITEM047 in warehouse NL2IRWH047.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (54,
'NL2IRALT048', 52, 84, 120, 76, null, 'PICK_FACE_REPLENISHMENT', 'ACTIONED', 'HI
GH', 6, 12, 28, 20, to_timestamp_tz('2026-04-01 16:19:35.385593 +00:00','YYYY-MM
-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-13 16:19:35.385593 +00:00
','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 57, 'Seeded NL2IR replenishment alert fo
r item NL2IRITEM048 in warehouse NL2IRWH048.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (55,
'NL2IRALT049', 53, 85, 121, 77, null, 'AGING_REVIEW', 'CLOSED', 'LOW', 8, 13, 29
, 21, to_timestamp_tz('2026-04-02 16:19:35.385635 +00:00','YYYY-MM-DD HH24:MI:SS
.FF6 TZH:TZM'), to_timestamp_tz('2026-04-12 16:19:35.385635 +00:00','YYYY-MM-DD
HH24:MI:SS.FF6 TZH:TZM'), 58, 'Seeded NL2IR replenishment alert for item NL2IRIT
EM049 in warehouse NL2IRWH049.');
insert into scm_replenishment_alerts overriding system value (replenishment_aler
t_id, alert_number, warehouse_id, item_id, item_warehouse_policy_id, pick_locati
on_id, reserve_location_id, alert_type_code, alert_status_code, priority_code, a
vailable_quantity, trigger_quantity, target_quantity, recommended_replenishment_
quantity, raised_at, reviewed_at, reviewed_by_user_id, alert_notes) values (56,
'NL2IRALT050', 54, 86, 122, 78, null, 'SHORT_DATED_REVIEW', 'SUPPRESSED', 'CRITI
CAL', 0, 14, 30, 22, to_timestamp_tz('2026-03-24 16:19:35.385683 +00:00','YYYY-M
M-DD HH24:MI:SS.FF6 TZH:TZM'), to_timestamp_tz('2026-04-11 16:19:35.385683 +00:0
0','YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM'), 59, 'Seeded NL2IR replenishment alert f
or item NL2IRITEM050 in warehouse NL2IRWH050.');
prompt
prompt SCM_RETURNS
prompt
prompt SCM_STOCK_ADJUSTMENT_LINES
prompt
prompt SCM_STOCK_COUNT_LINES
prompt
prompt SCM_STOCK_TRANSFER_LINES
prompt
prompt SCM_APPROVAL_REQUESTS
prompt
prompt SCM_ITEM_SERIALS
prompt
prompt SCM_RETURN_LINES
prompt
prompt SCM_ALERTS
prompt
prompt SCM_APPROVAL_ACTIONS
prompt
prompt SCM_SERIAL_EVENTS
prompt
prompt SCM_ALERT_NOTIFICATIONS
prompt
prompt Post-load self-referential updates
prompt --------------------------------
prompt
prompt SCM_APPLICATION_USERS self references
prompt
prompt SCM_STORAGE_LOCATIONS self references
prompt
commit;

