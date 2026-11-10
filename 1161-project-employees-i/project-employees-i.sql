# Write your MySQL query statement below
With work as (
    Select
sum(E.experience_years) as expyears,
count(P.employee_id) as numofemp,
P.project_id
from Project P
join Employee E on P.employee_id = E.employee_id
group by P.project_id
) 

Select
project_id, 
round(expyears/numofemp,2) as average_years
from work 