select r.req_id,
       j.title,
       d.name as department,
       r.headcount,
       r.status,
       to_char(r.open_date, 'DD-Mon-YYYY') as open_since
  from tms_job_requisitions r
  join tms_jobs j
    on r.job_id = j.job_id
  join tms_departments d
    on r.dept_id = d.dept_id
 where r.req_id = :P14_REQ_ID;
