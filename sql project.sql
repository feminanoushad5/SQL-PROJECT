use nov_batch;
create table Customers
(customer_id int primary key auto_increment,
customer_name varchar(100) not null,
email varchar(100) unique,
phone varchar(15),
address varchar(200),
join_date date
);
insert into Customers (customer_name,email,phone,address,join_date)
values
('Aarav Menon', 'aarav.m@email.com', '9876543210', 'MG Road, Kochi', '2024-01-10'),
('Meera Nair', 'meera.n@email.com', '9876543211', 'Marine Drive, Ernakulam', '2024-02-05'),
('Rahul Thomas', 'rahul.t@email.com', '9876543212', 'Edapally, Kochi', '2023-12-15'),
('Anjali Pillai', 'anjali.p@email.com', '9876543213', 'Kalamassery, Ernakulam', '2024-03-01'),
('Vikram Das', 'vikram.d@email.com', '9876543214', 'Thrippunithura, Kochi', '2024-01-25'),
('Sneha Kurian', 'sneha.k@email.com', '9876543215', 'Aluva, Ernakulam', '2024-02-20'),
('Kiran Rao', 'kiran.r@email.com', '9876543216', 'Fort Kochi', '2024-01-05'),
('Priya Varma', 'priya.v@email.com', '9876543217', 'Kakkanad, Kochi', '2024-03-10'),
('Arjun Suresh', 'arjun.s@email.com', '9876543218', 'Palarivattom, Ernakulam', '2024-02-28'),
('Lakshmi Menon', 'lakshmi.m@email.com', '9876543219', 'Mattancherry, Kochi', '2024-01-15'),
('Suresh Kumar', 'suresh.k@email.com', '9876543220', 'Tripunithura', '2024-03-05'),
('Divya Joseph', 'divya.j@email.com', '9876543221', 'Angamaly, Ernakulam', '2024-02-10');

select*from Customers;
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100) NOT NULL,
    cuisine_type VARCHAR(50),
    location VARCHAR(100),
    rating DECIMAL(3,2) DEFAULT 4.0,
    contact_phone VARCHAR(15)
);
INSERT INTO Restaurants (restaurant_name, cuisine_type, location, rating, contact_phone) VALUES
('Paradise Biryani', 'Indian', 'Kochi', 4.5, '0484-1234567'),
('Pizza Hut', 'Italian', 'Ernakulam', 4.2, '0484-2345678'),
('Kerala Kitchen', 'South Indian', 'Kochi', 4.7, '0484-3456789'),
('McDonalds', 'Fast Food', 'Kalamassery', 4.0, '0484-4567890'),
('Chinese Wok', 'Chinese', 'Edapally', 4.3, '0484-5678901'),
('Burger King', 'Fast Food', 'MG Road', 4.1, '0484-6789012'),
('Al Sheba', 'Arabian', 'Fort Kochi', 4.6, '0484-7890123'),
('Sree Krishna', 'Vegetarian', 'Aluva', 4.8, '0484-8901234'),
('Domino\'s Pizza', 'Italian', 'Kakkanad', 4.4, '0484-9012345'),
('Tandoor Nights', 'North Indian', 'Palarivattom', 4.5, '0484-0123456'),
('Fresh Bites', 'Healthy', 'Thrippunithura', 4.2, '0484-1234568'),
('Spice Route', 'Malabar', 'Mattancherry', 4.7, '0484-2345679');
select * from Restaurants;
CREATE TABLE Menu_Items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
INSERT INTO Menu_Items (restaurant_id, item_name, category, price) VALUES
(1, 'Chicken Biryani', 'Main Course', 280.00),
(1, 'Mutton Biryani', 'Main Course', 320.00),
(2, 'Margherita Pizza', 'Pizza', 199.00),
(3, 'Idli Sambar', 'Breakfast', 80.00),
(3, 'Masala Dosa', 'Breakfast', 110.00),
(4, 'Big Mac', 'Burger', 150.00),
(5, 'Hakka Noodles', 'Noodles', 180.00),
(6, 'Whopper Burger', 'Burger', 170.00),
(7, 'Shawarma Roll', 'Wrap', 140.00),
(8, 'Paneer Butter Masala', 'Main Course', 220.00),
(9, 'Pepperoni Pizza', 'Pizza', 250.00),
(10, 'Butter Chicken', 'Main Course', 260.00),
(11, 'Grilled Chicken Salad', 'Salad', 160.00),
(12, 'Malabar Biryani', 'Main Course', 290.00),
(1, 'Veg Biryani', 'Main Course', 220.00);
select * from Menu_Items;

