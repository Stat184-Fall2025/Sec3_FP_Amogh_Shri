Goal

The goal of this project is to assess the likelihood and characteristics of a potential 2026 recession by analyzing historical macroeconomic indicators, comparing them to current conditions, and identifying which patterns reliably precede recessions. We use EDA to uncover patterns, trends, and relationships in economic data, and CDA to test hypotheses grounded in economic theory. This supports both discovery and validation in an inherently uncertain forecasting environment.

Needs
We are using publicly available data such as
GDP growth<br>
Housing price indices <br>
Inflation<br>
Unemployment Rate<br>

FAIR Principles
Findable: Data comes from an established repository
Accessible: All data are open to access without paywalls
Interoperable: Data is stored in CSV with clear variable names
Reusable: Data licenses allow us to reuse, which is also approved

CARE Principles
Although the data doesn't provide community-owned information. CARE can be applied to a global scale

R Packages used
- quantmod
- tidyverse
- tidyquant
- knitr
- zoo

1. Instructions/Steps
- create repo to rubric
- add collaborators
- create dev branches
- set up issues
- create folder structures

2. Import Data
- Using tq_get() and quantmod, import:
-load packages
-Use quantmod to get S&P500,CPI, Unemployment Rate, etc.
= S&P 500 (various windows: 2007, 2020, 2025, 1990–present)

3. Cleaning
- Clean column names
- Standardize date formats
- Align frequencies (daily, monthly, quarterly)
- Create new features:
- Yield curve spread (10Y–2Y)
- Inflation normalization
- S&P 500 normalization
- Label recession and pre‑recession windows

4.
Federal Funds Rate
- Retrieve FEDFUNDS
-Visualize policy rate trajectory
- Interpret policy tightening/loosening cycles
Inflation (CPI)
-Retrieve CPI
-Normalize CPI and S&P 500
-Compare inflation pressure vs market behavior
Yield Curve Spread
-Retrieve DGS10 and DGS2
-Compute spread
-Identify inversion periods
Past & Potential Recession Comparisons
-Normalize S&P 500 across crisis windows
-Compare shapes of 2007, 2020, and 2025 trajectories
-Identify similarities and divergences
-Combined Wrangling
-Consolidate Fed, CPI, S&P, and Yield Curve data
-Prepare unified datasets for EDA/CDA

5.Avoiding False Positives
-Identify periods with recession
-Compare macroeconomic conditions to confirmed recessions
-Identify missing supporting indicators
-Distinguish necessary vs. sufficient conditions

6.Exploratory Data Analysis 
-dplyr::summarize()
-psych::describe()
-Present results using knitr::kable()
-Create visualizations:
 -Yield curve spread
 -Federal Funds Rate
 -CPI vs S&P 500
 -Normalized crisis trajectories
 -Long‑term S&P 500
 -Use colorblind‑friendly palettes


7.Confirmatory Data Analysis 
Test hypotheses such as:
-“Yield curve inversion precedes recessions with X% reliability”
-“Inflation persistence increases recession likelihood”

8. Post‑Recession Recovery Analysis
- Measure recovery time for GDP and employment
-Compare recovery shapes (V‑shaped, U‑shaped, prolonged)
-Identify indicators predicting recovery speed
-Apply insights to potential 2026 recovery scenarios

9.FAIR, CARE, and Ethical Considerations
-Document provenance for each dataset
-Evaluate FAIR principles
-Evaluate CARE principles
-Discuss limitations of applying CARE to macroeconomic data

10.Report Writing
-Write narrative sections in final_report.qmd
-Add cross‑references for tables and figures
-Render to PDF reproducibly

