

CREATE OR REPLACE PROCEDURE get_emp
 (p_id     IN OUT employees.employee_id%TYPE,
  p_sal    OUT employees.salary%TYPE) IS
BEGIN
  SELECT  employee_id, salary INTO p_id, p_sal
  FROM    employees
  WHERE   employee_id = p_id;
END get_emp;


-- host variable
/*
VARIABLE v_job	number
VARIABLE v_sal	number
EXECUTE :v_job := 120 
EXECUTE get_emp(:v_job, :v_sal)
print v_job
PRINT v_sal
/*




