select candidate_id,
       first_name || ' ' || last_name as name,
       current_stage,
       applied_date
  from tms_candidates
 where req_id = :P14_REQ_ID;
