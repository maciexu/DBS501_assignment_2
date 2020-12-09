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

--it does not work....


