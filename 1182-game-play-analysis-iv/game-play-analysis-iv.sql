with first as (
    select
        player_id,
        event_date,
        row_number() over (
            partition by player_id
            order by event_date
        ) as rn
    from Activity
),

next_logins as (
    select
        f.player_id,
        if(a.player_id is not null, 1, 0) as next_day
    from first f
    left join Activity a
        on f.player_id = a.player_id
        and a.event_date = date_add(f.event_date, interval 1 day)
    where f.rn = 1
)

select
    round(
        sum(next_day) / count(distinct player_id), 2
    ) as fraction
from next_logins;