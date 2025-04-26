--1. Querying Data:

--Select all columns from the customers table.
--Retrieve customer names and emails.
--Get a list of unique countries.
--Show total order amount with alias.
--Combine product name + category as product_info.
--List customer emails containing “user1”.
--Calculate 10% discount on all order totals.
--Show sorted unique product categories.
--Count products in categories with more than 30 items.
--Get top 5 expensive products.

--2. SORTING DATA:

--Sort customers by name.
--Sort orders by amount DESC.
--Sort products by category + price.
--Sort customers by country + name.
--Show top 10 earliest orders.
--Sort by email domain.
--Sort products by name length.
--Sort orders by date + amount.
--Sort by number of orders per customer.
--Sort by product popularity (total quantity sold).

--3. Limiting Rows:

--Get first 10 customers.
-- get Last 5 orders placed.
-- Get 3 cheapest products.
-- Get 7 highest quantity items.
-- Top 5 customers by order value.
-- Most recent 10 orders.
-- Top 3 countries by customer count.
-- Top 5 categories by product count.
-- First 10 UK customers.
-- Random 5 products.

--4. FILTERING DATA:

-- Customers from USA.
-- Products over $1000.
-- Orders between 2 dates.
-- Orders > average amount.
-- Emails ending in “.com”.
-- Quantity between 5–9.
-- Products not in “Books”.
-- Names starting with “A”.
-- Orders from top 3 countries.
-- Even-numbered priced products.

--5. JOINING TABLES:

--Join orders + customers.
--Join orders + items + products.
--Total quantity ordered per product
--Customers who bought “Product_10”.
-- Average number of orders per customer
-- customers and orders (show all customers)
-- Products never ordered.
-- Orders with items and total quantity per order
-- Customer, product, and order date.
-- Latest order per customer.



--6. GROUPING DATA:

--Orders per country.
--Avg order value per customer.
--Products per category.
--Total quantity sold per product.
--Max order per day.
--Order count per hour.
--Revenue per category.
--Customers per email domain.
--Total revenue per country.
--Items sold per weekday.

--7. SUBQUERIES:

-- Customers with total orders > avg.
-- Products priced above the average price
-- Customer who made the highest total order
-- Names from top 5 most-ordered products.
-- Top customer by number of orders
-- Customers who never ordered.
-- Top 3 categories by product count.
-- Products with above-avg ordered qantity.
-- Find duplicate customer emails.
-- Orders that include cheapest product.

--8. SET OPERATORS:

-- Customers from UK or USA
-- Products not yet ordered
-- Orders in Jan and Feb
-- Electronics but not Sports (EXCEPT)
-- Combine 2 product lists

--9. COMMON TABLE EXPRESSIONS (CTE):

--Use CTE to get order totals per customer.
--CTE to find top 3 countries by revenue.
--Recursive CTE to simulate category hierarchy.
--CTE to rank products by revenue.
--CTE with window function to get last order per customer.

--10. MODIFYING DATA:

--Update customer name.
--Change product price.
--Add new product.
--Delete order item.
--Increase price by 10% for Electronics.

--11. CONSTRAINTS:

--Add NOT NULL to column.
--Add CHECK for price > 0.
--Add UNIQUE on email.
--Add FOREIGN KEY constraint.
--Add DEFAULT country = 'USA'.

--12. EXPRESSIONS:

-- Use CASE to tag high/low order value.
-- Extract domain from email.
-- Calculate total_price = unit_price * quantity.
-- Format order_date to month-year.
-- Use IF/CASE to label customer tiers.

--13. FINDING & REMOVING DUPLICATES:

--Find duplicate customer emails.
--Remove duplicate customers
-- Find repeated product names.
-- Get duplicate orders by customer/date.
-- Delete all but one duplicate entry.

--14. VIEWS:

-- Create view for high-value customers.
-- View for top-selling products.
-- View of orders per day.
-- View of customer order history.
-- View for revenue by country.

--15. INDEXES & STORED PROCEDURES:

--Create index on customer_id.
--Drop index.
--Create stored procedure for inserting new product.
--Stored procedure for total order summary.
--Stored proc to get customer details by ID.

--16. Window Functions:

--Rank products by total revenue.
--Running total of daily revenue.
--Find previous order date for each customer.
--Get customer order count and rank.
--Get dense_rank of products within categories.

