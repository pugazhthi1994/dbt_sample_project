with dept_data as
(
    SELECT
    DEPARTMENT_ID,
    {{ oracle_normalize_string('DEPARTMENT_NAME') }} AS DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID
FROM {{ ref('departments_raw') }}
)
SELECT * FROM dept_data