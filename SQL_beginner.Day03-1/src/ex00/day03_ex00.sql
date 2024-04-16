WITH per AS(
	SELECT visit_date,pizzeria_id FROM person_visits pv
	JOIN (SELECT * FROM person WHERE name = 'Kate') AS per ON per.id = pv.person_id
)

SELECT m.pizza_name, m.price, p.name AS pizzeria_name, per.visit_date FROM menu m
JOIN pizzeria p ON p.id = m.pizzeria_id
JOIN per ON per.pizzeria_id = p.id
WHERE m.price BETWEEN 800 AND 1000
ORDER BY m.pizza_name, m.price, pizzeria_name;