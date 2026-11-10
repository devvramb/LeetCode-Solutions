# Write your MySQL query statement below
With firstable as(Select 
P.product_id,
sum(CASE when US.purchase_date between P.start_date and P.end_date then (P.price * US.units) end)as unitprice,
sum(US.units) as unitss
from Prices P
left join UnitsSold US on P.product_id = US.product_id
and US.purchase_date between P.start_date and P.end_date
group by P.product_id
)

Select
product_id,
IFNULL(round(unitprice/unitss,2),0) as average_price
from firstable
