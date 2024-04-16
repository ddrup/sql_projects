WITH pizza AS(
	SELECT id AS person_id, 
	       (SELECT id
	        FROM menu
	        WHERE pizza_name = 'greek pizza') AS menu_id,
            TIMESTAMP '2022-02-25' AS date
 	FROM person
), order_id AS(
	SELECT GENERATE_SERIES((SELECT MAX(id) FROM person_order)+1,
						(SELECT MAX(id) FROM person_order) + (SELECT COUNT(id) FROM person) + 1) AS person_order_id,
            GENERATE_SERIES(1,(SELECT COUNT(id) FROM person)) AS person_id
	LIMIT (SELECT COUNT(id) FROM person)
)
INSERT INTO person_order(id,person_id,menu_id,order_date)
SELECT oi.person_order_id, oi.person_id, p.menu_id, p.date 
FROM order_id oi
INNER JOIN pizza p ON p.person_id = oi.person_id;