CREATE TABLE Delivery_Riders (
    rider_id INT PRIMARY KEY AUTO_INCREMENT,
    rider_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    vehicle_type VARCHAR(50),
    rating DECIMAL(3,2) DEFAULT 4.5,
    total_deliveries INT DEFAULT 0
);
INSERT INTO Delivery_Riders (rider_name, phone, vehicle_type, rating, total_deliveries) VALUES
('Ramesh Kumar', '9876501234', 'Bike', 4.8, 245),
('Sofia Joseph', '9876501235', 'Scooter', 4.6, 189),
('Ajay Menon', '9876501236', 'Bike', 4.7, 312),
('Priya Nair', '9876501237', 'Scooter', 4.9, 156),
('Vinu Das', '9876501238', 'Bike', 4.4, 278),
('Anu Thomas', '9876501239', 'Scooter', 4.5, 203),
('Kiran Rao', '9876501240', 'Bike', 4.8, 167),
('Deepa Varma', '9876501241', 'Scooter', 4.6, 234),
('Sandeep Pillai', '9876501242', 'Bike', 4.7, 145),
('Lekshmi Suresh', '9876501243', 'Scooter', 4.9, 198);
select * from Delivery_Riders;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    rider_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10,2),
    delivery_fee DECIMAL(10,2) DEFAULT 40.00,
    status VARCHAR(30) DEFAULT 'Delivered',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (rider_id) REFERENCES Delivery_Riders(rider_id)
);
INSERT INTO Orders (customer_id, restaurant_id, rider_id, order_date, total_amount, status) VALUES
(1, 1, 1, '2025-03-01 12:30:00', 320.00, 'Delivered'),
(2, 2, 2, '2025-03-02 13:15:00', 239.00, 'Delivered'),
(3, 3, 3, '2025-03-03 19:45:00', 190.00, 'Delivered'),
(4, 4, 4, '2025-03-04 20:10:00', 150.00, 'Delivered'),
(5, 5, 1, '2025-03-05 18:20:00', 220.00, 'Delivered'),
(1, 6, 5, '2025-03-06 21:00:00', 210.00, 'Delivered'),
(6, 7, 2, '2025-03-07 14:30:00', 180.00, 'Delivered'),
(7, 8, 6, '2025-03-08 12:45:00', 220.00, 'Delivered'),
(8, 9, 3, '2025-03-09 19:00:00', 290.00, 'Delivered'),
(9, 10, 7, '2025-03-10 20:30:00', 260.00, 'Delivered'),
(10, 1, 4, '2025-03-11 13:10:00', 500.00, 'Delivered'),
(2, 11, 8, '2025-03-12 18:50:00', 160.00, 'Delivered'),
(3, 12, 9, '2025-03-13 21:15:00', 290.00, 'Delivered'),
(4, 2, 1, '2025-03-14 12:00:00', 199.00, 'Delivered'),
(5, 3, 10, '2025-03-15 19:30:00', 300.00, 'Delivered');
select * from Orders;

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT DEFAULT 1,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)
);
INSERT INTO Order_Items (order_id, item_id, quantity, subtotal) VALUES
(1, 1, 1, 280.00),
(2, 3, 1, 199.00),
(3, 4, 1, 80.00),
(3, 5, 1, 110.00),
(4, 6, 1, 150.00),
(5, 7, 1, 180.00), 
(5, 15, 1, 40.00),
(6, 8, 1, 170.00),
(7, 9, 1, 140.00),
(8, 10, 1, 220.00),
(9, 11, 1, 250.00),
(10, 12, 1, 260.00),
(11, 1, 1, 280.00), 
(11, 2, 1, 220.00),
(12, 13, 1, 160.00),
(13, 14, 1, 290.00),
(14, 3, 1, 199.00),
(15, 4, 2, 160.00), 
(15, 5, 1, 110.00);
select * from Order_Items;
select restaurant_name,cuisine_type,rating from Restaurants
order by restaurant_name;
use nov_batch;
select customer_name,join_date from Customers where join_date>="2024-01-01" order by join_date;

select item_name,category,price from Menu_Items where category in ('Pizza','Burger') and price<200;

