# Write your MySQL query statement below
With first as (Select
e.employee_id,
CASE
    WHEN COUNT(employee_id) OVER (PARTITION BY employee_id) > 1
         AND primary_flag = 'Y'
    THEN department_id

    WHEN COUNT(employee_id) OVER (PARTITION BY employee_id) = 1
    THEN department_id
END AS department_id
from employee e )

Select employee_id, department_id
from first
where department_id is not null