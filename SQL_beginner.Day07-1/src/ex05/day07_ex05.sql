SELECT DISTINCT p.name
FROM person_order
INNER JOIN person p on p.id = person_order.person_id
ORDER BY name;