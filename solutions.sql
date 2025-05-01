-- SECTION 1 (QUERYING DATA) :

-- Q1 (SOLUTION):
select * from customers

--  Q2 (SOLUTION):
select customer_name,email from customers

-- Q3 (SOLUTION):
select distinct country from customers

-- Q4 (SOLUTION):
select total_amount as amount_usd from orders

-- Q5 (SOLUTION):
select concat(product_name ,' ',category) as product_info from products

-- Q6 (SOLUTION):
SELECT email FROM customers
WHERE email LIKE '%user1%';

-- Q7 (SOLUTION):
select 
order_id,
total_amount,
total_amount * 0.9 as discount
from orders

-- Q8 (SOLUTION):
select distinct category from products
order by category

-- Q9 (SOLUTION):
select category,COUNT(*) as total_product
from products
group by category
having COUNT(*) > 30

-- Q10 (SOLUTION):
select top 5
product_name,
price
from products
order by price desc

-- SECTION 2 (SORTING DATA):

-- Q1 (SOLUTION):
select *from customers
order by customer_name asc

-- Q2 (SOLUTION):
select * from orders
order by total_amount desc

-- Q3 (SOLUTION):
select * from products
order by category,price asc

-- Q4 (SOLUTION):
select * from customers
order by customer_name asc,country asc

-- Q5 (SOLUTION):
select top 10 * from orders
order by order_date asc

-- Q6 (SOLUTION):
SELECT * 
FROM customers
ORDER BY SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email));

-- Q7 (SOLUTION):
SELECT product_name, LEN(product_name) AS name_length
FROM products
ORDER BY LEN(product_name) ASC;

-- Q8 (SOLUTION):
select * from orders
order by order_date asc,total_amount asc

-- Q9 (SOLUTION):
select customer_id,COUNT(*) as order_count 
from orders
group by customer_id
order by COUNT(*) desc

-- Q10 (SOLUTION):
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- SECTION 3 (LIMITING ROWS):

-- Q1 (SOLUTION):
select
top 10 
* from customers

-- Q2 (SOLUTION):
select top 5 * from orders
order by order_date desc

-- Q3 (SOLUTION):
select top 3 * 
from products
order by price

-- Q4 (SOLUTION):
select top 7 * from order_items
order by quantity desc

-- Q5 (SOLUTION):
select top 5 customer_id,sum(total_amount) as total_spent
from orders
group by customer_id
order by total_spent desc

-- Q6 (SOLUTION):
select top 10 * from orders
order by order_date desc

-- Q7 (SOLUTION):
select top 3 country,COUNT(*) as customer_count
from customers
group by country
order by customer_count desc

-- Q8 (SOLUTION):
select top 5 category,COUNT(*) as product_count
from products
group by category
order by product_count desc

-- Q9 (SOLUTION):
select top 10 * from customers
where country = 'Uk'
order by customer_id

-- Q10 (SOLUTION):
select top 5* from products
order by NEWId()

-- SECTION 4. (FILTERING DATA):

-- Q1 (SOLUTION):
select * from customers
where country = 'usa'

-- Q2 (SOLUTION):
select * from products
where price > 1000

-- Q3 (SOLUTION):
select * from orders
where order_date between '2023-1-1' and '2023-3-1'

-- Q4 (SOLUTION):
SELECT * FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- Q5 (SOLUTION):
select * from customers
where email like '%.com'

-- Q6 (SOLUTION):
SELECT * FROM order_items
WHERE quantity BETWEEN 5 AND 9;

-- Q7 (SOLUTION):
select * from products
where category != 'book'

-- Q8 (SOLUTION):
select * from customers
where customer_name like 'A%'

-- Q9 (SOLUTION):
with top_countries as (
SELECT top 3 country
FROM customers
GROUP BY country
ORDER BY COUNT(*) DESC
 )
select o.*
from orders as o
join customers as c 
on o.customer_id = o.customer_id
where c.country in (select country from top_countries)

-- Q10 (SOLUTION):
select * from products
where price %2 = 0 

-- SECTION 5 (JOINING TABLES):

-- Q1 (SOLUTION):
select * from customers as c
join orders as o
on c.customer_id = o.customer_id

-- Q2 (SOLUTION):
select * from orders as o
join order_items as oi
on o.order_id = oi.order_id
join products as p
on oi.product_id = p.product_id

-- Q3 (SOLUTION):
select p.product_name, sum(oi.quantity) as total from 
order_items as oi
join products as p
on oi.product_id = p.product_id
group by p.product_name

-- Q4 (SOLUTION):
select  c.customer_id, c.customer_name 
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_items as oi on o.order_id = oi.order_id
join products as p on oi.product_id = p.product_id
where p.product_name = 'product_10'

-- Q5 (SOLUTION):

select customer_id, COUNT(*) as order_count from orders
group by customer_id
order by order_count

-- Q6 (SOLUTION):
select o.order_id,c.customer_name from customers as c
left join orders as o
on c.customer_id = o.customer_id

-- Q7 (SOLUTION):
select p.product_name,oi.order_item_id from products as p
left join order_items as oi
on p.product_id = oi.product_id
where oi.product_id is null

-- Q8 (SOLUTION):
SELECT o.order_id, SUM(oi.quantity) AS total_items
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- Q9 (SOLUTION):
SELECT c.customer_name, p.product_name, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Q10 (SOLUTION):
SELECT c.customer_name, MAX(o.order_date) AS latest_order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- SECTION 7  (SUBQUERIES) :

