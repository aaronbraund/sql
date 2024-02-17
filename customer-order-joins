SELECT customers.name, customers.email, orders.item, orders.price
FROM customers 
LEFT OUTER JOIN orders ON customers.id = orders.customer_id;


SELECT customers.name, customers.email, SUM(orders.price) AS total_spending
FROM customers 
LEFT OUTER JOIN orders ON customers.id = orders.customer_id
GROUP BY name
ORDER BY price DESC
