{{
    config(
        schema = 'testing',
        store_failures = true
    )
}}
 
with orders as (
    select * from {{ ref('stgorders') }}
)
 
select order_id, sum(total_price) ordertotal
from orders
group by 1
having (ordertotal<=890)
 
 
 
 