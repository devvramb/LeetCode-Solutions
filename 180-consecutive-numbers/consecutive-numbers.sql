# Write your MySQL query statement below
select
num as ConsecutiveNums
from (
    select
        id,
        num,
        lead(num, 1) over (order by id) as next_num,
        lead(num, 2) over (order by id) as next_next_num
    from Logs
) as sub
where num = next_num 
and num = next_next_num
group by num