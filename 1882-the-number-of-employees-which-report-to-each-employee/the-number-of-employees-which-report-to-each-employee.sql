# Write your MySQL query statement below
Select
E.employee_id,
E.name,
count(Em.reports_to) as reports_count,
round(avg(Em.age),0) as average_age
from Employees E 
join Employees Em on E.Employee_id = Em.reports_to
group by E.employee_id, E.name
order by E.employee_id
