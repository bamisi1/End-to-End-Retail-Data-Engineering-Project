
--Data quality validation checks for warehouse
-- These checks ensure the ETL pipeline produced
-- consistent and reliable data.

-- 1. ROW COUNT CHECK
-- Fact table should match staging table

SELECT
    (SELECT COUNT(*) FROM retail.sales_raw) AS staging_rows,
    (SELECT COUNT(*) FROM retail.fact_sales) AS fact_rows;

-- 2. CHECK FOR NULL FOREIGN KEYS IN FACT TABLE
-- Fact table should not contain NULL dimension keys

SELECT *
FROM retail.fact_sales
WHERE customer_key IS NULL
   OR product_key IS NULL
   OR country_key IS NULL
   OR date_key IS NULL;

-- 3. CHECK DUPLICATE BUSINESS KEYS IN DIMENSIONS
-- These should return ZERO rows

-- Customer duplicates
SELECT customer_id, COUNT(*)
FROM retail.dim_customer
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Product duplicates
SELECT stockcode, COUNT(*)
FROM retail.dim_product
GROUP BY stockcode
HAVING COUNT(*) > 1;

-- Country duplicates
SELECT country, COUNT(*)
FROM retail.dim_country
GROUP BY country
HAVING COUNT(*) > 1;

-- Date duplicates
SELECT invoice_date, COUNT(*)
FROM retail.dim_date
GROUP BY invoice_date
HAVING COUNT(*) > 1;


-- 4. ORPHAN FACT RECORDS
-- Fact rows without matching dimension records

SELECT *
FROM retail.fact_sales fs
LEFT JOIN retail.dim_customer dc
ON fs.customer_key = dc.customer_key
WHERE dc.customer_key IS NULL;

SELECT *
FROM retail.fact_sales fs
LEFT JOIN retail.dim_product dp
ON fs.product_key = dp.product_key
WHERE dp.product_key IS NULL;

SELECT *
FROM retail.fact_sales fs
LEFT JOIN retail.dim_country dco
ON fs.country_key = dco.country_key
WHERE dco.country_key IS NULL;

SELECT *
FROM retail.fact_sales fs
LEFT JOIN retail.dim_date dd
ON fs.date_key = dd.date_key
WHERE dd.date_key IS NULL;


-- 5. BASIC DATA SANITY CHECKS
-- Look for invalid business values

-- Negative or zero quantities
SELECT *
FROM retail.fact_sales
WHERE quantity <= 0;

-- Negative prices
SELECT *
FROM retail.fact_sales
WHERE unit_price < 0;

-- Negative revenue
SELECT *
FROM retail.fact_sales
WHERE revenue < 0;



-- END OF DATA QUALITY CHECKS
