SELECT id AS menu_id FROM menu
WHERE id <> ALL (
		SELECT menu_id FROM person_order
	)
ORDER BY menu_id;