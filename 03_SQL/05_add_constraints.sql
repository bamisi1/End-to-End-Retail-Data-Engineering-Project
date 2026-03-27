-- Prevent duplicate business keys in dimension tables

ALTER TABLE retail.dim_customer
ADD CONSTRAINT uq_dim_customer_customer_id
UNIQUE (customer_id);

ALTER TABLE retail.dim_product
ADD CONSTRAINT uq_dim_product_stockcode
UNIQUE (stockcode);

ALTER TABLE retail.dim_country
ADD CONSTRAINT uq_dim_country_country
UNIQUE (country);

ALTER TABLE retail.dim_date
ADD CONSTRAINT uq_dim_date_invoice_date
UNIQUE (invoice_date);