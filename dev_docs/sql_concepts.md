# SQL Concepts Guide

Advanced SQL techniques used in Customer Churn Analysis: CTEs, window functions, and business queries.

## Table of Contents

1. [Common Table Expressions (CTEs)](#common-table-expressions-ctes)
2. [Window Functions](#window-functions)
3. [Multi-Dimensional Aggregations](#multi-dimensional-aggregations)
4. [Project Queries Explained](#project-queries-explained)

## Common Table Expressions (CTEs)

### What Are CTEs?

Temporary result sets that exist only for the duration of a query. Like variables in programming.

**Basic Syntax:**
```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
```

### Why Use CTEs?

✅ **Readability** - Break complex queries into logical steps  
✅ **Maintainability** - Easier to debug and modify  
✅ **Reusability** - Reference same subquery multiple times  

### Example: High-Risk Segment

```sql
WITH high_risk_segment AS (
    SELECT 
        customerID,
        tenure,
        Contract,
        MonthlyCharges,
        -- Risk scoring
        CASE WHEN Contract = 'Month-to-month' THEN 3 ELSE 0 END +
        CASE WHEN PaymentMethod = 'Electronic check' THEN 2 ELSE 0 END +
        CASE WHEN tenure < 12 THEN 2 ELSE 0 END AS risk_score
    FROM customers
)
SELECT 
    COUNT(*) as high_risk_customers,
    SUM(MonthlyCharges) as monthly_revenue_at_risk
FROM high_risk_segment
WHERE risk_score >= 6;
```

**Result:** 866 high-risk customers, $61,644 monthly revenue at risk

## Window Functions

### What Are Window Functions?

Functions that perform calculations across rows related to the current row, WITHOUT collapsing rows like GROUP BY.

**Key Difference:**

**GROUP BY (aggregates, collapses rows):**
```sql
SELECT Contract, COUNT(*) as total
FROM customers
GROUP BY Contract;
-- Result: 3 rows
```

**Window Function (preserves all rows):**
```sql
SELECT 
    customerID,
    Contract,
    COUNT(*) OVER (PARTITION BY Contract) as customers_in_contract
FROM customers;
-- Result: 7,032 rows
```

### LAG() - Period-Over-Period Analysis

**Purpose:** Get previous row's value for comparison

**Syntax:**
```sql
LAG(column, offset, default) OVER (ORDER BY ...)
```

**Example: Churn Trend by Tenure**

```sql
SELECT 
    tenure,
    COUNT(*) as total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) as churned,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate,
    LAG(ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2)) 
        OVER (ORDER BY tenure) as prev_month_churn_rate
FROM customers
GROUP BY tenure
ORDER BY tenure;
```

**Insight:** Churn drops from 61.99% (month 1) to 51.68% (month 2) - a 10.31 percentage point improvement.

### ROW_NUMBER() - Ranking

**Purpose:** Assign unique numbers to rows

**Example: Top 10 High-Value Churned Customers**

```sql
SELECT 
    customerID,
    tenure,
    TotalCharges,
    ROW_NUMBER() OVER (ORDER BY TotalCharges DESC) as ltv_rank
FROM customers
WHERE Churn = 'Yes'
ORDER BY TotalCharges DESC
LIMIT 10;
```

### SUM() OVER() - Running Totals

**Purpose:** Calculate cumulative sums without GROUP BY

**Example: Cumulative Churn**

```sql
SELECT 
    tenure,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) as churned_this_month,
    SUM(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)) 
        OVER (ORDER BY tenure) as cumulative_churned
FROM customers
GROUP BY tenure
ORDER BY tenure;
```

**Insight:** 55% of all churn happens in first 12 months.

## Multi-Dimensional Aggregations

### Grouping by Multiple Columns

**Example: Revenue at Risk by Contract AND Payment Method**

```sql
SELECT 
    Contract,
    PaymentMethod,
    COUNT(*) as at_risk_customers,
    SUM(MonthlyCharges) as monthly_revenue_lost,
    SUM(MonthlyCharges * 12) as annualized_revenue_lost
FROM customers
WHERE Churn = 'Yes'
GROUP BY Contract, PaymentMethod
ORDER BY monthly_revenue_lost DESC;
```

**Insight:** Month-to-month + Electronic check = $77K monthly loss (biggest risk segment).

## Project Queries Explained

### Query 1: Churn by Contract Type

**Skills:** GROUP BY, CASE, aggregations

```sql
SELECT 
    Contract,
    COUNT(*) as total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) as churned,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate_pct
FROM customers
GROUP BY Contract
ORDER BY churn_rate_pct DESC;
```

**Result:** Month-to-month = 42.71% churn vs 2.83% for 2-year contracts

### Query 4: Tenure Trend (LAG)

**Skills:** Window functions, LAG, period-over-period

```sql
SELECT 
    tenure,
    COUNT(*) as total,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate,
    LAG(churn_rate) OVER (ORDER BY tenure) as prev_month_rate,
    churn_rate - prev_month_rate as change
FROM customers
GROUP BY tenure;
```

**Business Value:** Shows when churn risk drops dramatically (after month 12).

### Query 6: Running Total

**Skills:** SUM() OVER(), cumulative calculations

```sql
SELECT 
    tenure,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) as churned_this_month,
    SUM(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)) 
        OVER (ORDER BY tenure) as cumulative_churn
FROM customers
GROUP BY tenure;
```

**Business Value:** Identifies critical retention window (first 12 months = 55% of churn).

### Query 7: High-Risk Segment (CTE)

**Skills:** CTE, risk scoring, multi-factor analysis

```sql
WITH high_risk_segment AS (
    SELECT 
        customerID,
        tenure,
        MonthlyCharges,
        CASE WHEN Contract = 'Month-to-month' THEN 3 ELSE 0 END +
        CASE WHEN PaymentMethod = 'Electronic check' THEN 2 ELSE 0 END +
        CASE WHEN tenure < 12 THEN 2 ELSE 0 END AS risk_score
    FROM customers
)
SELECT 
    COUNT(*) as high_risk_customers,
    SUM(MonthlyCharges * 12) as annual_revenue_at_risk
FROM high_risk_segment
WHERE risk_score >= 6;
```

**Business Value:** Identifies 866 customers worth $740K annually for targeted retention.

## SQL Best Practices

### 1. Use Meaningful Aliases

```sql
-- Good
SELECT Contract, COUNT(*) as total_customers
FROM customers
GROUP BY Contract;

-- Bad
SELECT c, COUNT(*) as t
FROM customers
GROUP BY c;
```

### 2. Comment Your Code

```sql
-- ============================================
-- QUERY 1: Churn Rate by Contract Type
-- Business Question: Which contracts churn most?
-- ============================================
SELECT ...
```

### 3. Use ROUND() for Percentages

```sql
ROUND(100.0 * churned / total, 2) as churn_rate_pct
-- Use 100.0 (not 100) for float division
```

### 4. Handle Division by Zero

```sql
ROUND(100.0 * churned / NULLIF(total, 0), 2) as churn_rate_pct
-- Returns NULL instead of error if total=0
```

## Key Takeaways

### Skills Demonstrated

✅ **CTEs** - Multi-step analysis, risk scoring  
✅ **Window Functions** - LAG, ROW_NUMBER, SUM OVER  
✅ **Multi-dimensional aggregations** - GROUP BY multiple columns  
✅ **Business SQL** - Revenue calculations, percentage formulas  

### Interview Talking Points

**Q: "What SQL skills do you have?"**

**A:** "I'm proficient in advanced SQL including CTEs for complex logic, window functions like LAG for trend analysis, and multi-dimensional aggregations. For example, I used LAG to track month-over-month churn rate changes and identified that churn drops 10 percentage points from month 1 to month 2, indicating successful onboarding."

**Q: "Explain a complex SQL query."**

**A:** "Query 7 uses a CTE to create a risk score combining 5 factors: contract type, payment method, tenure, and service add-ons. Each factor has a weight (0-3 points). The main query then aggregates customers with score ≥6, revealing 866 high-risk customers representing $740K in annual revenue—allowing targeted retention efforts."

## Additional Resources

- **SQL Tutorial:** sqlitetutorial.net
- **Window Functions:** mode.com/sql-tutorial/sql-window-functions
- **CTEs Explained:** postgresql.org/docs/current/queries-with.html
