# Customer Churn Prediction & Analysis

**End-to-end data science project analyzing customer churn using Python, SQL, and machine learning**

---

## Overview

Analyzed 7,032 telecom customer records to identify churn patterns and build predictive models. The analysis revealed that contract type is the strongest predictor of churn, with month-to-month customers churning at 42.7% vs 2.8% for two-year contracts.

**Key Results:**
- Built Random Forest model achieving 85% accuracy
- Identified $4.9M revenue protection opportunity through targeted retention
- Developed SQL-based business intelligence queries for ongoing monitoring

---



## 🗂️ Project Structure

```
Customer Churn Prediction & Analysis/
│
├── 📓 notebooks/                    # Analysis notebooks
│   ├── 01_data_exploration.ipynb    # EDA & data cleaning
│   ├── 02_sql_analysis.ipynb        # SQL business intelligence
│   ├── 03_modeling.ipynb            # Machine learning models
│   └── 04_dashboard_prep.ipynb      # Dashboard data preparation
│
├── 📂 data/                         # Dataset
│   ├── raw/telco_customer_churn.csv # Original data (7,043 customers)
│   └── data_dictionary.csv          # Field definitions
│
├── 🔍 sql/                          # SQL queries
│   └── churn_analysis_queries.sql   # 10 business intelligence queries
│
├── 🐍 scripts/                      # Python automation
│   ├── create_enhanced_excel.py     # Excel report generator
│   └── verify_excel_formulas.py     # Formula validation
│
└── 📊 visualizations/               # Charts & graphs
    └── *.png                        # High-resolution visualizations
```

---

## Setup

```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
jupyter notebook
```

Run notebooks in order: `01_data_exploration.ipynb` → `02_sql_analysis.ipynb` → `03_modeling.ipynb` → `04_dashboard_prep.ipynb`

---

## Tech Stack

- **Python:** pandas, scikit-learn, matplotlib, seaborn
- **SQL:** SQLite with CTEs and window functions
- **Tools:** Jupyter, openpyxl

---

## Key Findings

**Contract Type:** Strongest predictor of churn
- Month-to-month: 42.7% churn rate
- One year: 11.3% 
- Two year: 2.8%

**Tenure:** New customers at highest risk
- 0-6 months: 51.2% churn
- 37+ months: 6.3% churn

**Payment Method:** Auto-pay reduces churn
- Electronic check: 45.3% churn
- Credit card (auto): 15.2% churn

**Revenue Impact:** Churned customers average $74/mo vs $61/mo for retained

---





## Notes

**Approach:** Used window functions in SQL to calculate running customer metrics, which was more efficient than multiple subqueries. Feature engineering (tenure groups, service counts) had bigger impact on model performance than hyperparameter tuning.

**Challenges:** Dealt with class imbalance (73% non-churn) using `class_weight='balanced'`. SQLite lacks some PostgreSQL functions so had to aggregate in Python for certain queries.

**Future improvements:** Time-series survival analysis to predict *when* customers churn, not just if. XGBoost/LightGBM comparison for tabular data.

