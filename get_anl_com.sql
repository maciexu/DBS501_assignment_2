create or replace FUNCTION GET_ANL_COM 
  (p_id employees.employee_id%type)
   RETURN number AS 
   v_total employees.salary%type;
   BEGIN
       select salary * 12 + salary * nvl(commission_pct, 0) * 12 
       into v_total
       from employees
       where employee_id = p_id;
       RETURN v_total;
END GET_ANL_COM;


select employee_id, get_anl_com(employee_id)
from employees
where department_id = 30;



