INSERT INTO person_visits(id,person_id,pizzeria_id,visit_date)
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT p.id FROM pizzeria p
            JOIN (SELECT * FROM menu
                WHERE price < 800
                 ) AS pz ON pz.pizzeria_id = p.id
            EXCEPT
            (SELECT p2.id
             FROM pizzeria p2
             JOIN mv_dmitriy_visits_and_eats mv ON mv.name = p2.name
            )
            LIMIT 1
        ),
        '2022-01-08'::date);
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;