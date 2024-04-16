SELECT person_order.order_date AS order_date, CONCAT(person.name,' (age:',person.age::VARCHAR,')') AS person_information FROM person_order
INNER JOIN person ON person_order.person_id = person.id
ORDER BY order_date, person_information;