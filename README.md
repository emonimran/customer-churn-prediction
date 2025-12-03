# Customer Churn Prediction & Analysis

**Professional Data Analysis Portfolio Project**

---

## 🎯 Project Overview

A comprehensive data analysis project identifying **$4.9M in annual revenue protection opportunities** through customer churn prediction and strategic retention recommendations.

**Dataset:** 7,032 telecommunications customers  
**Churn Rate:** 26.5% (1,869 customers lost)  
**Key Insight:** Month-to-month contracts drive 42.7% churn — 15x higher than long-term contracts  
**Solution:** Predictive ML model (85% accuracy) + targeted retention programs

---

## 📊 Quick Stats

| Metric | Value |
|--------|-------|
| **Revenue at Risk** | $1.67M annually |
| **Addressable Opportunity** | $4.9M through retention programs |
| **Model Accuracy** | 85.2% (Random Forest) |
| **Data Quality** | 99.84% complete |
| **SQL Queries** | 10 comprehensive business intelligence queries |
| **Top Recommendation** | Contract conversion ($2.1M opportunity) |

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

## 🚀 Quick Start

### **Run the Analysis**

```bash
# 1. Clone or download the project
cd "Customer Churn Prediction & Analysis"

# 2. Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Run notebooks in order
jupyter notebook notebooks/01_data_exploration.ipynb
```

### **Explore the Results**

- **For Portfolio/Resume:** Start with `presentation/portfolio_case_study.md`
- **For Interviews:** Read `presentation/interview_prep.md`
- **For Technical Details:** See `dev_docs/README.md`
- **For Visualizations:** Check `presentation/visualizations/`

---

## 📚 How to Navigate

- **See the analysis:** Run `notebooks/` in order (01→04)
- **View visualizations:** Check `visualizations/` folder
- **Understand the data:** See `data/data_dictionary.csv`
- **Review SQL queries:** Open `sql/churn_analysis_queries.sql`

---

## 🎓 Skills Demonstrated

### **Data Analysis**
- ✅ Exploratory Data Analysis (EDA) on 7,000+ records
- ✅ Statistical analysis and hypothesis testing
- ✅ Customer segmentation and cohort analysis
- ✅ Revenue and ROI calculations

### **Technical Skills**
- ✅ **Python:** pandas, matplotlib, seaborn, scikit-learn
- ✅ **SQL:** CTEs, window functions, complex aggregations, joins
- ✅ **Machine Learning:** Classification models, feature engineering, model evaluation
- ✅ **Excel:** Pivot tables, charts, conditional formatting, automation
- ✅ **Jupyter Notebooks:** Reproducible, documented analysis

### **Business Acumen**
- ✅ Identified $4.9M revenue opportunity
- ✅ Prioritized initiatives by ROI and feasibility
- ✅ Translated technical findings into business language
- ✅ Created actionable recommendations with implementation roadmap

### **Communication**
- ✅ Executive summaries for leadership
- ✅ Technical documentation for developers
- ✅ Portfolio materials for job applications
- ✅ Visualizations for presentations

---

## 🔑 Key Findings

### **1. Contract Type Drives Churn** 🔴
- Month-to-month: 42.7% churn
- One year: 11.3% churn
- Two year: 2.8% churn
- **Recommendation:** Contract conversion campaign ($2.1M opportunity)

### **2. New Customers are Highest Risk** 🔴
- 0-6 months: 51.2% churn
- 7-12 months: 44.1% churn
- 37+ months: 6.3% churn
- **Recommendation:** Intensive onboarding program ($890K opportunity)

### **3. Payment Method = Commitment Signal** 🟡
- Electronic check: 45.3% churn
- Credit card (auto): 15.2% churn
- **Recommendation:** Auto-pay migration ($520K opportunity)

### **4. High-Value Customers Leaving** 🔴
- Churned customers pay $74/month
- Retained customers pay $61/month
- **Recommendation:** VIP retention program ($740K opportunity)

### **5. ML Model Enables Proactive Retention** 🟢
- 85% accuracy predicting churn
- 67% precision (2 of 3 predictions correct)
- **Recommendation:** Monthly scoring + targeted campaigns

---

## 💰 Business Impact

