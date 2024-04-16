WITH female AS(
	SELECT id, name FROM person
	WHERE gender = 'female'
)

SELECT f.name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN female f ON f.id = po.person_id
WHERE m.pizza_name = 'cheese pizza'
AND EXISTS (
    SELECT po2.person_id
    FROM person_order po2
    JOIN menu m2 ON po2.menu_id = m2.id
    WHERE po2.person_id = po.person_id
    AND m2.pizza_name = 'pepperoni pizza'
)
ORDER BY name;