-- Customer Churn Analysis
-- SQLite queries from notebook analysis

-- Churn rate by contract type
SELECT Contract,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate_pct
FROM customers
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

----------------------------------------------------------------------

-- Query 02
-- Query 02: Churn rate by PaymentMethod
SELECT PaymentMethod,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(100.0 * SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate_pct
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;

----------------------------------------------------------------------

-- Query 03
-- Query 04: churn by tenure (trend)
SELECT tenure,
       ROUND(100.0 * SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate_pct,
       LAG(ROUND(100.0 * SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) / COUNT(*),2)) OVER (ORDER BY tenure) AS prev_churn
FROM customers
GROUP BY tenure
ORDER BY tenure;

----------------------------------------------------------------------

