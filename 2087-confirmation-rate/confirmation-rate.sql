# Write your MySQL query statement below
With f as (select 
S.user_id,
count(C.time_stamp) as num_of_req, 
count(CASE when C.action = 'confirmed' THEN 1 end) as confirmed
from Signups S
left join Confirmations C on S.user_id = C.user_id
group by S.user_id
)
select
user_id, 
ROUND(IFNULL((confirmed/num_of_req),0),2) as confirmation_rate
from f
order by confirmation_rate 