# Write your MySQL query statement below
Select *
from Cinema c
where c.description != "boring"
and c.id%2 =1 -- mod (id,2) = 1
order by rating desc