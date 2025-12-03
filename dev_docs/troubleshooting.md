# 🔧 Troubleshooting Guide - Customer Churn Project

**Quick reference for common errors and solutions**

---

## 📋 **TABLE OF CONTENTS**

1. [Setup & Environment Issues](#setup--environment-issues)
2. [SQL & Database Errors](#sql--database-errors)
3. [Jupyter Notebook Problems](#jupyter-notebook-problems)
4. [Data Loading & Cleaning](#data-loading--cleaning)
5. [Machine Learning Errors](#machine-learning-errors)
6. [Tableau Dashboard Issues](#tableau-dashboard-issues)
7. [Excel Problems](#excel-problems)
8. [Git & GitHub Issues](#git--github-issues)
9. [Performance & Memory](#performance--memory)

---

## 1. SETUP & ENVIRONMENT ISSUES

### ❌ **Error: "python: command not found" or "python is not recognized"**

**Cause:** Python not installed or not in PATH

**Solution:**
```powershell
# Check if Python is installed
python --version
python3 --version

# If neither works, download Python from python.org
# Make sure to check "Add Python to PATH" during installation

# After installation, verify:
python --version  # Should show 3.9 or higher
```

---

### ❌ **Error: "venv\Scripts\Activate : File cannot be loaded (execution policy)"**

**Cause:** PowerShell execution policy restricts script execution

**Solution:**
```powershell
# Option 1: Change execution policy for current user (recommended)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Option 2: Run PowerShell as Administrator, then:
Set-ExecutionPolicy RemoteSigned

# Option 3: Bypass policy for this session only
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Then activate venv again:
.\venv\Scripts\Activate
```

---

### ❌ **Error: "pip: command not found" or "pip install fails"**

**Cause:** pip not installed or outdated

**Solution:**
```powershell
# Upgrade pip
python -m pip install --upgrade pip

# If that fails, reinstall pip:
python -m ensurepip --upgrade

# Use python -m pip instead of just pip:
python -m pip install pandas
```

---

### ❌ **Error: "ModuleNotFoundError: No module named 'pandas'" (after pip install)**

**Cause:** Packages installed in wrong Python environment

**Solution:**
```powershell
# 1. Make sure virtual environment is activated
# Your prompt should show (venv)

# 2. Check which Python pip is using:
pip --version
# Should show path inside venv folder

# 3. If not in venv, activate it:
.\venv\Scripts\Activate

# 4. Reinstall requirements:
pip install -r requirements.txt

# 5. Verify in Python:
python -c "import pandas; print(pandas.__version__)"
```

---

## 2. SQL & DATABASE ERRORS

### ❌ **Error: "OperationalError: no such table: customers"**

**Cause:** SQLite database not created or wrong database file opened

**Solution:**
```python
# Recreate the database
import pandas as pd
import sqlite3

df = pd.read_csv('telco_customer_churn.csv')
conn = sqlite3.connect('churn_analysis.db')
df.to_sql('customers', conn, if_exists='replace', index=False)
conn.close()

print("✅ Database recreated")
```

**Verify table exists:**
```python
conn = sqlite3.connect('churn_analysis.db')
tables = pd.read_sql("SELECT name FROM sqlite_master WHERE type='table'", conn)
print(tables)
conn.close()
```

---

### ❌ **Error: "OperationalError: near 'OVER': syntax error"**

**Cause:** SQLite version too old (window functions require 3.25+)

**Solution:**
```python
# Check SQLite version
import sqlite3
print(sqlite3.sqlite_version)

# If version < 3.25, upgrade Python (comes with newer SQLite)
# Or use alternative query without window functions
```

---

### ❌ **Error: SQL query returns 0 rows**

**Cause:** Column name case sensitivity or wrong filter

**Solution:**
```python
# Check exact column names:
conn = sqlite3.connect('churn_analysis.db')
columns = pd.read_sql("PRAGMA table_info(customers)", conn)
print(columns)

# Note: Column names are case-sensitive!
# Use 'Churn' not 'churn'
# Use 'Contract' not 'contract'
```

---

### ❌ **Error: "#DIV/0!" in calculated field**

**Cause:** Division by zero

**Solution:**
```sql
-- Use NULLIF to avoid division by zero:
ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) / 
      NULLIF(COUNT(*), 0), 2) as churn_rate
```

---

## 3. JUPYTER NOTEBOOK PROBLEMS

### ❌ **Error: "jupyter: command not found"**

**Cause:** Jupyter not installed in virtual environment

**Solution:**
```powershell
# Activate venv first
.\venv\Scripts\Activate

# Install Jupyter
pip install jupyter notebook

# Launch
jupyter notebook
```

---

### ❌ **Error: "Kernel keeps dying" or "Kernel restart required"**

**Cause:** Memory overflow, incompatible packages, or corrupted environment

**Solution:**
```python
# 1. Clear output cells
# Kernel → Restart & Clear Output

# 2. Reduce data size if memory issue:
df_sample = df.sample(n=1000, random_state=42)  # Use subset

# 3. Reinstall kernel:
pip uninstall ipykernel
pip install ipykernel
python -m ipykernel install --user --name=venv

# 4. Restart Jupyter completely
```

---

### ❌ **Error: "Address already in use: http://localhost:8888"**

**Cause:** Jupyter already running or port in use

**Solution:**
```powershell
# Option 1: Use different port
jupyter notebook --port=8889

# Option 2: Kill existing Jupyter process
# Windows:
taskkill /F /IM jupyter-notebook.exe

# Mac/Linux:
killall jupyter-notebook

# Then relaunch:
jupyter notebook
```

---

### ❌ **Error: "PermissionError: [Errno 13] Permission denied"**

**Cause:** File open in another program or insufficient permissions

**Solution:**
```powershell
# Close Excel/Tableau if data file is open

# Check file permissions:
# Right-click file → Properties → Security → Make sure you have Full Control

# Run Jupyter as Administrator (not recommended):
# Right-click PowerShell → Run as Administrator → jupyter notebook
```

---

## 4. DATA LOADING & CLEANING

### ❌ **Error: "FileNotFoundError: [Errno 2] No such file or directory: 'telco_customer_churn.csv'"**

**Cause:** File not in expected location or wrong working directory

**Solution:**
```python
# Check current working directory:
import os
print("Current directory:", os.getcwd())

# List files:
print("Files here:", os.listdir('.'))

# Option 1: Change working directory
os.chdir(r'C:\Users\Tuf\Desktop\JA\01_Tier_1_Bridge_Jobs\01_Data_Analyst_NOC_21223\Projects\Customer Churn Prediction & Analysis')

# Option 2: Use absolute path
df = pd.read_csv(r'C:\...\telco_customer_churn.csv')

# Option 3: Use pathlib (recommended)
from pathlib import Path
data_path = Path.cwd() / 'telco_customer_churn.csv'
df = pd.read_csv(data_path)
```

---

### ❌ **Error: "ParserError: Error tokenizing data"**

**Cause:** CSV file corrupted or wrong delimiter

**Solution:**
```python
# Try specifying encoding:
df = pd.read_csv('telco_customer_churn.csv', encoding='utf-8')

# Or try:
df = pd.read_csv('telco_customer_churn.csv', encoding='latin-1')

# Check delimiter:
df = pd.read_csv('telco_customer_churn.csv', delimiter=',')

# Use on_bad_lines parameter:
df = pd.read_csv('telco_customer_churn.csv', on_bad_lines='skip')
```

---

### ❌ **Error: "KeyError: 'Churn'" or "KeyError: [column name]"**

**Cause:** Column doesn't exist or name spelled wrong

**Solution:**
```python
# Check exact column names:
print(df.columns.tolist())

# Check for extra spaces:
print([f"'{col}'" for col in df.columns])

# Clean column names:
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')
```

---

### ❌ **Warning: "DtypeWarning: Columns have mixed types"**

**Cause:** Column has both numbers and text

**Solution:**
```python
# Specify data types explicitly:
df = pd.read_csv('telco_customer_churn.csv', dtype={
    'TotalCharges': str,  # Then convert later
    'SeniorCitizen': str
})

# Convert after loading:
df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')
```

---

## 5. MACHINE LEARNING ERRORS

### ❌ **Error: "ValueError: could not convert string to float"**

**Cause:** Categorical data not encoded

**Solution:**
```python
# Make sure preprocessing pipeline includes OneHotEncoder
from sklearn.preprocessing import OneHotEncoder

categorical_features = df.select_dtypes(include=['object']).columns
categorical_transformer = Pipeline(steps=[
    ('imputer', SimpleImputer(strategy='most_frequent')),
    ('onehot', OneHotEncoder(handle_unknown='ignore'))
])
```

---

### ❌ **Error: "ValueError: Found input variables with inconsistent numbers of samples"**

**Cause:** X and y have different lengths

**Solution:**
```python
# Check shapes:
print(f"X shape: {X.shape}")
print(f"y shape: {y.shape}")

# Make sure you're not dropping rows from only one:
# If you drop nulls from df, do it BEFORE splitting X and y
df_clean = df.dropna()
X = df_clean.drop('Churn', axis=1)
y = df_clean['Churn']
```

---

### ❌ **Error: "NotFittedError: This model instance is not fitted yet"**

**Cause:** Trying to use model before training

**Solution:**
```python
# Make sure to fit model first:
model.fit(X_train, y_train)

# THEN predict:
y_pred = model.predict(X_test)
```

---

## 6. TABLEAU DASHBOARD ISSUES

### ❌ **Error: "Cannot connect to data source" or "File not found"**

**Cause:** CSV file moved or Tableau looking in wrong location

**Solution:**
1. Data → [Your data source] → Edit Connection
2. Browse to correct CSV file location
3. Click "OK"

**Or embed data:**
1. Data → [Your data source] → Extract Data
2. This creates .hyper file embedded in workbook

---

### ❌ **Error: "Cannot publish to Tableau Public (greyed out)"**

**Cause:** Using Tableau Desktop instead of Tableau Public

**Solution:**
- Download **Tableau Public** (free): https://public.tableau.com/
- Tableau Desktop (paid) cannot publish to public server
- Save workbook in Tableau Public version

---

### ❌ **Error: Churn rate calculation shows 100% or wrong values**

**Cause:** Table calculation computed incorrectly

**Solution:**
1. Right-click measure pill
2. Quick Table Calculation → Percent of Total
3. Right-click again → Compute Using:
   - **"Table (Down)"** if rows are categories
   - **"Pane (down then across)"** for heatmaps

---

### ❌ **Error: Map doesn't show points (geocoding failed)**

**Cause:** No geographic data in dataset or Tableau can't recognize location names

**Solution:**
```python
# Option 1: Add latitude/longitude to dataset
# (Telco dataset doesn't have location data - use different viz)

# Option 2: Use a different chart type:
# - Heatmap by category
# - Bar chart by region (if you add region column)

# Option 3: If you have addresses, use Geocoding.io or Google Maps API
```

---

### ❌ **Error: "Date field not recognized" or shows as string**

**Cause:** Date format not detected by Tableau

**Solution:**
1. Right-click date column in Data pane
2. Change Data Type → Date or Date & Time
3. If doesn't work, preprocess in Python:
```python
df['issue_date'] = pd.to_datetime(df['issue_date'])
df.to_csv('cleaned_data.csv', index=False)
```

---

### ❌ **Error: Dashboard looks different after publishing**

**Cause:** Font/sizing issues on Tableau Public server

**Solution:**
- Use "Automatic" dashboard size (not fixed)
- Test with "Device Preview" before publishing
- Avoid custom fonts (use defaults: Tableau Bold, Tableau Book)
- Republish if needed

---

## 7. EXCEL PROBLEMS

### ❌ **Error: Pivot table shows #REF! error**

**Cause:** Source data deleted or moved

**Solution:**
1. Click inside pivot table
2. PivotTable Analyze → Change Data Source
3. Select correct range
4. Click OK

---

### ❌ **Error: Calculated field in pivot shows #VALUE!**

**Cause:** Invalid formula or circular reference

**Solution:**
```excel
# Check formula syntax:
# Calculated fields use field names in quotes:
='Churned Customers' / 'Total Customers' * 100

# NOT cell references (A1, B2, etc.)
```

---

### ❌ **Error: COUNTIFS returns 0 (but data exists)**

**Cause:** Text/number mismatch or extra spaces

**Solution:**
```excel
# Trim spaces first:
=COUNTIFS(TRIM(A:A),"Yes", TRIM(B:B),"Month-to-month")

# Check for hidden characters:
# Select cell → Format → Clear Formats → Retype value
```

---

### ❌ **Error: File size too large (>50MB)**

**Cause:** Too many calculated cells or embedded objects

**Solution:**
- Save as .xlsb (binary) instead of .xlsx
- Remove unused sheets
- Delete unnecessary formatting
- Don't embed images (link instead)
- Remove pivot table cache: PivotTable Options → Uncheck "Save source data"

---

## 8. GIT & GITHUB ISSUES

### ❌ **Error: "fatal: not a git repository"**

**Cause:** Haven't initialized Git in project folder

**Solution:**
```powershell
# Navigate to project folder
cd "C:\Users\Tuf\Desktop\JA\...\Customer Churn Prediction & Analysis"

# Initialize Git
git init

# Add files
git add .

# Commit
git commit -m "Initial commit"
```

---

### ❌ **Error: "failed to push some refs" or "Updates were rejected"**

**Cause:** Remote repository has commits you don't have locally

**Solution:**
```powershell
# Pull latest changes first
git pull origin main --rebase

# Resolve conflicts if any, then:
git push origin main
```

---

### ❌ **Error: "File size exceeds GitHub limit (>100MB)"**

**Cause:** Trying to commit large files (database, datasets)

**Solution:**
```powershell
# Add to .gitignore:
echo "*.db" >> .gitignore
echo "*.csv" >> .gitignore

# Remove from Git tracking (keeps local file):
git rm --cached churn_analysis.db
git rm --cached telco_customer_churn.csv

# Commit .gitignore change:
git add .gitignore
git commit -m "Ignore large files"
```

**Alternative:** Use Git LFS for large files
```powershell
git lfs install
git lfs track "*.csv"
git add .gitattributes
```

---

## 9. PERFORMANCE & MEMORY

### ❌ **Error: "MemoryError" or notebook freezes**

**Cause:** Dataset too large or memory leak

**Solution:**
```python
# 1. Use sampling for development:
df_sample = df.sample(n=5000, random_state=42)

# 2. Load only needed columns:
df = pd.read_csv('data.csv', usecols=['Churn', 'Contract', 'MonthlyCharges'])

# 3. Optimize data types:
df['SeniorCitizen'] = df['SeniorCitizen'].astype('int8')  # Instead of int64
df['Contract'] = df['Contract'].astype('category')  # Saves memory

# 4. Clear variables:
del df_raw
import gc
gc.collect()

# 5. Restart kernel and run cells sequentially
```

---

### ❌ **Error: SQL query takes too long (>5 minutes)**

**Cause:** No indexes or inefficient query

**Solution:**
```sql
-- Create indexes on commonly filtered columns:
CREATE INDEX idx_churn ON customers(Churn);
CREATE INDEX idx_contract ON customers(Contract);
CREATE INDEX idx_tenure ON customers(tenure);

-- Use LIMIT for testing:
SELECT * FROM customers LIMIT 1000;

-- Check query plan:
EXPLAIN QUERY PLAN
SELECT ...
```

---

### ❌ **Error: Tableau dashboard slow to load**

**Cause:** Too much data or complex calculations

**Solution:**
- Use data extracts (.hyper) instead of live connection
- Limit data to last 2 years
- Simplify calculated fields
- Reduce number of marks (aggregate more)
- Avoid table calculations on large datasets

---

## 🆘 **STILL STUCK?**

### **General Debugging Steps:**

1. ✅ **Read the error message carefully** - It usually tells you what's wrong
2. ✅ **Google the exact error** - Add "python" or "tableau" to search
3. ✅ **Check data types** - `print(df.dtypes)` in Python
4. ✅ **Verify file paths** - `print(os.getcwd())` and `os.listdir('.')`
5. ✅ **Restart everything** - Jupyter kernel, Tableau, PowerShell
6. ✅ **Test with small sample** - Isolate the problem
7. ✅ **Check Stack Overflow** - Someone likely had same issue
8. ✅ **Revert to last working state** - Use Git to undo changes

### **Resources:**

- **Python/Pandas:** https://pandas.pydata.org/docs/
- **Scikit-learn:** https://scikit-learn.org/stable/
- **Tableau:** https://help.tableau.com/
- **SQL:** https://www.sqlitetutorial.net/
- **Stack Overflow:** https://stackoverflow.com/ (search your error)

### **Contact for Help:**

If you're truly stuck after trying these solutions:
1. Document exact error message
2. Note what you tried already
3. Share relevant code snippet
4. Ask on Stack Overflow or Python/Data Science Discord servers

---

## ✅ **PREVENTION CHECKLIST**

**Avoid future issues by:**

- [ ] ✅ Using virtual environments (isolates dependencies)
- [ ] ✅ Saving work frequently (Ctrl+S after every change)
- [ ] ✅ Testing incrementally (don't write 100 lines then run)
- [ ] ✅ Using version control (Git - commit working states)
- [ ] ✅ Reading documentation before using new functions
- [ ] ✅ Validating data after each transformation
- [ ] ✅ Keeping backups of working files
- [ ] ✅ Writing comments explaining complex code

---

**Last Updated:** October 10, 2025  
**Covers:** Python, SQL, Jupyter, Tableau, Excel, Git  

**Good luck with your project!** 🍀
