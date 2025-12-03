# 📊 PROJECT METRICS - SINGLE SOURCE OF TRUTH

**Last Updated:** November 18, 2025  
**Project:** Customer Churn Prediction & Analysis  
**Status:** Complete & Validated ✅

---

## 📈 Data Metrics

### Dataset Information

- **Total Customers (Analysis):** 7,032 customers
- **Original Dataset:** 7,043 customers
- **Records Excluded:** 11 customers (missing TotalCharges values)
- **Features:** 21 total (20 after removing customerID)
- **Target Variable:** Churn (binary: Yes/No)
- **Data Source:** Telco Customer Churn Dataset

### Data Quality

- **Missing Values:** 11 customers with null TotalCharges (0.16%)
- **Duplicates:** 0
- **Data Types:** Mixed (numeric, categorical, binary)
- **Clean Rate:** 99.84%

  - joblib (model persistence)

### Notebooks

1. **01_data_exploration.ipynb** - EDA with 20+ visualizations
2. **02_sql_analysis.ipynb** - 10 comprehensive SQL queries
3. **03_modeling.ipynb** - ML pipeline with 2 models
4. **04_dashboard_prep.ipynb** - Dashboard-ready exports

---

## 📋 How to Use This Reference

### For Documentation Updates

1. **Always check this file FIRST** before updating any documentation
2. **Copy metrics directly** from this file (don't calculate elsewhere)
3. **Update this file FIRST** if any metrics change
4. **Then propagate** changes to other documentation

### For Resume/Portfolio

- Use "7,032 customers" (not 7,043)
- Use "10 comprehensive SQL queries" (not 3)
- Use "$1.67M revenue at risk" for impact
- Use "79.5% accuracy, 0.834 ROC AUC" for model performance
- Use "$163K potential annual savings" for business value

### For Interviews

- **Dataset size:** 7,032 customers (11 excluded for quality)
- **Business problem:** 26.58% churn rate, $1.67M at risk
- **Technical approach:** 10 SQL queries + 2 ML models
- **Key insight:** Month-to-month contracts churn at 42.71% vs 2.85% for 2-year
- **Business impact:** $163K potential savings with targeted retention

### For Technical Discussions

- **SQL complexity:** Window functions (LAG), CTEs, complex aggregations
- **ML approach:** Logistic Regression (interpretability) vs Random Forest (performance)
- **Feature engineering:** Tenure groups, revenue segments, service counts
- **Model validation:** Train/test split, ROC curves, confusion matrix
- **Business translation:** Probability scores → risk segments → action plans

---

## ✅ Validation Status

- [x] All 4 notebooks executed successfully
- [x] All 10 SQL queries validated
- [x] All CSV exports created and verified
- [x] All visualizations generated at 300 DPI
- [x] Both ML models trained and saved
- [x] Documentation complete and consistent
- [x] Data dictionaries created
- [x] Metrics verified across all files

**Last Validation Date:** November 18, 2025  
**Validation Status:** ✅ COMPLETE

---

## 📞 Contact & Attribution

**Project Type:** Portfolio Project - Data Analytics & Machine Learning  
**Domain:** Telecommunications / Customer Analytics  
**Complexity Level:** Intermediate to Advanced  
**Suitable For:** Data Analyst, Business Analyst, Data Scientist roles

---

**📌 Remember:** This is your SINGLE SOURCE OF TRUTH for all project metrics. Update this file first, then propagate changes to other documentation!
