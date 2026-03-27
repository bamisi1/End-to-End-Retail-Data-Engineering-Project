
-- FACT TABLE

CREATE TABLE retail.fact_sales (

    sales_key SERIAL PRIMARY KEY,

    -- Degenerate dimension
    invoice_no TEXT,

    -- Foreign keys to dimensions
    customer_key INT,
    product_key INT,
    country_key INT,
    date_key INT,

    -- Measures
    quantity INT,
    unit_price NUMERIC,
    revenue NUMERIC,

    -- Foreign key constraints
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_key)
        REFERENCES retail.dim_customer(customer_key),

    CONSTRAINT fk_product
        FOREIGN KEY (product_key)
        REFERENCES retail.dim_product(product_key),

    CONSTRAINT fk_country
        FOREIGN KEY (country_key)
        REFERENCES retail.dim_country(country_key),

    CONSTRAINT fk_date
        FOREIGN KEY (date_key)
        REFERENCES retail.dim_date(date_key)

);

