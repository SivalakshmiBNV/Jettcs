{{
        config(
                materialized='incremental', unique_key='nation_id'
        )
}}
 
with nation as (
select
        n_nationkey as nation_id,
        n_regionkey as region_id,
        n_name as name,
        n_comment as comment,
         current_date AS load_date
from {{ source("src","nations") }}  

where load_date<={{var('current_date')}}
 )
select * from nation