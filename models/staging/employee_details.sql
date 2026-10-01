
select * from 
{{ source('dbt_sample_tables', 'employee_details') }}