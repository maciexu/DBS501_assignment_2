CREATE OR REPLACE FUNCTION GET_JOB 
 (j_id jobs.job_id%type)
RETURN VARCHAR2 AS 
 j_title jobs.job_title%type  := 'Unknow';
BEGIN
  select job_title
  into j_title
  from jobs
  where job_id = j_id;
  RETURN j_title;
END GET_JOB;



