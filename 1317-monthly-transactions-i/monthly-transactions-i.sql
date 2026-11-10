# Write your MySQL query statement below
Select 
date_format(trans_date, '%Y-%m') as month, 
country, 
count(amount) as trans_count,
IFNULL(Sum(case when state = 'approved' then 1 end),0) as approved_count,
sum(amount) as trans_total_amount,
IFNULL(sum(case when state = 'approved' then amount end),0) as approved_total_amount
from Transactions 
group by month, country