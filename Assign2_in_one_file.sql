
CREATE OR REPLACE PROCEDURE DEL_JOB2
  (p_jobid jobs.job_id%TYPE)  AS 
BEGIN
  DELETE FROM JOBS WHERE JOB_ID = UPPER(p_jobid);
  IF SQL%NOTFOUND THEN
     raise no_data_found;
  END IF;
EXCEPTION
  WHEN no_data_found THEN
    raise_application_error(-20203, 'No Job deleted!');
END DEL_JOB2;



--execute del_job2('IT_WEB');
