--------------------------------------------------
-- DIMENSION TABLES
--------------------------------------------------

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    month_name VARCHAR(20) NOT NULL
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

--------------------------------------------------
-- FACT TABLE
--------------------------------------------------

CREATE TABLE fact_sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_sales DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

--------------------------------------------------
-- INSERT CLEANED DATA
--------------------------------------------------

-- dim_date (standardized format)
INSERT INTO dim_date VALUES (1, '2024-01-01', 1, 2024, 'January');
INSERT INTO dim_date VALUES (2, '2024-02-01', 2, 2024, 'February');
INSERT INTO dim_date VALUES (3, '2024-03-01', 3, 2024, 'March');

--------------------------------------------------

-- dim_store
INSERT INTO dim_store VALUES (101, 'Store A', 'Mumbai');
INSERT INTO dim_store VALUES (102, 'Store B', 'Delhi');
INSERT INTO dim_store VALUES (103, 'Store C', 'Bangalore');

--------------------------------------------------

-- dim_product (category standardized)
INSERT INTO dim_product VALUES (201, 'Laptop', 'Electronics');
INSERT INTO dim_product VALUES (202, 'T-Shirt', 'Clothing');
INSERT INTO dim_product VALUES (203, 'Milk', 'Groceries');

--------------------------------------------------

-- fact_sales (at least 10 rows, cleaned values)
INSERT INTO fact_sales 
(date_id, store_id, product_id, quantity, unit_price, total_sales) VALUES
(1, 101, 201, 1, 50000, 50000),
(2, 101, 202, 3, 1000, 3000),
(3, 102, 203, 5, 60, 300),
(1, 102, 201, 2, 50000, 100000),
(2, 103, 202, 4, 1200, 4800),
(3, 103, 203, 10, 55, 550),
(1, 101, 203, 6, 50, 300),
(2, 102, 202, 2, 1100, 2200),
(3, 101, 201, 1, 52000, 52000),
(1, 103, 203, 8, 60, 480);