-- 1/Display all the data of customers .
SELECT *
FROM Customers;

--2/Display the product_name and category for products which their price is between 5000 and 10000    .
SELECT product_name,
    category
FROM Product
WHERE (
        Price BETWEEN 5000 AND 10000
    );

--3/Display all the data of products sorted in descending order of price.
SELECT *
FROM Product
ORDER BY Price DESC;

--4/Display the total number of orders, the average amount, the highest total amount and the lower total amountFor each product_id, 
SELECT COUNT(*),
    AVG (total_amount),
    MAX(total_amount),
    MIN(total_amount),
    Product_id
FROM Orders
GROUP BY Product_id;
---display the number of orders.
SELECT COUNT(*)
FROM Orders;

--5/Display the customer_id which has more than 2 orders   .
SELECT COUNT(*),
    Customer_id
FROM Orders
GROUP BY Customer_id
HAVING COUNT(*) >= 2;

--6/For each month of the 2020 year, display the number of orders..
SELECT COUNT(*),
    MONTH(OrderDate)
FROM Orders
GROUP BY MONTH(OrderDate);

--7/For each order, display the product_name, the customer_name and the date of the order
SELECT product_name,
    customer_name,
    OrderDate
FROM Orders
    INNER JOIN (
        Product ON Product.Product_id = Orders.Product_id,
        Customer ON Customer.Customer_id = Orders.Customer_id
    );

--8/Display all the orders made three months ago .....
SELECT *
FROM Orders
WHERE OrderDate >= DATEADD(MONTH, 3, NOW());

--9/Display customers (customer_id) who have never ordered a product
SELECT *
FROM Customer
    INNER JOIN (
        Orders ON Orders.Customer_id <> Customer.Customer_id
    );