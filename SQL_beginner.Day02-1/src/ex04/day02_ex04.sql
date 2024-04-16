WITH pizza AS(
	SELECT pizzeria_id,pizza_name, price
	FROM menu
	WHERE pizza_name IN('mushroom pizza','pepperoni pizza')
)
SELECT m.pizza_name AS pizza_name, p.name AS pizzeria_name, m.price AS price
FROM pizza m
JOIN pizzeria p ON p.id = m.pizzeria_id
ORDER BY pizza_name, pizzeria_name;