USE ecommerce;

-- 1. SELECT
SELECT item_id, item_title, item_subtitle
FROM item;

-- 2. WHERE
SELECT item_id, item_title
FROM item
WHERE item_title LIKE '%Laptop%';

-- 3. ORDER BY
SELECT transaction_id, account_id, amount
FROM transaction
ORDER BY amount DESC;

-- 4. Aggregate functions
SELECT
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_transaction,
    COUNT(transaction_id) AS total_transactions
FROM transaction;

-- 5. GROUP BY
SELECT
    account_id,
    SUM(amount) AS total_revenue
FROM transaction
GROUP BY account_id
ORDER BY total_revenue DESC;

-- 6. HAVING
SELECT
    account_id,
    SUM(amount) AS total_revenue
FROM transaction
GROUP BY account_id
HAVING SUM(amount) > 900
ORDER BY total_revenue DESC;

-- 7. INNER JOIN
SELECT
    item.item_id,
    item.item_title,
    transaction_item.transaction_id
FROM item
INNER JOIN transaction_item
    ON item.item_id = transaction_item.item_id;

-- 8. LEFT JOIN
SELECT
    account.account_number,
    account_revenue.total_revenue
FROM account
LEFT JOIN account_revenue
    ON account.account_id = account_revenue.account_id;

-- 9. Subquery: transactions above average
SELECT
    transaction_id,
    amount
FROM transaction
WHERE amount > (
    SELECT AVG(amount)
    FROM transaction
);

-- 10. View
CREATE OR REPLACE VIEW account_revenue AS
SELECT
    account_id,
    SUM(amount) AS total_revenue
FROM transaction
GROUP BY account_id;

-- 11. View + JOIN
SELECT
    account.account_number,
    account_revenue.total_revenue
FROM account_revenue
INNER JOIN account
    ON account_revenue.account_id = account.account_id;

-- 12. Customer ranking
SELECT
    account.account_number,
    account_revenue.total_revenue,
    RANK() OVER (
        ORDER BY account_revenue.total_revenue DESC
    ) AS revenue_rank
FROM account_revenue
INNER JOIN account
    ON account_revenue.account_id = account.account_id;

-- 13. Customer segmentation
SELECT
    account.account_number,
    account_revenue.total_revenue,
    CASE
        WHEN account_revenue.total_revenue >= 1000 THEN 'High Value'
        WHEN account_revenue.total_revenue >= 700 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM account_revenue
INNER JOIN account
    ON account_revenue.account_id = account.account_id;

-- 14. COALESCE / NULL handling
SELECT
    account.account_number,
    COALESCE(account_revenue.total_revenue, 0) AS total_revenue
FROM account
LEFT JOIN account_revenue
    ON account.account_id = account_revenue.account_id;

-- 15. EXPLAIN / query optimization
EXPLAIN
SELECT *
FROM transaction
WHERE account_id = 1003;

-- 16. Final business analysis
SELECT
    account.account_number,
    SUM(transaction.amount) AS total_revenue
FROM account
INNER JOIN transaction
    ON account.account_id = transaction.account_id
GROUP BY account.account_id, account.account_number
HAVING SUM(transaction.amount) > 900
ORDER BY total_revenue DESC;