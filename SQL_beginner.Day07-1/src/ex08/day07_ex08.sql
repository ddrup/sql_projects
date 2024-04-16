SELECT p.address, pi.name, count(po.person_id)
FROM person_order po
INNER JOIN menu m on m.id = po.menu_id
INNER JOIN pizzeria pi on pi.id = m.pizzeria_id
INNER JOIN person p on p.id = po.person_id
GROUP BY address, pi.name
ORDER BY p.address, pi.name;