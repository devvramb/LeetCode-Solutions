# Write your MySQL query statement below
SELECT 
ttemp.id
from Weather as ttemp
Join weather as ytemp
ON DATE_SUB(ttemp.recordDate, INTERVAL 1 DAY) = ytemp.recordDate
Where ttemp.temperature > ytemp.temperature; 