with emp_data as
(
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    LOWER(EMAIL) AS EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    NVL(SALARY, 0) AS SALARY,
    NVL(COMMISSION_PCT, 0) AS COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
FROM {{ ref('employee_raw') }}
)
select * from emp_data