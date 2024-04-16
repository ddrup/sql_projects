CREATE UNIQUE INDEX idx_person_order_order_date
ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYSE
SELECT *
FROM person_order
WHERE person_id IN(1,2)
    AND menu_id IN(1,9)
    AND order_date = '2022-01-01';