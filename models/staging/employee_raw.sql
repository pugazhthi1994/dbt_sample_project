
with cte as
(
select 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID,
    CURRENT_TIMESTAMP() AS LOADED_AT
from {{source('dbt_oracle_tables', 'employees')}}
)
select * from cte

{% if is_incremental() %}
    -- This block is skipped during the initial run / full-refresh
    where LOADED_AT > (select max(LOADED_AT) from {{ this }})
{% endif %}