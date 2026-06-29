create database blinkit_sales_project;

SELECT COUNT(*) AS total_orders
FROM blinkit_orders
limit 10;

SELECT ROUND(SUM(order_total), 2) AS total_revenue
FROM blinkit_orders;

SELECT ROUND(AVG(order_total), 2) AS avg_order_value
FROM blinkit_orders;

SELECT payment_method,
       COUNT(*) AS total_orders,
       ROUND(SUM(order_total), 2) AS total_revenue
FROM blinkit_orders
GROUP BY payment_method
ORDER BY total_revenue DESC;

SELECT store_id,
       COUNT(*) AS total_orders,
       ROUND(SUM(order_total), 2) AS total_revenue
FROM blinkit_orders
GROUP BY store_id
ORDER BY total_revenue DESC;


SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS order_month,
  COUNT(*) AS total_orders,
  ROUND(SUM(order_total), 2) AS total_revenue
FROM blinkit_orders
GROUP BY order_month
ORDER BY order_month;

SELECT delivery_status,
       COUNT(*) AS total_orders,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM blinkit_orders), 2) AS pct
FROM blinkit_orders
GROUP BY delivery_status;


SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS order_month,
  COUNT(*) AS total_orders,
  ROUND(SUM(order_total), 2) AS total_revenue
FROM blinkit_orders
GROUP BY order_month
ORDER BY order_month;

SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity_sold,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM blinkit_order_items oi
JOIN blinkit_products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

SELECT p.category,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM blinkit_order_items oi
JOIN blinkit_products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM blinkit_order_items oi
JOIN blinkit_products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold ASC
LIMIT 10;

SELECT store_id,
       delivery_status,
       COUNT(*) AS total
FROM blinkit_orders
GROUP BY store_id, delivery_status
ORDER BY store_id;

SELECT o.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders,
       ROUND(SUM(o.order_total), 2) AS total_spend
FROM blinkit_orders o
JOIN blinkit_customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name
ORDER BY total_spend DESC
LIMIT 10;

SELECT category,
       ROUND(AVG(margin_percentage), 2) AS avg_margin,
       ROUND(AVG(price), 2) AS avg_price
FROM blinkit_products
GROUP BY category
ORDER BY avg_margin DESC;





