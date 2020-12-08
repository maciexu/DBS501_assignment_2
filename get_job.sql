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
/

variable j_id VARCHAR2(10)
variable j_title VARCHAR2(35)
execute :j_id :='SA_REP'
execute get_job(:j_id)
print j_id
print j_title


