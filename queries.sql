-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName,
       CategoryName
  FROM Product
       JOIN
       Category ON Product.CategoryId = Category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT Id,
       ShipVia
  FROM [Order]
       JOIN
       Shipper ON [Order].ShipVia = Shipper.Id
 WHERE [Order].OrderDate < '2012-08-09';


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName,
       o.Quantity
  FROM ProductDetails_V AS p
       JOIN
       OrderDetail AS o
 WHERE o.ProductId = p.Id AND 
       o.OrderId = 10251
 ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id AS [Order Id],
       c.CompanyName AS [Customer's Company],
       e.LastName AS [Employee's Last Name]
  FROM [Order] AS o
       JOIN
       Customer AS C,
       Employee AS e
 WHERE c.id = o.CustomerId AND 
       o.EmployeeId = e.Id;
