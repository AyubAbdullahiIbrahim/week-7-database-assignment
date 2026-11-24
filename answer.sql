SHOW DATABASES;

CREATE DATABASE week7_normalization;
USE week7_normalization;
SHOW TABLES;
CREATE TABLE ProductDetail (
    OrderID INT,
    Products VARCHAR(255)
);
SHOW TABLES;
INSERT INTO ProductDetail (OrderID, Products)
VALUES
(101, 'Laptop, Mouse'),
(102, 'Tablet, Keyboard, Mouse'),
(103, 'Phone, Charger');

SELECT * FROM ProductDetail;

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

INSERT INTO ProductDetail_1NF (OrderID, Product)
VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone'),
(103, 'Charger');

SELECT * FROM ProductDetail_1NF;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');
SELECT * FROM Orders;

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
SELECT * FROM OrderItems;

SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
INNER JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID;