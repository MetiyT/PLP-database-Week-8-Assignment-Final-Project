-- Create the database
CREATE DATABASE IF NOT EXISTS ECommerceDB;
USE ECommerceDB;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderDetails table (Many-to-Many relationship between Orders and Products)
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Sample data for testing
INSERT INTO Customers (FirstName, LastName, Email, JoinDate) VALUES
('Alice', 'Smith', 'alice@example.com', '2025-01-10'),
('Bob', 'Johnson', 'bob@example.com', '2025-02-15');

INSERT INTO Products (ProductName, Description, Price, StockQuantity) VALUES
('Laptop', '14-inch laptop, 8GB RAM, 256GB SSD', 800.00, 10),
('Smartphone', 'Android phone, 6GB RAM, 128GB Storage', 500.00, 20),
('Headphones', 'Wireless headphones', 50.00, 30);

INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2025-09-20', 'Pending'),
(2, '2025-09-21', 'Shipped');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 800.00),
(1, 3, 2, 100.00),
(2, 2, 1, 500.00);
