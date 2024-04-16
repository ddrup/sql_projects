SELECT pizza_name, price, p.name AS pizzeria_name FROM menu
JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE menu.id <> ALL (
		SELECT menu_id FROM person_order
	)
ORDER BY pizza_name, price;