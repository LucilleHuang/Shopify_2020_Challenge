/*Question 2: For this question you’ll need to use SQL. Follow this link to access the data set required for the challenge. Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.*/

/*a.How many orders were shipped by Speedy Express in total?*/

/* Query: */
SELECT COUNT(OrderID) AS countOrder 
FROM Orders
WHERE ShipperID==1
/* Answer: 54 */

/*I would have prefered to create temporary tables when solving b and c to reduce the size of the tables being joined because joining is expansive.
It seems that unlike in Google Big Query, the SQL format here does not allow the query to run in one go if I create Tables. And Tables actually get added to the Database, 
which seems undesirable. Therefore, I decided to smash everything into one query.

I would normally keep more columns just to double-check the results. With the assumption that the questions are asking for only the answer being return, 
I decided to go with the following approaches. */

/* b.What is the last name of the employee with the most orders? */

/* Query: */
SELECT COUNT(OrderID) AS countOrder
      ,Orders.EmployeeID
      ,Lastname
FROM Orders
JOIN Employees ON Orders.EmployeeID == Employees.EmployeeID
GROUP BY Orders.EmployeeID
ORDER BY countOrder DESC
LIMIT 1
/* Answer: Peacock */

/* c.What product was ordered the most by customers in Germany? */

/* Query: */
SELECT ProductName
FROM OrderDetails
JOIN Orders ON Orders.OrderID == OrderDetails.OrderID
JOIN Customers ON Orders.CustomerID == Customers.CustomerID
JOIN Products ON Products.ProductID == OrderDetails.ProductID
WHERE Country == 'Germany'
GROUP BY OrderDetails.ProductID
ORDER BY SUM(Quantity) DESC
LIMIT 1
/* Answer: Boston Crab Meat */