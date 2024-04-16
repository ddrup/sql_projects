CREATE VIEW v_price_with_discount(name,pizza_name,price,discount_price)
AS
    SELECT p.name, m.pizza_name, m.price, ROUND(price - price * 0.1)
    FROM menu m
    JOIN person_order po ON po.menu_id = m.id
    JOIN person p ON p.id = po.person_id
    ORDER BY p.name, m.pizza_name;