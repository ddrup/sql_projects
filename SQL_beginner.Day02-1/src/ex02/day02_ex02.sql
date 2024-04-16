SELECT COALESCE(ps.name,'-') AS person_name, pv.visit_date AS visit_date, COALESCE(p.name,'-') AS pizzeria_name
FROM person ps
FULL OUTER JOIN (
			SELECT id,pizzeria_id,person_id,visit_date FROM person_visits
			WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
)AS pv
ON ps.id = pv.person_id
FULL OUTER JOIN (
			SELECT id,name FROM pizzeria
) p ON p.id = pv.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;