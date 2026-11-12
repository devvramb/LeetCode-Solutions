
with valid_prices as (
    select
        product_id,
        new_price,
        change_date,
        row_number() over (
            partition by product_id
            order by
                (change_date <= '2019-08-16') desc,
                change_date desc
        ) as rn
    from Products
)

select
    product_id,
    if(change_date <= '2019-08-16', new_price, 10) as price
from valid_prices
where rn = 1;
