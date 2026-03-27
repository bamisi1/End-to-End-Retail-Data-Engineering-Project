
--create_reporting_view for BI tools to query


CREATE OR REPLACE VIEW retail.vw_sales_analytics AS

SELECT

    -- Transaction identifier
    fs.invoice_no,

    -- Dimension attributes
    dc.customer_id,
    dp.stockcode,
    dp.description AS product_description,
    dco.country,

    dd.invoice_date,
    dd.year,
    dd.month,
    dd.day,

    -- Measures
    fs.quantity,
    fs.unit_price,
    fs.revenue

FROM retail.fact_sales fs

JOIN retail.dim_customer dc
ON fs.customer_key = dc.customer_key

JOIN retail.dim_product dp
ON fs.product_key = dp.product_key

JOIN retail.dim_country dco
ON fs.country_key = dco.country_key

JOIN retail.dim_date dd
ON fs.date_key = dd.date_key;
