-- 1
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;
SELECT sum(rating) FROM pizzeria;

SELECT sum(rating) FROM pizzeria;
COMMIT;

SELECT sum(rating) FROM pizzeria;

-- 2
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';
COMMIT;

SELECT sum(rating) FROM pizzeria;