-- 4.	Count total restaurants per cuisine type.
select cuisine_type,count(*) as restaurant_count from Restaurants group by cuisine_type order by restaurant_count desc; 
use nov_batch;
-- 5.	Show the highest rated restaurant
select restaurant_name,rating
from Restaurants
order by rating desc
limit 1;
-- 6.	List all orders with customer name and restaurant name
select o.order_id,c.customer_name,r.restaurant_name
from Orders as o
join Customers as c on c.customer_id=o.customer_id
join Restaurants as r on r.restaurant_id=o.restaurant_id
order by order_id;
-- 7.	Update the status of an order to 'Out for Delivery'.
update Orders
set status="Out for Delivery"
where order_id=1;
select * from Orders;
-- 8.	Calculate total revenue per restaurant. 
select r.restaurant_name,sum(o.total_amount) as total_revenue
from Orders as o
join Restaurants as r
on r.restaurant_id=o.restaurant_id
group by restaurant_name
order by total_revenue
desc;
-- 9.	Find the average order value.
select avg(total_amount) as avg_order_value
from Orders;
-- 10.	Count number of orders per customer (who ordered the most?). 
select c.customer_name,count(o.order_id) as total_orders
from Orders as o
join Customers as c on c.customer_id=o.customer_id
group by c.customer_name
order by total_orders
desc;
-- 11.	Show total deliveries completed by each rider. 
select rider_name,total_deliveries
from Delivery_Riders
order by total_deliveries
desc;
-- 12.	Find the most popular item (ordered the maximum times). 
select mi.item_name,count(oi.order_item_id) as times_ordered
from Order_Items as oi
join Menu_Items mi
on mi.item_id=oi.item_id
group by mi.item_name
order by times_ordered desc;
-- 13.	Calculate total delivery fee collected in March 2025. 
select sum(delivery_fee) as total_delivery_fee
from Orders 
where order_date between "2025-03-01" and "2025-03-31";
-- 14.	Top 3 cuisines by number of orders.
select r.cuisine_type,count(o.order_id) as order_count
from Orders as o
join Restaurants as r
on r.restaurant_id=o.restaurant_id
group by r.cuisine_type
order by order_count desc
limit 3;
-- 15.	Show order details: customer name, restaurant name, rider name, order date, total amount. 
select c.customer_name,r.restaurant_name,dr.rider_name,o.order_date,o.total_amount
from Orders as o
join Customers as c on c.customer_id=o.customer_id
join Restaurants as r on r.restaurant_id=o.restaurant_id
join Delivery_Riders as dr on dr.rider_id=o.rider_id
order by o.total_amount desc;

-- 16.	List all menu items with their restaurant name . 
select mi.item_name,mi.category,mi.price,r.restaurant_name
from Menu_Items as mi
join Restaurants as r
on r.Restaurant_id=mi.restaurant_id
order by restaurant_name;

-- 17.	Find customers who have not placed any order .
 select c.customer_name 
from Customers c 
left join Orders o on c.customer_id=o.customer_id 
where o.order_id is null;
-- 18.	Display every order with items ordered. 
select o.order_id, c.customer_name, mi.item_name, oi.quantity, oi.subtotal 
from Orders o 
join Customers c on o.customer_id = c.customer_id 
join Order_Items oi on o.order_id = oi.order_id 
join Menu_Items mi on oi.item_id = mi.item_id 
order by o.order_id;

-- 19.	Riders who have completed more than 200 deliveries. 
select rider_name, total_deliveries 
from Delivery_Riders 
where total_deliveries > 200 
order by total_deliveries desc;

-- 20.	Show all restaurants and their menu items count even if no items. 
select r.restaurant_name, count(mi.item_id) as menu_items_count 
from Restaurants r 
left join Menu_Items mi on r.restaurant_id = mi.restaurant_id 
group by r.restaurant_name 
order by menu_items_count desc;

-- 21.	Multi-table: Customer name, ordered item names, quantity, and rider for delivered orders. 
select c.customer_name, mi.item_name, oi.quantity, dr.rider_name 
from Orders o 
join Customers c on o.customer_id = c.customer_id 
join Order_Items oi on o.order_id = oi.order_id 
join Menu_Items mi on oi.item_id = mi.item_id 
join Delivery_Riders dr on o.rider_id = dr.rider_id;

update Orders set status = 'Preparing' where order_id=4;
select * from Orders;


-- 22.	Find orders that are not yet delivered. 
select order_id,status from Orders 
where status!="Delivered";

-- 23.	Find menu items more expensive than the average price. 
select avg(price) from Menu_Items;
select item_name, price 
from Menu_Items 
where price > (select avg(price) from Menu_Items) 
order by price desc;

-- 24.	List customers who ordered from more than one restaurant (subquery + GROUP BY). 
select c.customer_name, count(distinct o.restaurant_id) as restaurant_count 
from Customers c 
join Orders o on c.customer_id = o.customer_id 
group by c.customer_name 
having restaurant_count > 1;
-- 25.	Second highest rated rider (using subquery or RANK()). 
select rider_name,rating
from(
    select rider_name,rating,
        dense_rank() over (order by rating desc) as rnk
    from Delivery_Riders
)r
where rnk = 2;
-- 26.	Orders where total_amount > average order amount . 

select order_id, total_amount 
from Orders 
where total_amount > (select avg(total_amount) from Orders) 
order by total_amount desc;

-- 27.	Calculate rider performance: name, total deliveries, average rating. 
SELECT rider_name, total_deliveries, rating 
FROM Delivery_Riders 
ORDER BY total_deliveries DESC;