USE restaurant_db;

--Combine the menu_items and order_details tables into a single table
select * from menu_items join order_details on 
menu_item_id=item_id;
--What were the least and most ordered items?
select  top 1 count(item_id) as c,item_name from menu_items join order_details on 
menu_item_id=item_id group by item_name order by c desc;
select  top 1 count(item_id) as c,item_name from menu_items join order_details on 
menu_item_id=item_id group by item_name order by c ;
--What categories were they in?
select  top 1 count(item_id) as c,item_name ,category from menu_items join order_details on 
menu_item_id=item_id group by item_name , category order by c desc;
--What were the top 5 orders that spent the most money?
select top 5 order_id , sum(price) from menu_items join order_details on 
menu_item_id=item_id group by order_id order by sum(price) desc;
--View the details of the highest spend order. Which specific items were purchased?
select distinct(item_name) from menu_items join order_details on 
menu_item_id=item_id where order_id=
(select top 1 order_id  from menu_items join order_details on 
menu_item_id=item_id group by order_id order by sum(price) desc)
--BONUS: View the details of the top 5 highest spend orders
