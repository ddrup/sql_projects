WITH men AS(
	SELECT pizzeria_id, COUNT(person_id) AS count
	FROM person_visits pv
	RIGHT JOIN (
		SELECT id
		FROM person
		WHERE gender = 'male'
	)AS male ON male.id = pv.person_id
	GROUP BY pizzeria_id
), women AS(
	SELECT pizzeria_id, COUNT(person_id) AS count
	FROM person_visits pv
	RIGHT JOIN (
		SELECT id
		FROM person
		WHERE gender = 'female'
	)AS male ON male.id = pv.person_id
	GROUP BY pizzeria_id
)

SELECT p.name AS pizzeria_name
FROM pizzeria p
JOIN men m ON m.pizzeria_id = p.id
JOIN women w ON w.pizzeria_id = p.id
WHERE w.count <> m.count
ORDER BY pizzeria_name;