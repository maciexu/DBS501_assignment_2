CREATE OR REPLACE TRIGGER EMP_HISTORICAL_RECORD 
 AFTER INSERT OR UPDATE
 ON EMPLOYEES 
 for each row
BEGIN
   insert into job_history
   values (employee_id, start_date, sysdate, :old.job_id, :old.department_id);
   if :new.department_id <> :old.department_id then
     raise_application_error(-20211, 'cannot change department.');
   end if;
END;

--it does not work....Reason is start_date and old department id were not declared!!


CREATE OR REPLACE TRIGGER EMP_HISTORICAL_RECORD 
 AFTER INSERT OR UPDATE
 ON EMPLOYEES 
 for each row
declare
  v_start_date  date;
  v_dept_id number;
BEGIN
  select hire_date, department_id 
  into v_start_date, v_dept_id
  from employees 
  where employee_id = :old.employee_id;
   insert into job_history (employee_id, start_date, end_date, job_id, department_id)
   values (:old.employee_id, v_start_date, sysdate, :old.job_id, v_dept_id);
   if :new.department_id <> v_dept_id then
     raise_application_error(-20211, 'cannot change the department.');
   end if;
END;


