SELECT name, rating
FROM pizzeria AS p
LEFT OUTER JOIN person_visits AS pv ON p.id = pv.pizzeria_id
WHERE pv.id IS NULL