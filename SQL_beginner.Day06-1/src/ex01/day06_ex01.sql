INSERT INTO person_discounts (id, pizzeria_id, person_id, discount)
SELECT row_number() over () as id, m.pizzeria_id, person_id,
       case
           when count(po.person_id) = 1 then 10.5
           when count(po.person_id) = 2 then 22
           else 30
       end as discount
FROM person_order po
INNER JOIN menu m on m.id = po.menu_id
GROUP BY person_id,pizzeria_id;