# Write your MySQL query statement below
WITH testing AS (
    SELECT
        R.contest_id,
        COUNT(DISTINCT R.user_id) AS totusers,
        (SELECT COUNT(*) FROM Users) AS numofusers
    FROM Register R
    GROUP BY R.contest_id
)

SELECT
    contest_id,
    ROUND(totusers * 100.0 / numofusers, 2) AS percentage
FROM testing
ORDER BY percentage DESC, contest_id ASC;