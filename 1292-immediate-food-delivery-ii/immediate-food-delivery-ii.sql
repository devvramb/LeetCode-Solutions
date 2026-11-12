# Write your MySQL query statement below
with first_order as (
    select
        customer_id,
        order_date,
        customer_pref_delivery_date,
        row_number() over (
            partition by customer_id
            order by order_date
        ) as rn
    from Delivery
)

select
    round(
        sum(
            case
                when order_date = customer_pref_delivery_date then 1
                else 0
            end
        ) * 100.0 / count(*), 2
    ) as immediate_percentage
from first_order
where rn = 1;