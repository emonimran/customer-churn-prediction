# Phase 2 — Insights & Recommendations

Source: SQL query outputs in `data/processed/` (query_01…query_10)

Each insight is structured as: Observation → Why it matters → Action → Estimated impact


## 1) Churn Rate by Contract Type (query_01_churn_rate_by_contract_type.csv)

Observation

Month-to-month customers have the highest churn rate at 42.71% (3,875 customers; 1,655 churned). One-year customers churn at 11.27% and two-year at 2.83%.

Why it matters

Contract length strongly correlates with retention. Short-term (month-to-month) customers represent a volatile segment with substantial churn volume and therefore are a primary source of revenue leakage.

Action

Launch a targeted retention program for month-to-month customers: promotional discounts to switch to 1-yr/2-yr plans, limited-time incentives (bill credits), and targeted onboarding/engagement communications during months 1–3.

Estimated impact

If a 10% absolute reduction in month-to-month churn is achieved (42.7% → 32.7%), retaining ~387 additional customers would reduce monthly revenue leakage by ~387 * `avg_monthly_charge_of_segment` (approx $77) ≈ $29.8k per month (~$358k annualized).

Portfolio visual

![Churn rate by contract type](../dashboards/churn_by_contract.png)
*Caption: Month-to-month customers churn 15× faster than two-year contracts. Use this view in dashboards/interviews to highlight the retention gap.*


## 2) Churn Rate by Payment Method (query_02_churn_rate_by_payment_method.csv)

Observation

Customers paying by Electronic check churn at 45.29% (2,365 customers; 1,071 churned). Automatic payment methods (bank transfer / credit card) show much lower churn (≈15–17%).

Why it matters

Payment friction correlates with churn. Electronic checks likely indicate higher friction or failed payments and represent a high-risk payment cohort.

Action

Prioritize conversion to automatic payments: offer one-click conversion, small bill credit for enabling auto-pay, or educational prompts explaining benefits. Add payment-failure detection to trigger retention outreach.

Estimated impact

Reducing electronic-check churn from 45% → 35% (10pp improvement) would retain ~236 additional customers monthly in that cohort; at avg monthly charge ~$76 → ~$17.9k monthly retained revenue (~$215k annualized).

Portfolio visual

![Churn rate by payment method](../dashboards/churn_by_payment_method.png)
*Caption: Electronic check users churn 30pp more than auto-pay customers. Shows the payoff from promoting automatic payments.*


## 3) Revenue at Risk by Customer Segment (query_03_revenue_at_risk_by_customer_segment.csv)

Observation
The largest monthly revenue lost from churned customers is from Month-to-month + Electronic check: monthly_revenue_lost ≈ $77,315 (annualized ≈ $927,787).

Why it matters
This segment is both large and high-value: it combines high churn risk with above-average monthly charges, representing the single biggest concentration of revenue at risk.

Action
Run a priority retention pilot for the Month-to-month + Electronic check segment: proactive outreach, loyalty offers, switch incentives to automatic payments, and an offer to convert to 1-year plans with discounts. Measure lift with an A/B test.

Estimated impact
A modest 5% retention improvement in this segment would save ~50 customers and roughly $50 * $77k/monthly segment avg ≈ $3.8k monthly in direct revenue (scales with improved retention and cross-sell).


## 4) Churn Trend by Tenure (query_04_churn_trend_by_tenure_window_function.csv)

Observation

Churn is extremely high in the first two months (month 1: 61.99%, month 2: 51.68%) then falls and stabilizes after 12 months (~32% at month 12). The majority of churn occurs early in the lifecycle.

Why it matters

Early lifecycle churn indicates onboarding/product fit issues or immediate dissatisfaction. Addressing the first 1–3 months yields high ROI because customers who survive past the first year are far less likely to churn.

Action

Implement an enhanced onboarding program: early check-ins, rapid issue-resolution SLA, first-60-day education & incentives, and a targeted “welcome” retention campaign focused on high churn months.

Estimated impact

Reducing month-1 churn from 62% → 50% could reduce early churn substantially and, assuming similar avg charges, materially reduce revenue leakage—early retention improvements show compounding benefits across the 12-month cohort.

Portfolio visual

![First 24-month churn curve](../dashboards/tenure_churn.png)
*Caption: Visualizes the steep early churn drop-off—great talking point for onboarding improvements.*


## 5) Top 10 High-Value Churned Customers (query_05_top_10_high_value_churned_customers_rank.csv)

Observation
The top 10 churned customers have lifetime values from ~$7.7k to $8.6k, many on higher-tier Fiber plans and with high MonthlyCharges (≈$106–$118).

Why it matters
Losing a small number of high‑LTV customers disproportionately impacts revenue and can mask underlying service issues affecting premium customers.

Action
Build a win-back program focused on high-LTV churned customers (personalized offers, executive-level outreach, bespoke discounts, priority tech support). Also analyze causes of churn among these customers via account-level reviews.

Estimated impact
Re-acquiring or preventing churn among the top 10 customers could recover ~$80k+ in lifetime value. If 30% of top-LTV churns are prevented, that’s ~$24k preserved; scaling similar tactics across top‑100 churned customers multiplies impact.


## 6) Running Total of Churned Customers (query_06_running_total_of_churned_customers.csv)

Observation
20.33% of total churn happens in month 1 (380 churned), and by month 12 cumulative churn reaches ~55.48% of total churn. The cumulative churn curve shows the majority of churn occurs in the first year.

Why it matters
Early churn dominance confirms that onboarding and early-customer experience are high-leverage areas; improvements here reduce long-term attrition and improve CLV.

Action
Implement a 90-day onboarding & retention program: automated onboarding touchpoints, proactive support for early issues, trial extensions or incentives for customers who complete month 1 activity milestones.

Estimated impact
A 10% relative reduction in first-year cumulative churn (e.g., from 55.48% → ~50%) could materially increase retained customers across the cohort; for a base of ~1,308 churned in the first 24 months in our sample, that’s ~65 customers retained early, scaling to significant annual revenue preservation.


## 7) High-Risk Segment Analysis (query_07_high_risk_segment_analysis_cte.csv)

Observation
The defined high-risk segment (Month-to-month + Electronic check + tenure<12 + missing security/tech support) contains 866 customers, representing ~12.3% of the customer base, with monthly revenue at risk ≈ $61.6k (annualized ≈ $739.7k).

Why it matters
This is a concentrated, high-risk cohort with meaningful annual revenue exposure; it’s addressable with targeted offers and therefore a practical retention target.

Action
Launch a targeted pilot for this segment: incentivize auto-pay conversion, bundle online security and tech support into a promotional offer, and prioritize these customers for early outreach in months 0–6.

Estimated impact
Retaining just 10% of this cohort (~87 customers) would preserve ~87 * `avg_monthly_charge` (~$71) ≈ $6.2k monthly (~$74k annualized), with upside from cross-sell and retention in subsequent years.


## 8) Churn Rate by Service Bundle (query_08_churn_rate_by_service_bundle_cte_multi_dimension.csv)

Observation
The highest churn rate (55.01%) is for customers with Fiber optic AND no OnlineSecurity AND no TechSupport (1,765 customers; 971 churned). Bundles without security/support show the worst outcomes.

Why it matters
Service bundles that omit key protection or support correlate with much higher churn, especially for high-bandwidth services (Fiber). This suggests product packaging is a retention lever.

Action
Offer low-cost security + tech-support add-ons at purchase, or a bundled discount for Fiber customers that includes both services. Consider forcing a free trial of security for new fiber installs.

Estimated impact
If bundling reduces churn in this segment by 10 percentage points (55% → 45%), ~176 customers would be retained from the 1,765 fiber-no-no segment, preserving revenue at ~176 * `avg_monthly_charge` (~$86) ≈ $15.1k per month (~$181k annualized).


## 9) Customer Lifetime Value Segments (query_09_customer_lifetime_value_segments.csv)

Observation
LTV segments show a monotonic relationship: very-low LTV (0-500) churn rate ≈ 41.45%, while very-high LTV (5K+) churn rate ≈ 13.7%. Average tenure and monthly charge increase by segment.

Why it matters
Higher-value customers churn far less, so focusing retention budget on mid-to-high LTV segments yields better ROI; low LTV churn is high but less financially impactful per account.

Action
Prioritize retention investments on customers in the 3K-5K and 5K+ LTV segments with proactive retention/loyalty programs. For low-LTV segments, automate inexpensive retention nudges (email, SMS) and optimize acquisition for lower-cost channels.

Estimated impact
Improving churn in the 3K-5K LTV segment by 5pp would retain ~53 customers (from 1,069 total), preserving ~53 * `avg_monthly_charge` (~$81) ≈ $4.3k monthly (~$52k annualized); preventing churn in the 5K+ bucket has even larger per-customer impact.


## 10) Service Impact on Churn (query_10_service_impact_on_churn_union_all.csv)

Observation
Services show meaningful churn reductions when present: Online Security: churn_without=41.77% vs with=14.61% (reduction 27.16pp). Tech Support: 41.64% vs 15.17% (26.47pp). Online Backup: 39.93% vs 21.53% (18.4pp).

Why it matters
Having core service protections/support is strongly associated with lower churn. This implies product features, not just price, materially affect retention.

Action
Promote security and tech-support either as included features for premium plans or as low-barrier add-ons with a free trial. Run an A/B test bundling security+support for new fiber customers and measure churn lift over 6 months.

Estimated impact
If Tech Support inclusion reduces churn by ~26pp in targeted cohorts, converting 20% of at-risk customers to include Tech Support could reduce churned customers in that group by roughly 0.2 × cohort size × 0.26, saving significant revenue (cohort-specific calculation required). As an example, converting 20% of the 866 high-risk cohort to include Tech Support could retain ~34 customers (~$3k monthly).


---

Notes & next steps

- I used query outputs in `data/processed/` as the source. I can extend these insights to include Query 6–10 (running totals, high-risk segments, service bundle impacts, LTV segments, service impact union) if you want more depth.
- I will append this summary to `guides/PHASE2_EXECUTION_LOG.md` with a timestamp.
