# Write your MySQL query statement below
Select 
teacher_id,
Count(distinct subject_id) cnt
from teacher
group by teacher_id