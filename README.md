# Task 3 – SQL for Data Analysis

## Objective

The objective of this task was to use SQL queries to extract and analyze data from an e-commerce database using MySQL.

## Tools Used

- MySQL 8.0
- MySQL Command Line Client
- GitHub

## Database

An e-commerce database was used for this task. It contains tables related to accounts, transactions, products, categories, contacts, and other supporting information.

The database was populated with synthetic sample data for the analysis.

## SQL Concepts Covered

- SELECT
- WHERE
- LIKE
- ORDER BY
- Aggregate Functions (SUM, AVG, COUNT)
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- Subqueries
- Views
- COALESCE
- CASE
- RANK()
- ROW_NUMBER()
- EXPLAIN
- Index-based Query Optimization

## Analysis Performed

The SQL queries were used to:

- Filter products and transactions
- Calculate total and average revenue
- Analyze revenue by account
- Identify high-revenue accounts
- Join data from related tables
- Create a reusable account revenue view
- Rank accounts based on revenue
- Segment accounts based on revenue
- Handle NULL values
- Examine query execution using EXPLAIN
- Identify accounts generating more than a specified revenue amount

## Repository Contents

```text
Task-3-SQL-Data-Analysis/
│
├── Task_3_SQL_Data_Analysis.sql
├── README.md
│
└── screenshots/
    ├── 01_database_tables.png
    ├── 02_product_filter.png
    ├── 03_revenue_by_account.png
    ├── 04_having_analysis.png
    ├── 05_account_revenue_view.png
    ├── 06_customer_ranking.png
    ├── 07_customer_segmentation.png
    └── 08_explain_optimization.png
