# Write your MySQL query statement below
SELECT
Distinct V.customer_id,
COUNT(V.visit_id) as count_no_trans
FROM Visits as V
LEFT JOIN Transactions as t 
        on V.visit_id = t.visit_id
    WHERE T.amount IS NULL
    group by V.customer_id;

-- IF NOT in Transaction THEN it is count number of transactions 