-- Q1 (SOLUTION):
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > (SELECT AVG(total_amount) FROM orders);

-- Q2 (SOLUTION):
select product_id,product_name,price from products
where price > (select AVG(price) as avg_price from products)

-- Q3 (SOLUTION):
select customer_id,total_amount
from orders
where total_amount = (select MAX(total_amount) from orders)

-- Q4 (SOLUTION):
select top 5 p.product_name, sum(oi.quantity) as totla_orderd
from order_items as oi
join products as p
on oi.product_id = p.product_id
group by p.product_name
order by totla_orderd desc

-- Q5 (SOLUTION):
SELECT TOP 1 customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC;

-- Q6 (SOLUTION):
SELECT customer_id, customer_name
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id FROM orders
);

-- Q7 (SOLUTION):
SELECT TOP 3 category, COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;

-- Q8 (SOLUTION):
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM order_items);

-- Q9 (SOLUTION):
SELECT email, COUNT(*) AS duplicate_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- Q10 (SOLUTION):
SELECT DISTINCT o.order_id, o.customer_id, o.order_date
FROM orders AS o
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN products AS p ON oi.product_id = p.product_id
WHERE p.price = (
    SELECT MIN(price) FROM products
);

-- SECTION 8 (SET OPERATORS):

-- Q1 (SOLUTION):
SELECT customer_id, customer_name, country
FROM customers
WHERE country = 'UK'
UNION
SELECT customer_id, customer_name, country
FROM customers
WHERE country = 'USA';

-- Q2 (SOLUTION):
SELECT product_id, product_name
FROM products
WHERE product_id NOT IN (
  SELECT DISTINCT product_id FROM order_items
);

-- Q3 (SOLUTION):
SELECT order_id FROM orders
WHERE MONTH(order_date) = 1
INTERSECT
SELECT order_id FROM orders
WHERE MONTH(order_date) = 2;

-- Q4 (SOLUTION):
--4. Electronics but not Sports (EXCEPT)
SELECT *
FROM products
WHERE category = 'Electronics'
  AND category <> 'Sports';
 
-- Q5 (SOLUTION):
SELECT product_name FROM products
WHERE price > 1000
UNION ALL
SELECT product_name FROM products
WHERE product_name LIKE 'A%';

-- SECTION 12 (EXPRESSIONS):

-- Q1 (SOLUTION):
SELECT order_id,total_amount,
CASE
	when total_amount >1000  then 'High'
	when total_amount <1000 then 'low'
	else 'very expensive'
END as order_value_category
FROM orders;

-- Q2 (SOLUTION):
SELECT email,
  SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) AS domain
FROM customers;

-- Q3 (SOLUTION):
select  *, unit_price * quantity AS total_price
FROM order_items;

-- Q4 (SOLUTION):

SELECT order_id,
  FORMAT(order_date, 'MMMM yyyy') AS formatted_date
FROM orders;

-- Q5 (SOLUTION):
SELECT customer_id, COUNT(*) AS total_orders,
  CASE
    WHEN COUNT(*) >= 10 THEN 'Platinum'
    WHEN COUNT(*) >= 5 THEN 'Gold'
    ELSE 'Silver'
  END AS tier
FROM orders
GROUP BY customer_id;

-- SECTION 13  (FINDING & REMOVING DUPLICATES):

-- Q1 (SOLUTION):
SELECT email, COUNT(*) AS duplicates
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- Q2 (SOLUTION):
DELETE c1
FROM customers c1
JOIN customers c2
  ON c1.customer_id = c2.customer_id
WHERE c1.customer_id > c2.customer_id;

-- Q3 (SOLUTION):
SELECT product_name, COUNT(*) AS count
FROM products
GROUP BY product_name
HAVING COUNT(*) > 1;

-- Q4 (SOLUTION):
SELECT customer_id, order_date, COUNT(*) AS count
FROM orders
GROUP BY customer_id, order_date
HAVING COUNT(*) > 1

-- Q5 (SOLUTION):
DELETE c1
FROM customers c1
JOIN customers c2
  ON c1.customer_id = c2.customer_id
WHERE c1.customer_id> c2.customer_id;


-- 14. VIEWS:

-- Q1 (SOLUTION):
create view high_value_customer as 
select customer_id,SUM(total_amount) as total_spent
from orders
group by customer_id
having sum(total_amount) >5000

-- Topic 15: Indexes & Stored Procedures:

-- Q1 (SOLUTION):
create clustered index cindx_customer_id 
on customers(customer_id)

-- Q3 (SOLUTION):
drop index cindx_customer_id on customers

CREATE PROCEDURE insert_new_product
  @product_name VARCHAR(100),
  @price DECIMAL(10,2),
  @category varchar(100)
AS
BEGIN
  INSERT INTO products (product_name, price, category)
  VALUES (@product_name, @price, @category);
END;
-- Q4 (SOLUTION):

SELECT customer_id, COUNT(*) AS order_count,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS order_rank
FROM orders
GROUP BY customer_id;
-- Q5 (SOLUTION):
SELECT p.category, p.product_name, p.price,
  DENSE_RANK() OVER (PARTITION BY p.category ORDER BY p.price DESC) AS rank_within_category
FROM products p;


SELECT customer_id, order_id, order_date,
  LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order
FROM orders;

