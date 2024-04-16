CREATE UNIQUE INDEX idx_menu_unique
ON menu (pizzeria_id,pizza_name);

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYSE
SELECT *
FROM menu
WHERE pizzeria_id IN(1,2,3,4) AND pizza_name = 'cheese pizza';