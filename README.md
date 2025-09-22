# PLP-database-Week-8-Assignment-Final-Project
# E-Commerce Store Database

## Project Overview
This project is a simple relational database designed for an online store. It manages **customers, products, orders, and order details**. The database allows storing customer information, tracking orders, and handling product inventory.

## Database Name
`ECommerceDB`

## Tables and Relationships

1. **Customers**  
   - Stores customer information (First Name, Last Name, Email, Join Date)  
   - `CustomerID` is the primary key  

2. **Products**  
   - Stores product details (Product Name, Description, Price, Stock Quantity)  
   - `ProductID` is the primary key  

3. **Orders**  
   - Tracks orders made by customers  
   - `OrderID` is the primary key  
   - `CustomerID` is a foreign key referencing `Customers.CustomerID`  

4. **OrderDetails**  
   - Connects orders and products (many-to-many relationship)  
   - `OrderDetailID` is the primary key  
   - `OrderID` is a foreign key referencing `Orders.OrderID`  
   - `ProductID` is a foreign key referencing `Products.ProductID`  

## Features
- Properly structured tables with primary and foreign key constraints  
- Relationships: One-to-Many (Customers → Orders, Orders → OrderDetails)  
- Constraints: `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, `FOREIGN KEY`  
- Sample data included for testing  
