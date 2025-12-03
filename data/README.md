# Data Dictionary - Telco Customer Churn

Dataset: telco_customer_churn.csv (7,043 rows, 21 columns)
Source: Kaggle - Telco Customer Churn

Columns:

1. customerID (string)
   - Unique identifier for each customer
   - Example: "7590-VHVEG"

2. gender (string)
   - Customer gender: 'Male' or 'Female'
   - Example: 'Female'

3. SeniorCitizen (int)
   - 1 indicates senior citizen, 0 otherwise
   - Example: 0

4. Partner (string)
   - Whether the customer has a partner: 'Yes'/'No'

5. Dependents (string)
   - Whether the customer has dependents: 'Yes'/'No'

6. tenure (int)
   - Number of months the customer has been with the company
   - Example: 34

7. PhoneService (string)
   - Whether the customer has phone service: 'Yes'/'No'

8. MultipleLines (string)
   - 'No phone service' or 'Yes'/'No' for multiple lines

9. InternetService (string)
   - Type of internet service: 'DSL', 'Fiber optic', 'No'

10. OnlineSecurity (string)
    - Whether customer has online security add-on: 'Yes'/'No' or 'No internet service'

11. OnlineBackup (string)
    - Whether customer has online backup: 'Yes'/'No' or 'No internet service'

12. DeviceProtection (string)
    - Device protection add-on: 'Yes'/'No' or 'No internet service'

13. TechSupport (string)
    - Technical support add-on: 'Yes'/'No' or 'No internet service'

14. StreamingTV (string)
    - TV streaming add-on: 'Yes'/'No' or 'No internet service'

15. StreamingMovies (string)
    - Movie streaming add-on: 'Yes'/'No' or 'No internet service'

16. Contract (string)
    - Contract term: 'Month-to-month', 'One year', 'Two year'

17. PaperlessBilling (string)
    - Whether paperless billing is enabled: 'Yes'/'No'

18. PaymentMethod (string)
    - Payment method: 'Electronic check', 'Mailed check', 'Bank transfer (automatic)', 'Credit card (automatic)'

19. MonthlyCharges (float)
    - The customer's monthly charges
    - Example: 56.95

20. TotalCharges (float)
    - The total charges to date (some values may be empty/missing for new customers)
    - Example: 1889.5

21. Churn (string)
    - Target variable: 'Yes' if customer churned, 'No' otherwise


Data quality notes:
- `TotalCharges` may contain whitespace or missing values for customers with tenure=0. Convert to numeric with coercion and handle NaNs.
- Values like 'No internet service' and 'No phone service' appear in add-on columns; treat as separate category or map to 'No'.

Last updated: 2025-10-10
