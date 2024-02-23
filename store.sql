CREATE TABLE storeitems
    (id INTEGER PRIMARY KEY, name TEXT, price INTEGER, quantity INTEGER, quantity_per_item INTEGER);
    
INSERT INTO storeitems 
    (id, name, price, quantity, quantity_per_item)
VALUES
    (1, "Bananas", 2.50, 10, 1),
    (2, "Apples", 1.75, 15, 2),
    (3, "Oranges", 2.00, 12, 3),
    (4, "Milk", 3.50, 8, 1),
    (5, "Bread", 2.25, 20, 2),
    (6, "Eggs", 2.00, 24, 6),
    (7, "Chicken", 5.00, 5, 1),
    (8, "Rice", 4.00, 10, 2),
    (9, "Pasta", 2.75, 18, 3),
    (10, "Tomatoes", 1.50, 30, 5),
    (11, "Potatoes", 2.00, 25, 4),
    (12, "Cereal", 3.25, 12, 1),
    (13, "Yogurt", 1.75, 15, 1),
    (14, "Cheese", 4.50, 8, 2),
    (15, "Spinach", 1.80, 20, 3);
    
SELECT name, price FROM storeitems ORDER BY price DESC;

SELECT AVG(price) FROM storeitems;

SELECT name, price/quantity_per_item AS value_per_item
FROM storeitems
ORDER BY value_per_item DESC
