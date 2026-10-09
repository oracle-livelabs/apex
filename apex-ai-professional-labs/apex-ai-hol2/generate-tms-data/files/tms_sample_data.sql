set define off

prompt Loading TMS sample data...

-- Meaningful sample data for the TMS schema.
-- Plain INSERT statements only: no PL/SQL blocks.
-- Run this after tms_schema.sql on empty TMS tables.
-- Embedding vectors are intentionally left null; populate them later with APEX_AI.

INSERT INTO tms_departments (name, location, color)
VALUES ('Engineering', 'Bengaluru - Tower A', '#2563EB');

INSERT INTO tms_departments (name, location, color)
VALUES ('Human Resources', 'Bengaluru - Tower B', '#10B981');

INSERT INTO tms_departments (name, location, color)
VALUES ('Sales', 'Mumbai - West Wing', '#F59E0B');

INSERT INTO tms_departments (name, location, color)
VALUES ('Finance', 'Bengaluru - Tower B', '#8B5CF6');

INSERT INTO tms_departments (name, location, color)
VALUES ('IT Operations', 'Hyderabad - Cloud Hub', '#06B6D4');

INSERT INTO tms_departments (name, location, color)
VALUES ('Product', 'Pune - Innovation Lab', '#EF4444');

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('Engineering Manager', 115000, 145000, (SELECT dept_id FROM tms_departments WHERE name = 'Engineering'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('Senior Developer', 85000, 105000, (SELECT dept_id FROM tms_departments WHERE name = 'Engineering'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('DevOps Engineer', 78000, 98000, (SELECT dept_id FROM tms_departments WHERE name = 'IT Operations'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('HR Business Partner', 78000, 98000, (SELECT dept_id FROM tms_departments WHERE name = 'Human Resources'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('HR Generalist', 52000, 68000, (SELECT dept_id FROM tms_departments WHERE name = 'Human Resources'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('Sales Account Executive', 60000, 90000, (SELECT dept_id FROM tms_departments WHERE name = 'Sales'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('Product Manager', 90000, 125000, (SELECT dept_id FROM tms_departments WHERE name = 'Product'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('Payroll Specialist', 50000, 65000, (SELECT dept_id FROM tms_departments WHERE name = 'Finance'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('Data Analyst', 65000, 85000, (SELECT dept_id FROM tms_departments WHERE name = 'Finance'));

INSERT INTO tms_jobs (title, min_salary, max_salary, dept_id)
VALUES ('UX Designer', 70000, 95000, (SELECT dept_id FROM tms_departments WHERE name = 'Product'));

INSERT INTO tms_job_requisitions (
  job_id, dept_id, requested_by, approved_by, headcount, status, open_date
) VALUES (
  (SELECT job_id FROM tms_jobs WHERE title = 'Senior Developer'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Engineering'),
  'maya.patel@acme.example',
  'priya.nair@acme.example',
  2,
  'Open',
  DATE '2026-06-01'
);

INSERT INTO tms_job_requisitions (
  job_id, dept_id, requested_by, approved_by, headcount, status, open_date
) VALUES (
  (SELECT job_id FROM tms_jobs WHERE title = 'DevOps Engineer'),
  (SELECT dept_id FROM tms_departments WHERE name = 'IT Operations'),
  'liam.chen@acme.example',
  'priya.nair@acme.example',
  1,
  'Open',
  DATE '2026-06-03'
);

INSERT INTO tms_job_requisitions (
  job_id, dept_id, requested_by, approved_by, headcount, status, open_date
) VALUES (
  (SELECT job_id FROM tms_jobs WHERE title = 'HR Generalist'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Human Resources'),
  'priya.nair@acme.example',
  NULL,
  1,
  'Pending Approval',
  DATE '2026-06-10'
);

INSERT INTO tms_job_requisitions (
  job_id, dept_id, requested_by, approved_by, headcount, status, open_date
) VALUES (
  (SELECT job_id FROM tms_jobs WHERE title = 'Sales Account Executive'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Sales'),
  'sofia.garcia@acme.example',
  'priya.nair@acme.example',
  3,
  'Open',
  DATE '2026-05-25'
);

INSERT INTO tms_job_requisitions (
  job_id, dept_id, requested_by, approved_by, headcount, status, open_date, close_date
) VALUES (
  (SELECT job_id FROM tms_jobs WHERE title = 'Product Manager'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Product'),
  'ethan.brooks@acme.example',
  'priya.nair@acme.example',
  1,
  'Filled',
  DATE '2026-04-15',
  DATE '2026-06-15'
);

INSERT INTO tms_job_requisitions (
  job_id, dept_id, requested_by, approved_by, headcount, status, open_date
) VALUES (
  (SELECT job_id FROM tms_jobs WHERE title = 'Data Analyst'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Finance'),
  'noah.reed@acme.example',
  NULL,
  1,
  'Draft',
  DATE '2026-06-18'
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Senior Developer' AND r.requested_by = 'maya.patel@acme.example' AND r.open_date = DATE '2026-06-01'),
  'Anika', 'Rao', 'anika.rao@example.com', '+91-98765-11001', 'LinkedIn',
  'Offer', DATE '2026-06-04', 'Y', 8.70
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Senior Developer' AND r.requested_by = 'maya.patel@acme.example' AND r.open_date = DATE '2026-06-01'),
  'Marcus', 'Hill', 'marcus.hill@example.com', '+1-415-555-0134',
  'Employee Referral', 'Interview', DATE '2026-06-05', 'N', 7.90
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Senior Developer' AND r.requested_by = 'maya.patel@acme.example' AND r.open_date = DATE '2026-06-01'),
  'Nina', 'Park', 'nina.park@example.com', '+82-10-5555-0135',
  'Careers Site', 'Screening', DATE '2026-06-07', 'Y', 6.40
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Senior Developer' AND r.requested_by = 'maya.patel@acme.example' AND r.open_date = DATE '2026-06-01'),
  'Jacob', 'Lee', 'jacob.lee@example.com', '+1-206-555-0136',
  'Campus Event', 'Rejected', DATE '2026-06-08', 'N', 4.20
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'DevOps Engineer' AND r.requested_by = 'liam.chen@acme.example' AND r.open_date = DATE '2026-06-03'),
  'Tom', 'Alvarez', 'tom.alvarez@example.com', '+1-512-555-0141',
  'Recruiter Sourced', 'Interview', DATE '2026-06-06', 'N', 8.10
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'DevOps Engineer' AND r.requested_by = 'liam.chen@acme.example' AND r.open_date = DATE '2026-06-03'),
  'Mei', 'Wong', 'mei.wong@example.com', '+65-8123-0142',
  'Careers Site', 'Applied', DATE '2026-06-09', 'Y', 6.90
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'HR Generalist' AND r.requested_by = 'priya.nair@acme.example' AND r.open_date = DATE '2026-06-10'),
  'Grace', 'Kim', 'grace.kim@example.com', '+1-646-555-0143',
  'LinkedIn', 'Applied', DATE '2026-06-12', 'Y', 7.20
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Sales Account Executive' AND r.requested_by = 'sofia.garcia@acme.example' AND r.open_date = DATE '2026-05-25'),
  'Olivia', 'Grant', 'olivia.grant@example.com', '+44-7700-900141',
  'Agency', 'Offer', DATE '2026-05-29', 'N', 8.30
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Sales Account Executive' AND r.requested_by = 'sofia.garcia@acme.example' AND r.open_date = DATE '2026-05-25'),
  'Daniel', 'Brown', 'daniel.brown@example.com', '+1-312-555-0145',
  'Careers Site', 'Screening', DATE '2026-06-01', 'N', 6.80
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Sales Account Executive' AND r.requested_by = 'sofia.garcia@acme.example' AND r.open_date = DATE '2026-05-25'),
  'Aisha', 'Khan', 'aisha.khan@example.com', '+971-50-555-0146',
  'Referral', 'Applied', DATE '2026-06-04', 'Y', 7.10
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Product Manager' AND r.requested_by = 'ethan.brooks@acme.example' AND r.open_date = DATE '2026-04-15'),
  'Ravi', 'Menon', 'ravi.menon@example.com', '+91-98765-11451',
  'Executive Referral', 'Hired', DATE '2026-04-22', 'N', 9.10
);

INSERT INTO tms_candidates (
  req_id, first_name, last_name, email, phone, source, current_stage,
  applied_date, diversity_flag, ai_score
) VALUES (
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Product Manager' AND r.requested_by = 'ethan.brooks@acme.example' AND r.open_date = DATE '2026-04-15'),
  'Elena', 'Petrova', 'elena.petrova@example.com', '+49-30-555-0148',
  'LinkedIn', 'Rejected', DATE '2026-04-25', 'Y', 5.10
);

INSERT INTO tms_employees (
  first_name, last_name, email, job_id, dept_id, manager_id, salary, hire_date, status
) VALUES (
  'Maya', 'Patel', 'maya.patel@acme.example',
  (SELECT job_id FROM tms_jobs WHERE title = 'Engineering Manager'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Engineering'),
  NULL, 132000, DATE '2018-04-02', 'Active'
);

INSERT INTO tms_employees (
  first_name, last_name, email, job_id, dept_id, manager_id, salary, hire_date, status
) VALUES (
  'Liam', 'Chen', 'liam.chen@acme.example',
  (SELECT job_id FROM tms_jobs WHERE title = 'DevOps Engineer'),
  (SELECT dept_id FROM tms_departments WHERE name = 'IT Operations'),
  NULL, 98000, DATE '2019-09-16', 'Active'
);

INSERT INTO tms_employees (
  first_name, last_name, email, job_id, dept_id, manager_id, salary, hire_date, status
) VALUES (
  'Priya', 'Nair', 'priya.nair@acme.example',
  (SELECT job_id FROM tms_jobs WHERE title = 'HR Business Partner'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Human Resources'),
  NULL, 94000, DATE '2017-11-20', 'Active'
);

INSERT INTO tms_employees (
  first_name, last_name, email, job_id, dept_id, manager_id, salary, hire_date, status
) VALUES (
  'Sofia', 'Garcia', 'sofia.garcia@acme.example',
  (SELECT job_id FROM tms_jobs WHERE title = 'Sales Account Executive'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Sales'),
  NULL, 88000, DATE '2020-02-10', 'Active'
);

INSERT INTO tms_employees (
  first_name, last_name, email, job_id, dept_id, manager_id, salary, hire_date, status
) VALUES (
  'Noah', 'Reed', 'noah.reed@acme.example',
  (SELECT job_id FROM tms_jobs WHERE title = 'Payroll Specialist'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Finance'),
  NULL, 64000, DATE '2021-05-03', 'Active'
);

INSERT INTO tms_employees (
  first_name, last_name, email, job_id, dept_id, manager_id, salary, hire_date, status
) VALUES (
  'Ethan', 'Brooks', 'ethan.brooks@acme.example',
  (SELECT job_id FROM tms_jobs WHERE title = 'Product Manager'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Product'),
  NULL, 120000, DATE '2018-08-27', 'Active'
);

INSERT INTO tms_employees (
  candidate_id, first_name, last_name, email, job_id, dept_id, manager_id,
  salary, hire_date, status
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'ravi.menon@example.com'),
  'Ravi', 'Menon', 'ravi.menon@acme.example',
  (SELECT job_id FROM tms_jobs WHERE title = 'Product Manager'),
  (SELECT dept_id FROM tms_departments WHERE name = 'Product'),
  (SELECT employee_id FROM tms_employees WHERE email = 'ethan.brooks@acme.example'),
  118000, DATE '2026-06-24', 'Onboarding'
);

INSERT INTO tms_interview_stages (
  candidate_id, req_id, stage_name, interviewer_id, scheduled_date, outcome,
  feedback_notes, score
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'anika.rao@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Senior Developer' AND r.requested_by = 'maya.patel@acme.example' AND r.open_date = DATE '2026-06-01'),
  'Screening',
  (SELECT employee_id FROM tms_employees WHERE email = 'priya.nair@acme.example'),
  TO_TIMESTAMP('2026-06-11 10:00', 'YYYY-MM-DD HH24:MI'),
  'Proceed',
  TO_CLOB('Strong communication and strong Java/Spring foundation. Move to technical panel.'),
  4.4
);

INSERT INTO tms_interview_stages (
  candidate_id, req_id, stage_name, interviewer_id, scheduled_date, outcome,
  feedback_notes, score
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'anika.rao@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Senior Developer' AND r.requested_by = 'maya.patel@acme.example' AND r.open_date = DATE '2026-06-01'),
  'Technical Interview',
  (SELECT employee_id FROM tms_employees WHERE email = 'maya.patel@acme.example'),
  TO_TIMESTAMP('2026-06-18 14:30', 'YYYY-MM-DD HH24:MI'),
  'Proceed',
  TO_CLOB('Excellent backend design discussion with practical AWS experience.'),
  4.8
);

INSERT INTO tms_interview_stages (
  candidate_id, req_id, stage_name, interviewer_id, scheduled_date, outcome,
  feedback_notes, score
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'marcus.hill@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Senior Developer' AND r.requested_by = 'maya.patel@acme.example' AND r.open_date = DATE '2026-06-01'),
  'Technical Interview',
  (SELECT employee_id FROM tms_employees WHERE email = 'maya.patel@acme.example'),
  TO_TIMESTAMP('2026-06-24 11:00', 'YYYY-MM-DD HH24:MI'),
  'Scheduled',
  TO_CLOB('Panel booked; resume shows strong API experience.'),
  NULL
);

INSERT INTO tms_interview_stages (
  candidate_id, req_id, stage_name, interviewer_id, scheduled_date, outcome,
  feedback_notes, score
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'tom.alvarez@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'DevOps Engineer' AND r.requested_by = 'liam.chen@acme.example' AND r.open_date = DATE '2026-06-03'),
  'Technical Interview',
  (SELECT employee_id FROM tms_employees WHERE email = 'liam.chen@acme.example'),
  TO_TIMESTAMP('2026-06-25 15:00', 'YYYY-MM-DD HH24:MI'),
  'Scheduled',
  TO_CLOB('Focus areas: Kubernetes operations, Terraform modules, incident response.'),
  NULL
);

INSERT INTO tms_interview_stages (
  candidate_id, req_id, stage_name, interviewer_id, scheduled_date, outcome,
  feedback_notes, score
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'olivia.grant@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Sales Account Executive' AND r.requested_by = 'sofia.garcia@acme.example' AND r.open_date = DATE '2026-05-25'),
  'Manager Interview',
  (SELECT employee_id FROM tms_employees WHERE email = 'sofia.garcia@acme.example'),
  TO_TIMESTAMP('2026-06-07 12:00', 'YYYY-MM-DD HH24:MI'),
  'Proceed',
  TO_CLOB('Clear enterprise selling examples; strong territory planning.'),
  4.5
);

INSERT INTO tms_interview_stages (
  candidate_id, req_id, stage_name, interviewer_id, scheduled_date, outcome,
  feedback_notes, score
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'ravi.menon@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Product Manager' AND r.requested_by = 'ethan.brooks@acme.example' AND r.open_date = DATE '2026-04-15'),
  'Final',
  (SELECT employee_id FROM tms_employees WHERE email = 'ethan.brooks@acme.example'),
  TO_TIMESTAMP('2026-05-16 16:00', 'YYYY-MM-DD HH24:MI'),
  'Completed',
  TO_CLOB('Strong roadmap judgment and stakeholder management. Recommended hire.'),
  4.9
);

INSERT INTO tms_offers (
  candidate_id, req_id, offered_salary, start_date, expiry_date, status, approved_by
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'anika.rao@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Senior Developer' AND r.requested_by = 'maya.patel@acme.example' AND r.open_date = DATE '2026-06-01'),
  95000, DATE '2026-07-15', DATE '2026-07-02', 'Sent', 'maya.patel@acme.example'
);

INSERT INTO tms_offers (
  candidate_id, req_id, offered_salary, start_date, expiry_date, status, approved_by
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'olivia.grant@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Sales Account Executive' AND r.requested_by = 'sofia.garcia@acme.example' AND r.open_date = DATE '2026-05-25'),
  82000, DATE '2026-07-22', DATE '2026-07-05', 'Pending Approval', 'sofia.garcia@acme.example'
);

INSERT INTO tms_offers (
  candidate_id, req_id, offered_salary, start_date, expiry_date, status, approved_by
) VALUES (
  (SELECT candidate_id FROM tms_candidates WHERE email = 'ravi.menon@example.com'),
  (SELECT r.req_id FROM tms_job_requisitions r JOIN tms_jobs j ON j.job_id = r.job_id WHERE j.title = 'Product Manager' AND r.requested_by = 'ethan.brooks@acme.example' AND r.open_date = DATE '2026-04-15'),
  118000, DATE '2026-06-24', DATE '2026-06-10', 'Accepted', 'ethan.brooks@acme.example'
);

INSERT INTO tms_onboarding_tasks (
  employee_id, task_name, assigned_to, category, due_date, status
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'ravi.menon@acme.example'),
  'IT Setup', 'liam.chen@acme.example', 'IT', DATE '2026-06-28', 'In Progress'
);

INSERT INTO tms_onboarding_tasks (
  employee_id, task_name, assigned_to, category, due_date, status, completed_date
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'ravi.menon@acme.example'),
  'HR Documents', 'priya.nair@acme.example', 'HR', DATE '2026-06-27',
  'Completed', DATE '2026-06-26'
);

INSERT INTO tms_onboarding_tasks (
  employee_id, task_name, assigned_to, category, due_date, status
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'ravi.menon@acme.example'),
  'Department Orientation', 'ethan.brooks@acme.example', 'Department',
  DATE '2026-06-30', 'Not Started'
);

INSERT INTO tms_onboarding_tasks (
  employee_id, task_name, assigned_to, category, due_date, status
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'ravi.menon@acme.example'),
  'Payroll Setup', 'noah.reed@acme.example', 'Payroll',
  DATE '2026-06-29', 'In Progress'
);

INSERT INTO tms_onboarding_tasks (
  employee_id, task_name, assigned_to, category, due_date, status
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'ravi.menon@acme.example'),
  'Security Awareness Training', 'liam.chen@acme.example', 'Compliance',
  DATE '2026-07-03', 'Not Started'
);

INSERT INTO tms_leave_types (name, max_days_per_year)
VALUES ('Annual Leave', 25);

INSERT INTO tms_leave_types (name, max_days_per_year)
VALUES ('Sick Leave', 10);

INSERT INTO tms_leave_types (name, max_days_per_year)
VALUES ('Personal Leave', 5);

INSERT INTO tms_leave_types (name, max_days_per_year)
VALUES ('Parental Leave', 60);

INSERT INTO tms_leave_types (name, max_days_per_year)
VALUES ('Bereavement Leave', 5);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'maya.patel@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'), 2026, 25, 5, 20);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'maya.patel@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Sick Leave'), 2026, 10, 1, 9);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'liam.chen@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'), 2026, 25, 2, 23);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'priya.nair@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'), 2026, 25, 7, 18);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'sofia.garcia@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'), 2026, 25, 4, 21);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'sofia.garcia@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Sick Leave'), 2026, 10, 2, 8);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'noah.reed@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'), 2026, 25, 6, 19);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'ethan.brooks@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'), 2026, 25, 3, 22);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'ravi.menon@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'), 2026, 25, 0, 25);

