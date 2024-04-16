WITH eq_pizza AS(
	SELECT pizza_name, pizzeria_id, price, p.name AS pizzeria_name
	FROM menu m
	JOIN pizzeria p ON p.id = m.pizzeria_id
	WHERE price = ANY(
		SELECT price FROM menu m1
		WHERE m1.pizza_name = m.pizza_name AND m.pizzeria_id <> m1.pizzeria_id
	)
)
SELECT q1.pizza_name,q1.pizzeria_name AS pizzeria_name_1, q2.pizzeria_name AS pizzeria_name_2,q1.price
FROM eq_pizza AS q1
JOIN eq_pizza AS q2 ON q1.price = q2.price
WHERE q1.pizzeria_name <> q2.pizzeria_name AND q1.pizzeria_id < q2.pizzeria_id
ORDER BY pizza_name;