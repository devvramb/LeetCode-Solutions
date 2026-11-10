# Write your MySQL query statement below
WITH test AS (
    SELECT
        E.employee_id,
        E.name,
        E2.age AS report_age
    FROM Employees E
    JOIN Employees E2
        ON E.employee_id = E2.reports_to
)

SELECT
    employee_id,
    name,
    COUNT(*) AS reports_count,
    ROUND(AVG(report_age), 0) AS average_age
FROM test
GROUP BY employee_id, name
ORDER BY employee_id;

