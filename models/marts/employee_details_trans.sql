{{
    config(
        materialized= "incremental",
        unique_key= "ID"
    )
}}

select * from 
{{ source('dbt_sample_tables', 'employee_details') }}

{% if is_incremental() %}

where received_at > (select max(received_at) from {{this}})

{% endif %}