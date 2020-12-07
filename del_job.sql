/*
CREATE OR REPLACE PROCEDURE DEL_JOB 
  (p_jobid jobs.job_id%type --,p_jobtitle jobs.job_title%type, 
   --p_minsal jobs.min_salary%type, p_maxsal jobs.max_salary%type
   )
AS 
BEGIN
  delete from jobs where job_id = p_jobid;
EXCEPTION
  WHEN others THEN
    DBMS_OUTPUT.PUT_LINE ('No jobs deleted' || p_jobid);  -- handle exception  
END DEL_JOB;
*/ 
--it wont work because no row found will not throw an error by default, thus we
-- need to raise exception in the if, then call the exception later.

create or replace PROCEDURE DEL_JOB
  (p_jobid jobs.job_id%TYPE)
AS 
--sqle NUMBER; 
--sqlm VARCHAR2(300);
BEGIN
  DELETE FROM JOBS WHERE JOB_ID = UPPER(p_jobid);
  IF SQL%NOTFOUND THEN
     raise no_data_found;
  --DBMS_OUTPUT.PUT_LINE('No such record');
  END IF;
EXCEPTION
 WHEN no_data_found THEN
  --sqle := SQLCODE;
  --sqlm := SQLERRM;
  -- DBMS_OUTPUT.PUT_LINE('No bob is deleted.');
  --DBMS_OUTPUT.PUT_LINE('Error Code ='||sqle||' Error message =' ||sqlm);
  raise_application_error(-20203, 'No Job deleted!');
END;
