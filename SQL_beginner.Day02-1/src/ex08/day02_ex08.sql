WITH person_name AS(
	SELECT name,id FROM person
	WHERE gender = 'male' AND (address IN('Moscow','Samara'))
),
	pizza AS(
	SELECT id FROM menu
	WHERE pizza_name IN('pepperoni pizza','mushroom pizza')
)

SELECT p.name
FROM person_order po
JOIN person_name p ON p.id = po.person_id
JOIN pizza ON pizza.id = po.menu_id
ORDER BY name DESC;