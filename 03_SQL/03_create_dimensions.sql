CREATE TABLE retail.dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id INT UNIQUE
);

CREATE TABLE retail.dim_product (
    product_key SERIAL PRIMARY KEY,
    stockcode TEXT,
    description TEXT
);

CREATE TABLE retail.dim_country (
    country_key SERIAL PRIMARY KEY,
    country TEXT UNIQUE
);

CREATE TABLE retail.dim_date (
    date_key SERIAL PRIMARY KEY,
    invoice_date TIMESTAMP,
    year INT,
    month INT,
    day INT
);