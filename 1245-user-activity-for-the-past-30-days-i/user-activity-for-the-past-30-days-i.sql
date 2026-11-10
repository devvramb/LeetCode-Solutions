# Write your MySQL query statement below
Select 
activity_date as day,
Count(distinct IF(
    activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY)
                      AND '2019-07-27',
    user_id,
    NULL
)) as active_users
from Activity
where activity_date between DATE_SUB('2019-07-27', INTERVAL 29 DAY) and '2019-07-27'
group by day 