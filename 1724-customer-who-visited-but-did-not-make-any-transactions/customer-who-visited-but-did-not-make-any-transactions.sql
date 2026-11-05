# Write your MySQL query statement below
Select
V.customer_id,
Count(V.customer_id) as count_no_trans
From Visits as V 
left join Transactions as T 
    on V.Visit_id = T.Visit_id
    where t.transaction_id is null
Group by customer_id
    
