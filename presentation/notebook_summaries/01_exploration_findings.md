# Data Exploration Findings

## Overview
**Dataset:** Telco Customer Churn - 7,032 customers analyzed  
**Data Quality:** 99.84% complete (11 customers excluded due to missing values)  
**Analysis Period:** Last month churn status

---

## Key Metrics

| Metric | Value |
|--------|-------|
| **Total Customers** | 7,032 |
| **Churned Customers** | 1,869 (26.5%) |
| **Retained Customers** | 5,163 (73.5%) |
| **Average Tenure** | 32 months |
| **Average Monthly Charge** | $64.76 |

---

## Major Findings

### 1. **Contract Type is the Strongest Churn Predictor**
- **Month-to-month contracts:** 42.7% churn rate
- **One-year contracts:** 11.3% churn rate
- **Two-year contracts:** 2.8% churn rate

**Insight:** Customers with flexible contracts are 15x more likely to churn than those with long-term commitments.

### 2. **New Customers are High Risk**
- **First 6 months:** Highest churn concentration
- **Average tenure of churned customers:** 18 months
- **Average tenure of retained customers:** 38 months

**Insight:** Customer onboarding and early engagement is critical for retention.

### 3. **Payment Method Impacts Churn**
- **Electronic check:** 45.3% churn rate
- **Mailed check:** 19.1% churn rate
- **Bank transfer (automatic):** 16.7% churn rate
- **Credit card (automatic):** 15.2% churn rate

**Insight:** Automated payment methods correlate with lower churn.

### 4. **Revenue Analysis**
- **Churned customers pay more:** $74.44/month average
- **Retained customers pay less:** $61.27/month average
- **Annual revenue at risk:** $1.67M from churned customers

**Insight:** High-paying customers are leaving, suggesting value perception issues.

### 5. **Service Adoption Patterns**
- Customers with **TechSupport** have 15% lower churn
- Customers with **OnlineSecurity** have 14% lower churn
- **Fiber optic** customers churn more than DSL customers

---

## Business Implications

1. **Immediate Action:** Focus retention on month-to-month contract customers
2. **Onboarding:** Strengthen first 6 months of customer relationship
3. **Payment Strategy:** Incentivize automatic payment enrollment
4. **Value Proposition:** Address why high-paying customers are leaving
5. **Service Bundling:** Promote TechSupport and security services

---

## Data Quality Notes

- **Excellent data quality:** Only 0.16% missing data (11 records)
- **Clean dataset created:** All transformations validated
- **Ready for analysis:** Binary encoding, numeric conversions completed
- **Output:** SQLite database and CSV files prepared for SQL analysis

---

**Next Analysis:** SQL-based business intelligence queries (Notebook 02)
