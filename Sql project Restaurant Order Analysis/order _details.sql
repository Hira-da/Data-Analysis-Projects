USE restaurant_db;

-- View the order_details table. What is the date range of the table?
SELECT * FROM order_details;
SELECT MIN(order_date) AS min_order_date, MAX(order_date) AS max_order_date FROM order_details;

-- How many orders were made within this date range? How many items were ordered within this date range?
SELECT COUNT(DISTINCT order_id) AS num_orders_within_date_range
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31';

SELECT COUNT(*) AS num_items_ordered_within_date_range
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31';

-- Which orders had the most number of items?
SELECT TOP 1 order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- How many orders had more than 12 items?
SELECT COUNT(*) AS num_orders_with_more_than_12_items
FROM (
    SELECT order_id, COUNT(item_id) AS num_items
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
) AS orders_with_more_than_12_items;
