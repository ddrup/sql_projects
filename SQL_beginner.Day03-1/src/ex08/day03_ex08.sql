INSERT INTO menu(id,pizzeria_id,pizza_name,price)
VALUES((SELECT MAX(id) FROM menu)+1,(SELECT id FROM pizzeria p WHERE name = 'Dominos'),'sicilian pizza',900);