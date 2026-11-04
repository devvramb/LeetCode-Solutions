WITH Activity_test AS (
    SELECT
        machine_id,
        process_id,
        MAX(CASE 
            WHEN activity_type = 'start' THEN timestamp
        END) AS start_time ,
        MAX(CASE 
            WHEN activity_type = 'end' THEN timestamp
     END ) as end_time
From Activity
GROUP BY machine_id, process_id
)
SELECT 
    machine_id,
    ROUND (avg(end_time - start_time),3) as processing_time
from Activity_test
Group By machine_id
