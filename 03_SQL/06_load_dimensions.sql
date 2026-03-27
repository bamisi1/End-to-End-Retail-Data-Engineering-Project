INSERT INTO retail.dim_customer (customer_id)
SELECT DISTINCT CAST(customerid AS INT)
FROM retail.sales_raw
WHERE customerid IS NOT NULL;

INSERT INTO retail.dim_product (stockcode, description)
SELECT
    stockcode,
    MIN(description) AS description
FROM retail.sales_raw
GROUP BY stockcode;

INSERT INTO retail.dim_country (country)
SELECT DISTINCT country
FROM retail.sales_raw;

INSERT INTO retail.dim_date (invoice_date, year, month, day)
SELECT DISTINCT
    DATE(CAST(invoicedate AS TIMESTAMP)),
    EXTRACT(YEAR FROM CAST(invoicedate AS TIMESTAMP)),
    EXTRACT(MONTH FROM CAST(invoicedate AS TIMESTAMP)),
    EXTRACT(DAY FROM CAST(invoicedate AS TIMESTAMP))
FROM retail.sales_raw;