# SQL-PROJECT
Food Delivery System
Overview:
This database simulates the core operations of an online food delivery platform.It manages customers, restaurants, menu items, orders, order details (items in each order), and delivery personnel (riders). The system tracks order placement, item selection, delivery assignment, status updates, and basic analytics such as popular items, and revenue.
Tables and Relationships:
1.	Customers — Stores user (customer) information.
2.	Restaurants — Details of partner restaurants.
3.	Menu_Items — Food items available from each restaurant (with price and category).
4.	Orders — Main order records (links customer, restaurant, rider).
5.	Order_Items — Junction table for items included in each order (supports multiple items per order).
6.	Delivery_Riders — Delivery personnel details and performance.

Customers (1) — (Many) Orders — (Many) Restaurants
Restaurants (1) — (Many) Menu_Items
Orders (1) — (Many) Order_Items
Orders (1) — (1) Delivery_Riders (assigned rider)

This database helps in performing basic operations such as:
•	Total orders and revenue per restaurant or per month
•	Most popular food items and best-selling categories
•	Top customers and their ordering frequency
•	Customer details and full order history
•	Restaurant performance (ratings, orders received, cuisine-wise sales)
•	Menu items with prices and categories
•	Rider performance (deliveries completed, ratings)
•	Order status and delivery details

Keys Used in the Database
1. Primary Key (PK)
A Primary Key uniquely identifies each record in a table. It does not allow NULL or duplicate values.
•	customer_id → Primary Key in Customers table
•	restaurant_id → Primary Key in Restaurants table
•	item_id → Primary Key in Menu_Items table
•	rider_id → Primary Key in Delivery_Riders table
•	order_id → Primary Key in Orders table
•	order_item_id → Primary Key in Order_Items table
Purpose: Ensures every record (customer, restaurant, order, etc.) has a unique identifier.
2. Foreign Key (FK)
A Foreign Key is a column that refers to the Primary Key of another table. It creates relationships between tables.
•	restaurant_id in Menu_Items table → References restaurant_id in Restaurants table
•	customer_id in Orders table → References customer_id in Customers table
•	restaurant_id in Orders table → References restaurant_id in Restaurants table
•	rider_id in Orders table → References rider_id in Delivery_Riders table
•	order_id in Order_Items table → References order_id in Orders table
•	item_id in Order_Items table → References item_id in Menu_Items table
Purpose: Maintains referential integrity and links related data (e.g., one restaurant can have many menu items, one customer can place many orders).
3. Composite / Additional Keys
•	email in Customers table → Unique Key (prevents duplicate email IDs)
•	phone in Customers and Delivery_Riders tables → Can be used as Unique Key
Purpose: Adds extra constraints for uniqueness where needed.
