# Setup Guide

Environment setup and project configuration for Customer Churn Analysis.

## Prerequisites

- Python 3.9+ installed
- 2-3 GB disk space
- 1-2 hours for initial setup

## Quick Setup

### 1. Create Virtual Environment

**Windows (PowerShell):**
```powershell
python -m venv venv
.\venv\Scripts\Activate
```

**Mac/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

### 2. Install Dependencies

```powershell
# Upgrade pip
python -m pip install --upgrade pip

# Install requirements
pip install -r requirements.txt

# Verify
python -c "import pandas, numpy, sklearn, matplotlib, seaborn, jupyter; print('✅ All packages installed')"
```

### 3. Launch Jupyter

```powershell
jupyter notebook
```

## Project Structure

```
Customer Churn Prediction & Analysis/
├── data/
│   ├── raw/                       # Original datasets
│   ├── processed/                 # Cleaned data, query results
│   └── dashboard_ready/           # Dashboard exports
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   ├── 02_sql_analysis.ipynb
│   ├── 03_modeling.ipynb
│   └── 04_dashboard_prep.ipynb
├── sql/                           # SQL queries
├── models/                        # Saved ML models
├── outputs/                       # Figures, reports
├── dev_docs/                      # Developer documentation
└── requirements.txt
```

## Running Notebooks

Execute notebooks in order:

```python
# 1. Data Exploration
# Creates: data/processed/customers_cleaned.csv
# Time: 15-20 minutes

# 2. SQL Analysis
# Creates: data/processed/query_*.csv files
# Time: 20-30 minutes

# 3. Modeling
# Creates: models/*.joblib files
# Time: 10-15 minutes

# 4. Dashboard Prep
# Creates: data/dashboard_ready/*.csv files
# Time: 5-10 minutes
```

## Configuration

### Path Setup

Add to notebook cells:

```python
import os
from pathlib import Path

PROJECT_ROOT = Path.cwd()
DATA_DIR = PROJECT_ROOT / 'data'
RAW_DATA_PATH = DATA_DIR / 'raw' / 'telco_customer_churn.csv'
PROCESSED_DIR = DATA_DIR / 'processed'
```

### Create Output Directories

```python
PROCESSED_DIR.mkdir(exist_ok=True)
(DATA_DIR / 'dashboard_ready').mkdir(exist_ok=True)
Path('outputs/figures').mkdir(parents=True, exist_ok=True)
```

## Testing Reproducibility

Test fresh install:

```powershell
# 1. Deactivate and remove venv
deactivate
Remove-Item -Recurse -Force venv

# 2. Delete generated files
Remove-Item data/processed/*.csv
Remove-Item models/*.joblib

# 3. Recreate from scratch
python -m venv venv
.\venv\Scripts\Activate
pip install -r requirements.txt

# 4. Run all notebooks
jupyter notebook
# Execute: Kernel → Restart & Run All
```

## Common Setup Issues

### Virtual Environment Activation

**Issue:** PowerShell execution policy error

**Fix:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Package Installation

**Issue:** ModuleNotFoundError after pip install

**Fix:**
```powershell
# Ensure venv is activated (prompt shows "(venv)")
pip list  # Should show installed packages
pip install -r requirements.txt --force-reinstall
```

### Jupyter Kernel

**Issue:** Jupyter doesn't see venv packages

**Fix:**
```powershell
pip install jupyter ipykernel
python -m ipykernel install --user --name=venv
# In Jupyter: Kernel → Change Kernel → venv
```

## Requirements.txt Contents

```
pandas==2.1.0
numpy==1.25.2
scikit-learn==1.3.0
matplotlib==3.7.2
seaborn==0.12.2
jupyter==1.0.0
openpyxl==3.1.2
joblib==1.3.2
```

## Verification Checklist

After setup, verify:

- [ ] Virtual environment activated
- [ ] All packages installed (`pip list`)
- [ ] Jupyter launches successfully
- [ ] Can import pandas, sklearn, matplotlib
- [ ] Data files accessible
- [ ] Output directories created

## Next Steps

1. Read [sql_concepts.md](sql_concepts.md) for query explanations
2. Review [python_excel_automation.md](python_excel_automation.md) for automation details
3. Check [troubleshooting.md](troubleshooting.md) if issues arise
