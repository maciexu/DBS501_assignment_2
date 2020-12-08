CREATE OR REPLACE FUNCTION GET_JOB 
 (p_id jobs.job_id%type)
RETURN VARCHAR2 AS 
 v_title jobs.job_title%type  := 'Unknow';
BEGIN
  select job_title
  into v_title
  from jobs
  where job_id = p_id;
  RETURN v_title;
END GET_JOB;
/

VARIABLE b_title VARCHAR2(35)
EXECUTE :b_title := get_job('SA_REP')
print b_title


