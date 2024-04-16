(SELECT pz.name, count(pv.person_id) as count, 'visit' as action_type
FROM person_visits pv
INNER JOIN pizzeria pz on pv.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY count desc
LIMIT 3)
UNION ALL
(SELECT pz.name, count(po.person_id) as count, 'order' as action_type
FROM person_order po
INNER JOIN menu m on m.id = po.menu_id
INNER JOIN pizzeria pz on m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY count desc
LIMIT 3)
ORDER BY action_type, count desc;