# Write your MySQL query statement below
WITH test AS (  -- cte created 
    SELECT
        managerId, -- this is necessary to do to the group by
        COUNT(*) AS direct_reports   -- counts rows so that we cnan group by managerId
    FROM Employee
    GROUP BY managerId
)

SELECT
    e.name
FROM test
JOIN Employee e
    ON test.managerId = e.id  -- matches to 
WHERE test.direct_reports >= 5; -- calls on table 