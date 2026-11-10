# Write your MySQL query statement below
Select 
query_name,
Round(avg (rating/position),2) as quality,
Round(count(case when rating < 3 then 1 end)*100/count(rating),2) as poor_query_percentage
from queries 
group by query_name
