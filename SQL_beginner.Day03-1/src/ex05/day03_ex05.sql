WITH andrey_visit AS(
	SELECT DISTINCT p.name
	FROM pizzeria p
	JOIN person_visits pv ON  pv.pizzeria_id = p.id
	JOIN (
		SELECT id FROM person
		WHERE name = 'Andrey'
	)AS per ON per.id = pv.person_id
), andrey_order AS(
	SELECT DISTINCT p.name 
	FROM pizzeria p
	JOIN menu m ON m.pizzeria_id = p.id
	JOIN person_order po ON po.menu_id = m.id
	JOIN (
		SELECT id FROM person
		WHERE name = 'Andrey'
	)AS per ON per.id = po.person_id
)

SELECT name AS pizzeria_name FROM andrey_visit
EXCEPT
SELECT name AS pizzeria_name FROM andrey_order
ORDER BY pizzeria_name;