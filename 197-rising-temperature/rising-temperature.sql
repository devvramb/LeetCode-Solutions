# Write your MySQL query statement below
WITH prevtemp AS (
    SELECT
        id,
        recordDate,
        temperature,
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS ytemp,
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS previous_date
    FROM Weather
)
SELECT id
FROM prevtemp
WHERE temperature > ytemp
  AND previous_date = DATE_SUB(recordDate, INTERVAL 1 DAY)