**Total Revenue Protection Opportunity:** $4.9M annually

**Top 3 Priorities:**
1. **Contract Conversion** — $2.1M (6 months)
2. **Onboarding Program** — $890K (3 months)
3. **Auto-Pay Migration** — $520K (2 months)

**Expected Outcomes:**
- Reduce churn rate from 26.5% to 18% (32% improvement)
- Increase customer lifetime value by 24 months
- Improve annual contract adoption by 11 percentage points
- Enable proactive vs. reactive retention

---

## 🎯 Quick Start

| Action | Location |
|--------|----------|
| **Run notebooks** | `notebooks/` (run 01→04 in order) |
| **View charts** | `visualizations/` |
| **Check data fields** | `data/data_dictionary.csv` |
| **See SQL queries** | `sql/churn_analysis_queries.sql` |

---

## 💭 What I Learned

### **Technical Growth**
- **Window functions saved me!** Initially struggled with calculating running totals in SQL. After researching `ROW_NUMBER()` and `PARTITION BY`, I realized window functions could replace 3 separate queries. Cut query time from 12 seconds to 2 seconds.
- **Feature engineering matters more than model choice.** Spent 2 days testing 5 different models before realizing my features were weak. Adding `tenure_group`, `total_charges_per_month`, and `service_count` improved all models by 8-12%. Lesson: spend more time on features, less on hyperparameters.
- **Excel automation is tedious but worth it.** Writing 200+ lines of `openpyxl` code to format cells felt excessive, but the ability to regenerate polished reports instantly saved hours during revisions.

### **Business Perspective**
- **Numbers alone don't persuade.** My first analysis report was 40 pages of statistics. After rewriting it with a 1-page executive summary focused on "$4.9M opportunity," I got much better feedback from non-technical reviewers.
- **Month-to-month contracts = intentional flexibility.** Initially thought it was a pricing issue, but deeper analysis showed these customers value flexibility over commitment. Changed my recommendation from "force contracts" to "incentivize upgrades."

### **Challenges I Overcame**
- **SQLite doesn't support all PostgreSQL functions.** Learned this the hard way when my `STRING_AGG()` queries failed. Had to rewrite using Python aggregations instead.
- **Imbalanced dataset (73% non-churn).** Random Forest kept predicting "not churn" for everything initially. Fixed with `class_weight='balanced'` and SMOTE resampling.
- **Jupyter notebook organization.** First version was 800+ lines in one file. Splitting into 4 notebooks made debugging so much easier.

### **If I Had More Time**
- Add time-series analysis to predict *when* each customer will churn (survival analysis)
- Build a simple Flask web app where you can input customer features and get churn probability
- Test XGBoost and LightGBM (heard they perform better on tabular data)
- Analyze text from customer support tickets (sentiment analysis)
- Create A/B testing framework to measure retention campaign effectiveness

---

## 📖 Project Journey

**How This Project Evolved:**

**Week 1-2:** Data exploration and cleaning
- Found dataset on Kaggle, spent 3 days just understanding what each field meant
- Built the SQLite database (first time using SQL in a Python project)
- Created 20+ visualizations before narrowing down to the most insightful 9

**Week 3:** SQL analysis and business metrics
- Wrote 10 business intelligence queries (CTEs were confusing at first!)
- Calculated revenue at risk and identified the $4.9M opportunity
- Peer review feedback: "Great analysis, but make it less technical"

**Week 4:** Machine learning modeling
- Tested Logistic Regression, Random Forest, Decision Trees
- Random Forest won (85% accuracy vs 79% for LogReg)
- Struggled with precision/recall tradeoff — decided recall was more important for this business problem

**Week 5:** Dashboard preparation and automation
- Built Excel automation scripts (learned `openpyxl` from scratch)
- Created 300 DPI chart exports for presentations
- Set up folder structure for portfolio (this took way longer than expected!)

**Week 6:** Documentation and presentation materials
- Wrote executive summary, case study, and interview prep guide
- Cleaned up notebooks to make them portfolio-ready
- Note: This README went through 4 revisions before I was happy with it

---

**This project demonstrates proficiency in data analysis, SQL, machine learning, business strategy, and stakeholder communication — core competencies for a Data Analyst role.** 🚀

