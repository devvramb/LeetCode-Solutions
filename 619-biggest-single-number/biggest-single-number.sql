# Write your MySQL query statement below
With numb as(Select 
num
from 
MyNumbers
group by num
Having count(num) = 1
) 

Select 
max(num) as num
from numb