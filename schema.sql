-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    aisle_id INT,
    department_id INT
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    eval_set VARCHAR(50),
    order_number INT,
    order_dow INT,
    order_hour_of_day INT,
    days_since_prior_order DECIMAL
);

-- Order_Items (Bridge) Table
-- ~32 million rows
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT,
    PRIMARY KEY (order_id, product_id)
);

-- Load Products (~50,000 rows)
COPY products FROM 'C:\quick-com-data\data\products.csv' DELIMITER ',' CSV HEADER;

-- Load Orders (~3.4 million rows)
COPY orders FROM 'C:\quick-com-data\data\orders.csv' DELIMITER ',' CSV HEADER;

-- Load Order Items (~32 million rows)
COPY order_items FROM 'C:\quick-com-data\data\order_products__prior.csv' DELIMITER ',' CSV HEADER;