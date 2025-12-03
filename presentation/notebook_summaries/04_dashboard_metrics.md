# Dashboard Data & Metrics

## Overview
**Purpose:** Prepare aggregated datasets optimized for dashboard tools  
**Output:** 7 CSV files ready for Tableau, Power BI, or Excel  
**Data Source:** 7,032 cleaned customer records

---

## Datasets Created

### 1. Customer-Level Data (`customers_dashboard.csv`)
**7,032 rows × 22 columns**

Complete customer dataset with:
- All demographic fields
- Service subscriptions
- Contract and billing details
- Churn status
- Calculated fields (tenure groups, revenue segments)

**Use Case:** Detail views, customer search, drill-downs

---

### 2. KPI Summary (`kpi_summary.csv`)
**1 row × 12 metrics**

Executive dashboard metrics:
- Total customers: 7,032
- Churn rate: 26.5%
- Churned customers: 1,869
- Average tenure: 32 months
- Average monthly charges: $64.76
- Total monthly revenue: $456,120
- Annual revenue at risk: $1,669,920
- Data quality score: 99.84%

**Use Case:** Top-level dashboard, executive summary

---

### 3. Contract Analysis (`contract_analysis.csv`)
**3 rows (one per contract type)**

| Contract | Customers | Churn Rate | Avg Revenue |
|----------|-----------|------------|-------------|
| Month-to-month | 3,875 | 42.7% | $66.21 |
| One year | 1,473 | 11.3% | $64.31 |
| Two year | 1,684 | 2.8% | $61.98 |

**Use Case:** Contract performance charts, strategic planning

---

### 4. Payment Method Analysis (`payment_analysis.csv`)
**4 rows (one per payment method)**

| Payment Method | Customers | Churn Rate | Risk Level |
|----------------|-----------|------------|------------|
| Electronic check | 2,365 | 45.3% | 🔴 High |
| Mailed check | 1,612 | 19.1% | 🟡 Medium |
| Bank transfer | 1,544 | 16.7% | 🟢 Low |
| Credit card | 1,511 | 15.2% | 🟢 Low |

**Use Case:** Payment optimization, retention targeting

---

### 5. Tenure Analysis (`tenure_analysis.csv`)
**6 tenure groups**

| Tenure Group | Customers | Churn Rate | Key Insight |
|--------------|-----------|------------|-------------|
| 0-6 months | 893 | 51.2% | Critical onboarding period |
| 7-12 months | 674 | 44.1% | Still high risk |
| 13-24 months | 1,247 | 35.4% | Stabilizing |
| 25-36 months | 981 | 15.8% | Loyal emerging |
| 37-48 months | 743 | 10.2% | Loyal |
| 49+ months | 2,494 | 6.3% | Very loyal |

**Use Case:** Lifecycle charts, retention programs by stage

---

### 6. Service Analysis (`service_analysis.csv`)
**Rows for each service type (8 services)**

Protection impact:
- **TechSupport:** 15% lower churn
- **OnlineSecurity:** 14% lower churn
- **OnlineBackup:** 11% lower churn
- **DeviceProtection:** 10% lower churn

Risk indicators:
- **Fiber optic internet:** 30% churn (vs. 19% DSL)
- **No internet:** 7% churn (phone only)

**Use Case:** Service bundling strategy, upsell targeting

---

### 7. Revenue Segments (`revenue_segments.csv`)
**4 revenue tiers**

| Segment | Monthly Range | Customers | Churn Rate | Annual Risk |
|---------|---------------|-----------|------------|-------------|
| Low | $0-40 | 1,845 | 18.7% | $259K |
| Medium | $41-70 | 2,876 | 24.3% | $651K |
| High | $71-90 | 1,589 | 32.1% | $478K |
| Premium | $91+ | 722 | 35.7% | $282K |

**Insight:** Higher-paying customers churn more (value perception issue)

**Use Case:** Revenue waterfall charts, value prop analysis

---

## Dashboard Design Recommendations

### Executive Dashboard (1 page)
**Target Audience:** C-suite, VPs

**Layout:**
```
┌─────────────────────────────────────────┐
│  KPI Cards (Top)                        │
│  ├─ Total Customers: 7,032              │
│  ├─ Churn Rate: 26.5%                   │
│  ├─ Monthly Revenue: $456K              │
│  └─ Revenue at Risk: $1.67M             │
├─────────────────────────────────────────┤
│  Churn by Contract (Bar Chart)          │
│  Month-to-month: 42.7% ████████████     │
│  One year: 11.3% ███                    │
│  Two year: 2.8% █                       │
├─────────────────────────────────────────┤
│  Tenure Risk Curve (Line Chart)         │
│  51% → 44% → 35% → 15% → 10% → 6%      │
├─────────────────────────────────────────┤
│  Revenue Segment Matrix (Heatmap)       │
│  Segment | Churn | Revenue             │
└─────────────────────────────────────────┘
```

