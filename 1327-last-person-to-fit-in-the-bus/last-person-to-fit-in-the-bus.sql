# Write your MySQL query statement below
-- 
with recursive test as (

    select
        q.person_id,
        q.person_name,
        q.weight,
        q.turn,
        q.weight as total_weight
    from Queue q
    where q.turn = 1

    union all
    select
    q.person_id,
    q.person_name,
    q.weight,
    q.turn,
    t.total_weight + q.weight as Cumalative_total_weight
    from test t
    join Queue q
        on q.turn = t.turn + 1
    where t.total_weight + q.weight <= 1000  -- run the iterator here
)

select
    person_name
from test
where turn = (
    select max(turn)
    from test
);