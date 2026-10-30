
with cte as
(
select 
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID,
    CURRENT_TIMESTAMP() AS LOADED_AT
from {{source('dbt_oracle_tables', 'departments')}}
)
select * from cte

{% if is_incremental() %}
    -- This block is skipped during the initial run / full-refresh
    where LOADED_AT > (select max(LOADED_AT) from {{ this }})
{% endif %}