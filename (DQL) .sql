                         -- q1

SELECT * FROM customers;

                         -- q2
SELECT product_name, category
FROM products
WHERE price BETWEEN 5000 AND 10000;

                         -- q3
SELECT *
FROM products
ORDER BY price DESC;

                         -- q4
SELECT 
    product_id,
    COUNT(order_id) AS total_orders,
    AVG(amount) AS average_amount,
    MAX(amount) AS highest_total_amount,
    MIN(amount) AS lowest_total_amount
FROM 
    orders
GROUP BY 
    product_id;

                         -- q5
SELECT 
    customer_id
FROM 
    orders
GROUP BY 
    customer_id
HAVING 
    COUNT(order_id) > 2;

                         -- q6
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id) AS num_orders
FROM 
    orders
WHERE 
    YEAR(order_date) = 2020
GROUP BY 
    MONTH(order_date);

                         -- q7

SELECT 
    p.product_name,
    c.customer_name,
    o.order_date
FROM 
    orders o
JOIN 
    products p ON o.product_id = p.product_id
JOIN 
    customers c ON o.customer_id = c.customer_id;

                              -- q8

SELECT 
    *
FROM 
    orders
WHERE 
    order_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    AND order_date < CURDATE() - INTERVAL 2 MONTH;

                               -- q9
SELECT 
    c.customer_id
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
WHERE 
    o.customer_id IS NULL;

