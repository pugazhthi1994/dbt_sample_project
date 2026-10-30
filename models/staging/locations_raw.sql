
with cte as
(
select 
    LOCATION_ID,
    STREET_ADDRESS,
    POSTAL_CODE,
    CITY,
    STATE_PROVINCE,
    COUNTRY_ID,
    CURRENT_TIMESTAMP() AS LOADED_AT
from {{source('dbt_oracle_tables', 'locations')}}
)
select * from cte

{% if is_incremental() %}
    -- This block is skipped during the initial run / full-refresh
    where LOADED_AT > (select max(LOADED_AT) from {{ this }})
{% endif %}