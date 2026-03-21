-- Customers Table
CREATE TABLE Customers (
    cuordersPRIMARYstomer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    customer_city VARCHAR(100) NOT NULL
);

--------------------------------------------------

-- Products Table
CREATE TABLE Products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

--------------------------------------------------

-- Sales Representatives Table
CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(50) PRIMARY KEY,
    sales_rep_name VARCHAR(255) NOT NULL,
    sales_rep_email VARCHAR(255) NOT NULL,
    office_address VARCHAR(255) NOT NULL
);

--------------------------------------------------

-- Orders Table
CREATE TABLE Orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    sales_rep_id VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT FK_Orders_SalesReps FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

--------------------------------------------------

-- Order Items Table
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--------------------------------------------------
-- INSERT DATA
--------------------------------------------------

-- Customers
INSERT INTO Customers VALUES ('C101', 'Rahul Sharma', 'rahul@email.com', 'Mumbai');
INSERT INTO Customers VALUES ('C102', 'Anita Verma', 'anita@email.com', 'Delhi');
INSERT INTO Customers VALUES ('C103', 'Kiran Rao', 'kiran@email.com', 'Mumbai');
INSERT INTO Customers VALUES ('C104', 'Amit Singh', 'amit@email.com', 'Bangalore');
INSERT INTO Customers VALUES ('C105', 'Neha Jain', 'neha@email.com', 'Chennai');

--------------------------------------------------

-- Products
INSERT INTO Products VALUES ('P101', 'Laptop', 'Electronics', 50000.00);
INSERT INTO Products VALUES ('P102', 'Phone', 'Electronics', 20000.00);
INSERT INTO Products VALUES ('P103', 'Headphones', 'Accessories', 2000.00);
INSERT INTO Products VALUES ('P104', 'Keyboard', 'Accessories', 1500.00);
INSERT INTO Products VALUES ('P105', 'Mouse', 'Accessories', 800.00);

--------------------------------------------------

-- SalesReps
INSERT INTO SalesReps VALUES ('S101', 'Raj Mehta', 'raj@email.com', 'Mumbai HQ');
INSERT INTO SalesReps VALUES ('S102', 'Priya Shah', 'priya@email.com', 'Delhi Office');
INSERT INTO SalesReps VALUES ('S103', 'Arjun Patel', 'arjun@email.com', 'Mumbai HQ');
INSERT INTO SalesReps VALUES ('S104', 'Sneha Kapoor', 'sneha@email.com', 'Bangalore Office');
INSERT INTO SalesReps VALUES ('S105', 'Vikram Rao', 'vikram@email.com', 'Chennai Office');

--------------------------------------------------

-- Orders
INSERT INTO Orders VALUES ('ORD1001', 'C101', 'S101', '2024-01-01');
INSERT INTO Orders VALUES ('ORD1002', 'C102', 'S102', '2024-01-02');
INSERT INTO Orders VALUES ('ORD1003', 'C103', 'S101', '2024-01-03');
INSERT INTO Orders VALUES ('ORD1004', 'C104', 'S104', '2024-01-04');
INSERT INTO Orders VALUES ('ORD1005', 'C105', 'S105', '2024-01-05');

--------------------------------------------------

-- Order Items
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES ('ORD1001', 'P101', 1);
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES ('ORD1001', 'P103', 2);
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES ('ORD1002', 'P102', 1);
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES ('ORD1003', 'P104', 3);
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES ('ORD1004', 'P105', 5);