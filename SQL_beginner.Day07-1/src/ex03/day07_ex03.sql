WITH visit_and_order AS ((SELECT pz.name, count(pv.person_id) as count
                          FROM person_visits pv
                                   INNER JOIN pizzeria pz on pv.pizzeria_id = pz.id
                          GROUP BY pz.name
                          ORDER BY count desc)
                         UNION ALL
                         (SELECT pz.name, count(po.person_id) as count
                          FROM person_order po
                                   INNER JOIN menu m on m.id = po.menu_id
                                   INNER JOIN pizzeria pz on m.pizzeria_id = pz.id
                          GROUP BY pz.name
                          ORDER BY count desc))
SELECT name, sum(count) as total_count
FROM visit_and_order
GROUP BY name
ORDER BY total_count desc, name;