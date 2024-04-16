WITH ps AS(
	SELECT name,id FROM person
	WHERE name IN('Denis','Anna')
)

SELECT m.pizza_name AS pizza_name, p.name AS pizzeria_name
FROM person_order po
JOIN ps ON ps.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria p ON p.id = m.pizzeria_id
ORDER BY pizza_name, pizzeria_name;