-- 1
BEGIN;
UPDATE pizzeria 
SET rating = 5.0
WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;

-- 2
select * from pizzeria where name = 'Pizza Hut';

select * from pizzeria where name = 'Pizza Hut';