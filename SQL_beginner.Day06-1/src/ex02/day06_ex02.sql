SELECT p.name, m.pizza_name, m.price, (1 - pd.discount/100) * m.price as discount_price, pi.name as pizzeria_name
FROM person_order
INNER JOIN person p on p.id = person_order.person_id
INNER JOIN menu m on m.id = person_order.menu_id
INNER JOIN person_discounts pd on (pd.person_id = person_order.person_id and pd.pizzeria_id = m.pizzeria_id)
INNER JOIN pizzeria pi on pi.id = m.pizzeria_id
ORDER BY p.name, pizza_name;