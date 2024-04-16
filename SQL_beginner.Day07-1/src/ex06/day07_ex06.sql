SELECT pi.name, count(po.person_id) as count_of_orders, ROUND(avg(m.price),2) as average_price, max(m.price) as max_price, min(m.price) as min_price
FROM person_order po
INNER JOIN menu m on m.id = po.menu_id
INNER JOIN pizzeria pi on pi.id = m.pizzeria_id
GROUP BY pi.name
ORDER BY pi.name;