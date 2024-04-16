WITH men AS(
	SELECT DISTINCT p.name
	FROM person_order po
	RIGHT JOIN (
		SELECT id
		FROM person
		WHERE gender = 'male'
	)AS male ON male.id = po.person_id
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria p ON p.id = m.pizzeria_id
), women AS(
	SELECT DISTINCT p.name
	FROM person_order po
	RIGHT JOIN (
		SELECT id
		FROM person
		WHERE gender = 'female'
	)AS male ON male.id = po.person_id
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria p ON p.id = m.pizzeria_id
), only_men AS(
	SELECT name FROM men
	EXCEPT
	SELECT name FROM women
), only_women AS(
	SELECT name FROM women
	EXCEPT
	SELECT name FROM men
)

SELECT name AS pizzeria_name FROM only_men
UNION
SELECT name AS pizzeria_name FROM only_women
ORDER BY pizzeria_name;