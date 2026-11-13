# Write your MySQL query statement below

-- I need to match the product_key to the product key in the product table, 
-- i think a count rows of the product table could work and then a count distinct of the product key for each customer ID, 
-- so I guess it would be something like a match between the count (*) = count(distinct product key ) over paritition by product_key as a subquery
-- and then I would also need a join on product_key and customer table on product_key
-- Or the alternative logic would be Count ( distinct product key)  partition by customer_id over product_key
-- 
select
    customer_id
from Customer
group by customer_id
having count(distinct product_key) = (
    select count(*)
    from Product
);
