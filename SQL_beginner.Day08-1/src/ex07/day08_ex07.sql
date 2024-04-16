-- 1
BEGIN;
UPDATE pizzeria SET rating = 5.0 WHERE name = 'DinoPizza';
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Papa Johns';
COMMIT;

-- 2
BEGIN;
UPDATE pizzeria SET rating = 2.0 WHERE name = 'Papa Johns';
UPDATE pizzeria SET rating = 1.0 WHERE name = 'DinoPizza';
COMMIT;