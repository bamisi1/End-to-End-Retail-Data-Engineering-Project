
   ---1. INDEXES ON FACT TABLE FOREIGN KEYS
 
 
CREATE INDEX idx_fact_customer
ON retail.fact_sales(customer_key);

CREATE INDEX idx_fact_product
ON retail.fact_sales(product_key);

CREATE INDEX idx_fact_country
ON retail.fact_sales(country_key);

CREATE INDEX idx_fact_date
ON retail.fact_sales(date_key);


 --- 2. INDEXES ON DIMENSION BUSINESS KEYS
   

CREATE INDEX idx_dim_customer_id
ON retail.dim_customer(customer_id);

CREATE INDEX idx_dim_product_stockcode
ON retail.dim_product(stockcode);

CREATE INDEX idx_dim_country_name
ON retail.dim_country(country);

CREATE INDEX idx_dim_date_invoice
ON retail.dim_date(invoice_date);