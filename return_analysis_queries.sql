-- E-Commerce Return & Fraud Analysis
-- Backend: MySQL

-- Create database and switch to it
CREATE DATABASE IF NOT EXISTS ecommerce_project;
USE ecommerce_project;

-- Set up main schema for order tracking
CREATE TABLE IF NOT EXISTS e_commerce_orders (
    order_id INT,
    customer_id INT,
    category VARCHAR(50),
    price DECIMAL(10,2),
    return_status INT,
    return_reason VARCHAR(100)
);

-- Wipe old data and insert fresh sample rows
TRUNCATE TABLE e_commerce_orders;

INSERT INTO e_commerce_orders (order_id, customer_id, category, price, return_status, return_reason) VALUES 
(1001, 1, 'Clothing', 45.00, 1, 'Size Mismatch'),
(1002, 2, 'Electronics', 120.00, 0, NULL),
(1003, 1, 'Clothing', 60.00, 1, 'Defective'),
(1004, 3, 'Home', 25.00, 0, NULL),
(1005, 2, 'Clothing', 80.00, 1, 'Size Mismatch'),
(1006, 4, 'Electronics', 300.00, 0, NULL),
(1007, 5, 'Home', 40.00, 0, NULL),
(1008, 1, 'Clothing', 55.00, 1, 'Size Mismatch'),
(1009, 3, 'Electronics', 150.00, 0, NULL),
(1010, 1, 'Clothing', 95.00, 1, 'Size Mismatch');

-- Metric 1: Find return rates and total revenue lost per category
WITH ReturnMetrics AS (
    SELECT 
        category,
        COUNT(order_id) AS total_orders,
        SUM(CASE WHEN return_status = 1 THEN 1 ELSE 0 END) AS total_returns,
        SUM(CASE WHEN return_status = 1 THEN price ELSE 0 END) AS refunded_amount
    FROM e_commerce_orders
    GROUP BY category
)
SELECT 
    category,
    total_orders,
    total_returns,
    ROUND((total_returns / total_orders) * 100, 2) AS return_rate_pct,
    refunded_amount
FROM ReturnMetrics
ORDER BY return_rate_pct DESC;

-- Metric 2: Flag serial returners (potential policy abuse)
SELECT 
    customer_id,
    COUNT(order_id) AS total_purchases,
    SUM(CASE WHEN return_status = 1 THEN 1 ELSE 0 END) AS total_returns,
    ROUND((SUM(CASE WHEN return_status = 1 THEN 1 ELSE 0 END) / COUNT(order_id)) * 100, 2) AS customer_return_rate
FROM e_commerce_orders
GROUP BY customer_id
ORDER BY customer_return_rate DESC;