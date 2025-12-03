# SQL Analysis Insights

## Overview
**Queries Executed:** 10 comprehensive SQL queries  
**Database:** SQLite with 7,032 customer records  
**Focus:** Business intelligence and revenue analysis

---

## Key Business Questions Answered

### Query 1: Overall Business Health
- **Churn Rate:** 26.5% (Industry benchmark: 15-25%)
- **Total Monthly Revenue:** $456,000+
- **Annual Revenue at Risk:** $358,000+ from churned customers

### Query 2: Contract Performance
| Contract Type | Customers | Churn Rate | Priority |
|---------------|-----------|------------|----------|
| Month-to-month | 3,875 | 42.7% | 🔴 HIGH RISK |
| One year | 1,473 | 11.3% | 🟡 MEDIUM |
| Two year | 1,684 | 2.8% | 🟢 LOW RISK |

**Action:** Convert month-to-month customers to annual contracts

### Query 3: Payment Method Risk Segmentation
| Payment Method | Churn Rate | Recommendation |
|----------------|------------|----------------|
| Electronic check | 45.3% | 🔴 Migrate to auto-pay |
| Mailed check | 19.1% | 🟡 Encourage digital |
| Bank transfer (auto) | 16.7% | 🟢 Best practice |
| Credit card (auto) | 15.2% | 🟢 Best practice |

**Action:** Campaign to move electronic check users to automated payments

### Query 4: Tenure-Based Risk
- **0-12 months:** 47.7% churn rate (New customers = highest risk)
- **13-24 months:** 35.4% churn rate (Still vulnerable)
- **25-36 months:** 15.8% churn rate (Stabilizing)
- **37+ months:** 8.6% churn rate (Loyal base)

**Critical Period:** First 12 months - implement intensive onboarding

### Query 5: Service Bundle Impact
- **No services:** 41% churn rate
- **1-2 services:** 28% churn rate
- **3-4 services:** 19% churn rate
- **5+ services:** 7% churn rate

**Strategy:** Bundle services to increase stickiness

### Query 6: Internet Service Analysis
- **Fiber optic:** 30% churn (higher cost, quality concerns?)
- **DSL:** 19% churn (stable, satisfied customers)
- **No internet:** 7% churn (phone-only, loyal base)

**Investigation:** Why are fiber customers churning at higher rates?

### Query 7: Demographics
- **Senior citizens:** 41% churn rate
- **Non-seniors:** 24% churn rate
- **No dependents:** 31% churn rate
- **With dependents:** 20% churn rate

**Target:** Create retention programs for seniors and single customers

### Query 8: Revenue Segments
**High-Value Segment (>$80/month):**
- 2,000+ customers
- 32% churn rate
- $740K annual revenue at risk

**Action:** VIP retention program for high-value customers

### Query 9: Paperless Billing
- **Paperless:** 33% churn rate (convenience vs. engagement?)
- **Paper:** 16% churn rate (more engagement touchpoints)

**Consideration:** Balance digital convenience with engagement

### Query 10: Multiple Service Lines
- **Phone + Internet + TV:** Lowest churn (8%)
- **Phone only:** Low churn (12%)
- **Internet only:** High churn (42%)

---

## Revenue Opportunity Summary

| Opportunity | Annual Value | Difficulty | Priority |
|-------------|--------------|------------|----------|
| Convert month-to-month contracts | $2.1M | Medium | 🔴 HIGH |
| Retain high-value customers ($80+) | $740K | Hard | 🔴 HIGH |
| Migrate electronic check users | $520K | Easy | 🟡 MEDIUM |
| Improve first-year retention | $890K | Medium | 🔴 HIGH |
| Bundle service offerings | $650K | Easy | 🟡 MEDIUM |

**Total Addressable:** $4.9M annual revenue protection opportunity

---

## Strategic Recommendations

### Immediate (0-3 months)
1. **Launch automated payment migration campaign** - Target 1,500+ electronic check users
2. **Create VIP retention program** - Focus on $80+/month customers
3. **Strengthen onboarding** - Implement 90-day engagement program

### Short-Term (3-6 months)
4. **Contract conversion incentives** - Offer 10-15% discount for annual commitment
5. **Service bundle promotions** - "Add TechSupport + OnlineSecurity for $10"
6. **Fiber optic quality review** - Investigate service quality issues

### Long-Term (6-12 months)
7. **Predictive churn model deployment** - Proactive outreach before churn
8. **Senior citizen program** - Tailored support and pricing
9. **Customer lifecycle management** - Automate retention touchpoints

---

## Data Exports Created

All 10 query results exported to CSV for:
- Excel pivot table analysis
- Tableau dashboard creation
- Power BI reporting
- Stakeholder presentations

**Files Location:** `data/processed/query_*.csv`

---

**Next Analysis:** Machine learning models to predict churn (Notebook 03)
