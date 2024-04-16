WITH visit AS(
	SELECT pizzeria_id,person_id FROM person_visits pv
	WHERE visit_date IN('2022-01-08')
),
	per AS(
	SELECT id FROM person
	WHERE name IN('Dmitriy')
),
	price AS(
	SELECT pizzeria_id FROM menu
	WHERE price < 800
)

SELECT p.name
FROM pizzeria p
JOIN visit ON visit.pizzeria_id = p.id
JOIN per ON per.id = visit.person_id
JOIN price ON price.pizzeria_id = p.id