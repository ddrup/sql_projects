CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS
    WITH date_visit AS(
        SELECT pizzeria_id,person_id FROM person_visits pv
        WHERE visit_date IN('2022-01-08')
    ),
        dm_name AS(
        SELECT id FROM person
        WHERE name IN('Dmitriy')
    ),
        price AS(
        SELECT pizzeria_id FROM menu
        WHERE price < 800
    )
    SELECT p.name
    FROM pizzeria p
    JOIN date_visit dv ON dv.pizzeria_id = p.id
    JOIN dm_name dn ON dn.id = dv.person_id
    JOIN price ON price.pizzeria_id = p.id;