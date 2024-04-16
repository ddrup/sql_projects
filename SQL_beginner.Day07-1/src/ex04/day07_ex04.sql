SELECT p.name, count(pv.pizzeria_id) as count_of_visits
FROM person_visits pv
INNER JOIN person p on p.id = pv.person_id
GROUP BY name
HAVING count(pv.pizzeria_id) > 3;