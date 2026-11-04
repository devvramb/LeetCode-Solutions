# Write your MySQL query statement below
Select 
P.product_name, 
S.year, 
S.Price
From Sales as S
Join Product as P
on P.product_id = S.product_id