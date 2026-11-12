# Write your MySQL query statement below
Select 
user_id, 
Concat(
Upper(left(name, 1)),
Lower(substring(name,2))
) as name
from users
order by user_id