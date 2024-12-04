## products with highest orders##
select ProductName, sum(quantity) as Products_Sold
from products p
inner join order_details o on p.ProductID = o.ProductID
group by ProductName
order by Products_Sold desc;

##top 10 customers with most orders
select CustomerName, count(OrderID) as Orders_Made
from customers
inner join orders on customers.CustomerID = orders.CustomerID
group by CustomerName
order by Orders_Made desc
limit 10;

##top 10 customers with highest total sales##
select CustomerName, sum(Price * Quantity) as Total_Sales
from customers
inner join orders on customers.CustomerID = orders.CustomerID
inner join order_details on orders.OrderID = order_details.OrderID
inner join products on order_details.ProductID = products.ProductID
group by CustomerName
order by Total_Sales desc
limit 10;

##number of products in each category##
select CategoryName, count(ProductID) as Number_Of_Products
from categories
inner join products on categories.CategoryID = products.CategoryID
group by CategoryName
order by Number_Of_Products desc;

##total sales per product##
select ProductName, sum(Price * Quantity) as Total_Sales
from products
inner join order_details on products.ProductID = order_details.ProductID
group by ProductName
order by Total_Sales desc;
