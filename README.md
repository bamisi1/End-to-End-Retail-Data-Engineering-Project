# End-to-End Retail Data Engineering & Analytics Pipeline

## Overview

This project demonstrates a **production-style end-to-end data
engineering pipeline** that ingests raw retail transaction data,
processes it through a structured data lake workflow, loads it into a
**PostgreSQL dimensional data warehouse**, and exposes a curated
analytics layer for **Power BI dashboards**.

The goal of the project is to simulate **real enterprise data
workflows** used by modern data teams, including ingestion pipelines,
transformation layers, warehouse modeling, data quality validation, and
business intelligence reporting.

The architecture follows a **layered data platform design**:

Raw Data → Data Lake → Python ETL Pipelines → PostgreSQL Data Warehouse
→ Reporting View → Power BI Analytics

------------------------------------------------------------------------

# Architecture

Retail Data Engineering Pipeline

Raw Source Data\
↓\
Data Lake\
Raw Data\
Processed Data

↓

Python ETL Pipelines\
ingest_data.py\
transform_data.py\
load_to_postgres.py

↓

PostgreSQL Data Warehouse

Dimensions\
- dim_customer\
- dim_product\
- dim_country\
- dim_date

Fact Table\
- fact_sales

↓

Analytics Layer\
vw_sales_analytics (Reporting View)

↓

Power BI Dashboard

------------------------------------------------------------------------

# Technology Stack

  Layer                 Technology
  --------------------- ------------------------------------
  Data Processing       Python
  Data Storage          PostgreSQL
  Data Modeling         Dimensional Modeling (Star Schema)
  Data Transformation   SQL
  Data Visualization    Power BI
  Version Control       Git / GitHub

------------------------------------------------------------------------

# Data Lake Layer

The pipeline begins with a **data lake structure** that separates raw
and processed datasets.

Data Lake - Raw_Data - Processed_Data

### Raw Data

Contains the original retail transaction files in their unmodified
state.

### Processed Data

Contains cleaned and standardized datasets produced by the
transformation pipeline.

Typical operations include: - Data type normalization - Missing value
handling - Field standardization - Removal of corrupted records

------------------------------------------------------------------------

# Python ETL Pipelines

## ingest_data.py

Reads raw retail transaction files and loads them into the **Raw Data
layer**.

## transform_data.py

Cleans and standardizes the raw dataset and prepares it for warehouse
loading.

## load_to_postgres.py

Loads the processed dataset into **PostgreSQL staging tables**.

------------------------------------------------------------------------

# Data Warehouse Design

The warehouse follows **Kimball dimensional modeling principles** using
a **star schema**.

## Fact Table

fact_sales

Measures: - quantity - unit_price - revenue

## Dimension Tables

dim_customer -- customer identifiers\
dim_product -- product metadata\
dim_country -- geographic attributes\
dim_date -- calendar dimension for time intelligence

------------------------------------------------------------------------

# SQL Data Warehouse Structure

01_create_schema.sql\
02_create_tables.sql\
03_create_dimensions.sql\
04_create_facts.sql\
05_add_constraints.sql\
06_load_dimensions.sql\
07_load_fact.sql\
08_create_indexes.sql\
09_create_reporting_view.sql\
10_data_quality_checks.sql

------------------------------------------------------------------------

# Constraints & Data Integrity

The warehouse enforces:

-   Primary keys
-   Foreign keys
-   Unique business keys

Example controls:

-   Unique customer identifiers
-   Unique product stock codes
-   Unique country names
-   Unique calendar dates

These safeguards maintain **referential integrity and prevent duplicate
records**.

------------------------------------------------------------------------

# Performance Optimization

Indexes were created on:

-   foreign keys
-   business keys
-   join columns

This improves performance for joins, analytical queries, and Power BI
dashboard refresh.

------------------------------------------------------------------------

# Reporting Layer

The analytics layer exposes a curated reporting view:

vw_sales_analytics

The view joins:

-   fact_sales
-   dim_customer
-   dim_product
-   dim_country
-   dim_date

Power BI connects **only to this view**, preserving warehouse governance
and preventing direct querying of warehouse tables.

------------------------------------------------------------------------

# Data Quality Validation

Data quality checks are implemented through:

10_data_quality_checks.sql

These checks validate:

-   row counts
-   duplicate records
-   dimension uniqueness
-   referential integrity

------------------------------------------------------------------------

# Power BI Analytics

The Power BI dashboard provides insights including:

Sales Performance - Total Revenue - Total Orders - Average Order Value

Time Intelligence - Daily sales trends - Monthly revenue trends -
Month‑over‑Month growth

Geographic Insights - Revenue by country - Regional comparisons

Product Analysis - Top selling products - Product revenue contribution

------------------------------------------------------------------------

# Skills Demonstrated

-   Data Engineering
-   Python ETL Development
-   Dimensional Data Modeling
-   SQL Data Warehousing
-   Data Quality Validation
-   Query Performance Optimization
-   Business Intelligence Development

------------------------------------------------------------------------

# Author

**Amisi Nyakeri**\
Data Analyst \| BI Developer \| Data Engineering Enthusiast

This project demonstrates the design and implementation of a
**production-style data engineering and analytics pipeline**.