**Data Sources:** KPI Summary, Contract Analysis, Tenure Analysis

---

### Operational Dashboard (2-3 pages)
**Target Audience:** Customer success, Marketing, Operations

**Page 1: Customer Segments**
- Churn by contract type
- Churn by payment method
- Churn by tenure group
- Interactive filters: Segment, Service type

**Page 2: Service Performance**
- Service adoption rates
- Churn impact by service
- Bundle analysis
- Upsell opportunities

**Page 3: Revenue Analysis**
- Revenue by segment
- Revenue at risk by group
- Customer lifetime value
- Retention ROI calculator

**Data Sources:** All 7 datasets with cross-filtering

---

### Analytical Dashboard (Deep-dive)
**Target Audience:** Data analysts, Strategy team

**Features:**
- Customer-level table with search
- Cohort analysis by signup month
- Correlation heatmaps
- Predictive model scores (if integrated)
- Custom metric calculations

**Data Sources:** Customer-Level Data + all aggregations

---

## Key Metrics Definitions

### Churn Rate
```
Churn Rate = (Churned Customers / Total Customers) × 100
Example: (1,869 / 7,032) × 100 = 26.5%
```

### Revenue at Risk (Annual)
```
Annual Risk = Churned Customers × Avg Monthly Charge × 12
Example: 1,869 × $74.44 × 12 = $1,669,920
```

### Customer Lifetime Value (CLV)
```
CLV = Avg Monthly Charge × Avg Tenure (months)
Example: $64.76 × 32 = $2,072
```

### Retention Rate
```
Retention Rate = (1 - Churn Rate) × 100
Example: (1 - 0.265) × 100 = 73.5%
```

---

## Dashboard Tool Recommendations

### **Tableau** (Recommended)
✅ Best for: Interactive visualizations, public sharing  
✅ Strengths: Drag-and-drop, beautiful charts, Tableau Public free  
✅ Use case: Portfolio showcase, stakeholder presentations  
**Getting started:** Load CSVs → Create sheets → Build dashboard → Publish

### **Power BI** (Recommended for Microsoft environments)
✅ Best for: Corporate reporting, Microsoft ecosystem integration  
✅ Strengths: DAX calculations, SharePoint embedding, Excel-like  
✅ Use case: Internal company dashboards  
**Getting started:** Import data → Model relationships → Create visuals

### **Excel** (Quick & Easy)
✅ Best for: Rapid prototyping, pivot tables, simple charts  
✅ Strengths: Universal availability, familiar interface  
✅ Use case: Ad-hoc analysis, internal reports  
**Already created:** `excel/churn_analysis_dynamic.xlsx` (13 sheets, 6 charts)

---

## Data Refresh Process

### Manual Refresh (Development)
1. Run notebook `01_data_exploration.ipynb` (generates clean data)
2. Run notebook `04_dashboard_prep.ipynb` (creates 7 CSV files)
3. Reload CSVs in dashboard tool
4. Verify metrics unchanged or explain differences

### Automated Refresh (Production)
1. Schedule Python script to run monthly
2. Auto-export to shared folder (Google Drive, SharePoint)
3. Dashboard tool auto-refresh from folder
4. Email stakeholders when updated

**Recommended:** Monthly refresh aligned with billing cycle

---

## Quality Assurance Checks

Before publishing dashboard:
- ✅ Total customers sum matches across all views (7,032)
- ✅ Churn rate calculations consistent (26.5%)
- ✅ Revenue figures reconcile ($456K monthly)
- ✅ All filters work (contract, payment, tenure)
- ✅ Charts have clear labels and legends
- ✅ Color scheme accessible (colorblind-friendly)
- ✅ Mobile responsive (if applicable)

---

## Files Location

All dashboard-ready files saved to:
```
data/dashboard_ready/
├── customers_dashboard.csv
├── kpi_summary.csv
├── contract_analysis.csv
├── payment_analysis.csv
├── tenure_analysis.csv
├── service_analysis.csv
└── revenue_segments.csv
```

**File sizes:** 50KB - 2MB (optimized for loading speed)

---

## Next Steps

1. **Choose dashboard tool** (Tableau recommended for portfolio)
2. **Import 7 CSV files**
3. **Create relationships** (customer_id as key)
4. **Build 3-page dashboard** (Executive, Operational, Analytical)
5. **Publish & share** (Tableau Public, Power BI Service, or SharePoint)

---

**Project Status:** Analysis complete! Ready for dashboard creation and presentation.
