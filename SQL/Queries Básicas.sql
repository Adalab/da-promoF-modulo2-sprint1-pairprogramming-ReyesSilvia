CREATE SCHEMA `northwind`;
USE `northwind`;

-- 4. 
SELECT employee_id, last_name, first_name
FROM employees;

-- 5. 
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price BETWEEN 0 AND 5;

-- 6.
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price IS NULL;

-- 7. 
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price<15 AND product_id<10;

-- 8.
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price>15 AND product_id>10;

-- 9. 
SELECT DISTINCT ship_country
FROM orders;

-- 10. 
SELECT product_id, product_name, unit_price
FROM products
LIMIT 10;

-- 11. 
SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

-- 12. 
SELECT DISTINCT order_id
FROM order_details;

-- 13. 
SELECT order_id, unit_price*quantity AS importe_total
FROM order_details
ORDER BY importe_total DESC
LIMIT 3;

-- 14. 
SELECT order_id, unit_price*quantity AS importe_total
FROM order_details
ORDER BY importe_total DESC
LIMIT 5 OFFSET 5;

-- 15. 
SELECT category_name AS NombreDeCategoria
FROM categories;

-- 16. 
SELECT order_id, DATE_ADD(shipped_date, INTERVAL 5 DAY) AS FechaRetrasada
FROM orders;

-- 17. 
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price BETWEEN 15 AND 50;

-- 18. 
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price IN (18,19,20);
