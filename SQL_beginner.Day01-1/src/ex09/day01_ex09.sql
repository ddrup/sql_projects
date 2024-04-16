SELECT DISTINCT name FROM pizzeria
WHERE name NOT IN (
    SELECT DISTINCT name FROM pizzeria
	JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
);                
SELECT DISTINCT name FROM pizzeria
WHERE NOT EXISTS (
	SELECT id FROM person_visits
	WHERE pizzeria.id = pizzeria_id
);