SELECT p.name, count(pizzeria_id) as count_of_visits
FROM person_visits
INNER JOIN person p on p.id = person_visits.person_id
GROUP BY p.name
ORDER BY count_of_visits desc,p.name
LIMIT 4;