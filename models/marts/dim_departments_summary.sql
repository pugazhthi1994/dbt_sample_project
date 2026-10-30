with gold_dept as 
(
    SELECT
    d.DEPARTMENT_ID,
    d.DEPARTMENT_NAME,
    COUNT(e.EMPLOYEE_ID) AS TOTAL_EMPLOYEES,
    ROUND(AVG(e.SALARY), 2) AS AVG_SALARY,
    SUM(e.SALARY) AS TOTAL_PAYROLL
FROM {{ ref('silver_departments') }} d
LEFT JOIN {{ ref('silver_employees') }} e 
    ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY 
    d.DEPARTMENT_ID,
    d.DEPARTMENT_NAME
)
select * from gold_dept