# Machine Learning Model Results

## Overview
**Objective:** Build predictive models to identify customers at risk of churning  
**Models Evaluated:** Logistic Regression, Random Forest  
**Dataset:** 7,032 customers with 19 features  
**Split:** 70% training, 30% testing

---

## Model Performance Comparison

| Model | Accuracy | Precision | Recall | F1-Score | AUC |
|-------|----------|-----------|--------|----------|-----|
| **Random Forest** | **85.2%** | **66.8%** | **56.3%** | **61.1%** | **0.89** |
| Logistic Regression | 79.7% | 64.9% | 52.0% | 57.7% | 0.84 |

**Winner:** Random Forest - Better at identifying actual churners (higher recall) while maintaining precision.

---

## What Does This Mean?

### Random Forest Performance (Best Model)
- **85% Accuracy:** Correctly predicts 85 out of 100 customers
- **67% Precision:** When it predicts churn, it's right 67% of the time
- **56% Recall:** Catches 56% of actual churners
- **0.89 AUC:** Excellent discriminatory power

### Business Translation
Out of 100 customers predicted to churn:
- ✅ **67 will actually churn** (True Positives) - Worth targeting!
- ❌ **33 won't churn** (False Positives) - Acceptable cost
- ⚠️ **We miss 44% of churners** (False Negatives) - Room for improvement

**ROI Consideration:** Even at 56% recall, we can save significant revenue by proactively targeting predicted churners.

---

## Top Churn Predictors (Feature Importance)

### Top 10 Features by Impact

1. **Tenure** (18.2%) - How long they've been a customer
   - *Short tenure = high risk*

2. **MonthlyCharges** (15.7%) - Amount paid per month
   - *High charges without perceived value = risk*

3. **TotalCharges** (14.3%) - Lifetime value spent
   - *Low total = haven't invested enough to stay*

4. **Contract_Month-to-month** (12.9%) - Flexible contract
   - *No commitment = easy to leave*

5. **InternetService_Fiber optic** (8.4%) - Internet type
   - *Quality or price concerns*

6. **PaymentMethod_Electronic check** (6.7%) - Payment type
   - *Manual payment = less commitment*

7. **OnlineSecurity_No** (4.8%) - Lacks security service
   - *Missing value-add services*

8. **TechSupport_No** (4.2%) - No support service
   - *Customers feel unsupported*

9. **Contract_Two year** (3.9%) - Long-term contract
   - *Strong negative predictor (prevents churn)*

10. **PaperlessBilling_Yes** (3.1%) - Digital billing
    - *Less engagement touchpoints*

---

## Actionable Insights from Model

### High-Risk Profile (Most likely to churn)
- ✅ **New customer** (< 12 months tenure)
- ✅ **Month-to-month contract**
- ✅ **Pays >$70/month** (high charges)
- ✅ **Uses electronic check** (manual payment)
- ✅ **Fiber optic internet** (quality concerns?)
- ✅ **No TechSupport or OnlineSecurity** (missing services)

**Action:** These customers should receive immediate outreach

### Low-Risk Profile (Unlikely to churn)
- ✅ **Long tenure** (> 24 months)
- ✅ **Two-year contract**
- ✅ **Moderate charges** ($40-60/month)
- ✅ **Automatic payment** (bank transfer/credit card)
- ✅ **Bundled services** (Multiple add-ons)

**Action:** Maintain quality, don't over-invest in retention

---

## Business Value of Predictive Model

### Scenario: Proactive Retention Campaign

**Assumptions:**
- Model identifies 1,000 high-risk customers
- 670 will actually churn (67% precision)
- Each churner costs $1,500 in lost annual revenue
- Retention campaign costs $100 per customer
- Campaign success rate: 30%

**ROI Calculation:**
```
Saved Customers: 670 × 30% = 201 customers
Revenue Saved: 201 × $1,500 = $301,500
Campaign Cost: 1,000 × $100 = $100,000
Net Benefit: $201,500
ROI: 201%
```

**Result:** Every dollar spent on targeted retention returns $3.

---

## Model Deployment Recommendations

### Phase 1: Pilot (Month 1-2)
- Score all active customers monthly
- Target top 10% highest-risk (700 customers)
- A/B test: Retention offers vs. control group
- Measure: Churn rate reduction, campaign ROI

### Phase 2: Scale (Month 3-6)
- Expand to top 20% highest-risk (1,400 customers)
- Automate outreach triggers (email, SMS, call)
- Personalize offers based on churn drivers
- Integrate with CRM system

### Phase 3: Optimize (Month 6+)
- Retrain model quarterly with new data
- Test ensemble methods (XGBoost, LightGBM)
- Add new features (customer service calls, usage patterns)
- Target recall improvement to 65-70%

---

## Model Limitations & Considerations

### Current Limitations
1. **Recall of 56%** - We miss 44% of actual churners
   - *Mitigation:* Lower probability threshold for broader net
   
2. **Static snapshot** - Model doesn't capture temporal patterns
   - *Future:* Incorporate time-series features (usage trends)
   
3. **Feature engineering** - May be missing interaction effects
   - *Future:* Test polynomial features, custom ratios

### Ethical Considerations
- **Fairness:** Ensure model doesn't discriminate based on demographics
- **Transparency:** Explain predictions to retention team
- **Privacy:** Handle customer data securely, comply with regulations

---

## Technical Artifacts

**Models Saved:**
- `models/logreg_baseline.joblib` - Logistic Regression (79.7% accuracy)
- `models/rf_baseline.joblib` - Random Forest (85.2% accuracy) ⭐

**Visualizations Created:**
- Feature importance charts
- ROC curves
- Confusion matrices
- Precision-Recall curves

**Ready for Production:** Random Forest model can be deployed immediately

---

## Next Steps

1. **Business Validation:** Review model predictions with customer success team
2. **Dashboard Integration:** Add churn risk scores to customer dashboard (Notebook 04)
3. **Campaign Design:** Create targeted retention offers
4. **Monitoring Setup:** Track model performance in production

---

**Next Analysis:** Dashboard preparation with model scores (Notebook 04)
