CREATE OR REPLACE FUNCTION VALID_DEPTID 
  (p_id departments.department_id%type)
  RETURN boolean AS 
  v_valid PLS_INTEGER;
BEGIN
  select 1 into v_valid 
  from departments
  where department_id = p_id;
  return TRUE;
exception
  when no_data_found then
  RETURN FALSE;
END VALID_DEPTID;


CREATE OR REPLACE PROCEDURE ADD_EMP(
  p_fname  employees.first_name%type,
  p_lname  employees.last_name%type,
  p_email  employees.email%type,
  p_jid    employees.job_id%type        default 'SA_REP',
  p_mid    employees.manager_id%type    default 145,
  p_sal    employees.salary%type        default 1000,
  p_com    employees.commission_pct%type default 0,
  p_did    employees.department_id%type default 30)
AS 
BEGIN
  if valid_deptid(p_did) then
    insert into employees (employee_id, first_name, last_name, email, job_id, 
    manager_id, salary, commission_pct, department_id, hire_date)
    values (EMPLOYEES_SEQ.nextval, p_fname, p_lname, p_email, p_jid, p_mid, 
    p_sal, p_com, p_did, trunc(sysdate));
  else
    raise_application_error (-20204, 'invalid department id');
  end if;
END ADD_EMP;




