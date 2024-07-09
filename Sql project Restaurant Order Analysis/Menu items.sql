USE restaurant_db;

-- View the menu_items table and find the number of items on the menu
SELECT * FROM menu_items;
SELECT COUNT(*) AS num_items FROM menu_items;

-- Find the least and most expensive items on the menu
-- Most expensive item
SELECT TOP 1 * FROM menu_items ORDER BY price DESC;
-- Least expensive item
SELECT TOP 1 * FROM menu_items ORDER BY price;

-- Explore Italian dishes on the menu
-- Number of Italian dishes
SELECT COUNT(*) AS num_italian_dishes FROM menu_items WHERE category = 'Italian';
-- Most expensive Italian dish
SELECT TOP 1 * FROM menu_items WHERE category = 'Italian' ORDER BY price DESC;
-- Least expensive Italian dish
SELECT TOP 1 * FROM menu_items WHERE category = 'Italian' ORDER BY price;

-- Explore dish counts and average prices by category
-- Number of dishes in each category
SELECT category, COUNT(*) AS num_dishes FROM menu_items GROUP BY category;
-- Average dish price within each category
SELECT category, AVG(price) AS avg_dish_price FROM menu_items GROUP BY category;