INSERT INTO tms_leave_balances (employee_id, leave_type_id, year, accrued, used, remaining)
VALUES ((SELECT employee_id FROM tms_employees WHERE email = 'ravi.menon@acme.example'), (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Sick Leave'), 2026, 10, 0, 10);

INSERT INTO tms_leave_requests (
  employee_id, leave_type_id, start_date, end_date, days_requested, reason, status, approver_id
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'maya.patel@acme.example'),
  (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'),
  DATE '2026-07-08', DATE '2026-07-12', 5,
  TO_CLOB('Family trip booked after sprint planning.'),
  'Approved',
  (SELECT employee_id FROM tms_employees WHERE email = 'priya.nair@acme.example')
);

INSERT INTO tms_leave_requests (
  employee_id, leave_type_id, start_date, end_date, days_requested, reason, status, approver_id
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'sofia.garcia@acme.example'),
  (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Sick Leave'),
  DATE '2026-06-20', DATE '2026-06-21', 2,
  TO_CLOB('Fever and recovery time.'),
  'Approved',
  (SELECT employee_id FROM tms_employees WHERE email = 'priya.nair@acme.example')
);

INSERT INTO tms_leave_requests (
  employee_id, leave_type_id, start_date, end_date, days_requested, reason, status, approver_id
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'ravi.menon@acme.example'),
  (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'),
  DATE '2026-08-12', DATE '2026-08-14', 3,
  TO_CLOB('Planned travel after onboarding activities are complete.'),
  'Submitted',
  (SELECT employee_id FROM tms_employees WHERE email = 'ethan.brooks@acme.example')
);

INSERT INTO tms_leave_requests (
  employee_id, leave_type_id, start_date, end_date, days_requested, reason, status, approver_id
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'noah.reed@acme.example'),
  (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Personal Leave'),
  DATE '2026-07-03', DATE '2026-07-03', 1,
  TO_CLOB('Personal appointment.'),
  'Rejected',
  (SELECT employee_id FROM tms_employees WHERE email = 'priya.nair@acme.example')
);

INSERT INTO tms_leave_requests (
  employee_id, leave_type_id, start_date, end_date, days_requested, reason, status, approver_id
) VALUES (
  (SELECT employee_id FROM tms_employees WHERE email = 'liam.chen@acme.example'),
  (SELECT leave_type_id FROM tms_leave_types WHERE name = 'Annual Leave'),
  DATE '2026-09-01', DATE '2026-09-05', 5,
  TO_CLOB('Tentative vacation plan pending release freeze confirmation.'),
  'Draft',
  NULL
);

INSERT INTO tms_hr_policy (category, title, content)
VALUES ('Leave', 'Annual Leave Policy', TO_CLOB('Full-time employees receive 25 days of annual leave per calendar year. Leave should be requested at least two weeks in advance and approved by the reporting manager. Unused annual leave may be carried forward according to local policy limits.'));

INSERT INTO tms_hr_policy (category, title, content)
VALUES ('Leave', 'Sick Leave Policy', TO_CLOB('Employees receive 10 days of paid sick leave per year. For absences longer than two consecutive working days, employees may be asked to provide medical documentation to HR.'));

INSERT INTO tms_hr_policy (category, title, content)
VALUES ('Probation', 'Probation Period', TO_CLOB('New hires serve a three-month probation period. Managers review onboarding progress, role expectations, and performance checkpoints before confirming regular employment status.'));

INSERT INTO tms_hr_policy (category, title, content)
VALUES ('Remote Work', 'Remote Work Policy', TO_CLOB('Eligible employees may work remotely up to two days per week with manager approval. New employees should coordinate remote work during onboarding so training, equipment setup, and team introductions are not delayed.'));

INSERT INTO tms_hr_policy (category, title, content)
VALUES ('Benefits', 'Health Insurance Enrollment', TO_CLOB('Employees are eligible for company-sponsored health insurance from their hire date. HR sends enrollment instructions during onboarding and employees should complete the form within seven calendar days.'));

INSERT INTO tms_hr_policy (category, title, content)
VALUES ('Security', 'Information Security Policy', TO_CLOB('Employees must use company-managed devices for work, enable multi-factor authentication, and report suspected security incidents immediately to IT Operations.'));

INSERT INTO tms_hr_policy (category, title, content)
VALUES ('Conduct', 'Code of Conduct', TO_CLOB('Acme Corp expects respectful communication, inclusive collaboration, and responsible handling of confidential information in every workplace interaction.'));

INSERT INTO tms_hr_policy (category, title, content)
VALUES ('Travel', 'Business Travel Policy', TO_CLOB('Business travel requires manager approval before booking. Employees should use preferred travel vendors and submit receipts within five business days after the trip.'));

COMMIT;

prompt TMS sample data load complete.
