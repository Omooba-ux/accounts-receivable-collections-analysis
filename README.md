# Accounts Receivable & Collections Analytics

![Executive Dashboard](screenshots/executive_overview_dashboard.png)

An end-to-end finance analytics project analysing invoice performance, payment behaviour, receivables ageing, and customer exposure using Excel, MySQL, and Power BI.

# Accounts Receivable & Collections Analytics

## Project Overview

Revenue does not always translate into cash flow.

This project analyses Accounts Receivable performance to understand invoice payment behaviour, identify collection risks, and uncover where outstanding receivables are concentrated.

Using invoice and customer data, I developed an end-to-end analytics solution that moves from data preparation to business reporting:

**Excel → MySQL/SQL → Power BI**

The objective was to transform raw financial data into insights that could support better collection decisions and improve visibility into receivables performance.

---

# Business Problem

Businesses rely on timely customer payments to maintain healthy cash flow. However, delayed payments and ageing receivables can create financial pressure.

This project aims to answer:

- How much has been invoiced?
- How much remains outstanding?
- Which invoices represent the highest collection risk?
- How old are outstanding receivables?
- Which customers, industries, or segments contribute the highest exposure?
- How can data support more effective collection strategies?

---

# Dataset Description

The dataset consists of invoice transaction records and customer information used to analyse receivables performance.

## Invoice Dataset

Contains:

- Invoice ID
- Customer ID
- Invoice Date
- Due Date
- Paid Date
- Invoice Value
- Payment Status
- Days Late

## Customer Dataset

Contains:

- Customer ID
- Industry
- Customer Size
- Region

---

# Dataset Scale

| Metric | Value |
|---|---|
| Total Invoice Records | 4,506 |
| Total Invoice Value | $15.54M |
| Customers Analysed | 100 |
| Analysis Area | Accounts Receivable & Collections |

---

# Tools & Skills Demonstrated

## Excel

Skills demonstrated:

- Data preparation
- Data validation
- Financial calculations
- PivotTable analysis
- Exploratory analysis

---

## MySQL / SQL

Skills demonstrated:

- Database creation
- Data importing and validation
- Table relationships
- Data aggregation
- Conditional logic
- Date calculations
- Receivables analysis

---

## Power BI

Skills demonstrated:

- Data modelling
- KPI development
- Interactive dashboard design
- Customer segmentation
- Receivables reporting
- Business storytelling

---

# Project Workflow

## 1. Data Preparation (Excel)

The dataset was reviewed and prepared by:

- Checking data consistency
- Validating financial fields
- Reviewing payment information
- Creating analytical fields required for reporting

---

## 2. SQL Analysis (MySQL)

The prepared dataset was structured in MySQL to:

- Validate financial metrics
- Analyse payment performance
- Calculate outstanding receivables
- Identify customer exposure patterns

---

## 3. Power BI Dashboard

The final dashboard presents:

- Invoice performance
- Payment behaviour
- AR ageing
- Customer risk exposure
- Collection insights

---

# Key Insights

Some of the analysis findings include:

- Total invoice value analysed: **$15.54M**
- Outstanding receivables identified: **$1.56M**
- Seriously late exposure identified: **$2.32M**
- Significant exposure was concentrated within older ageing categories

---

# Business Recommendations

Based on the analysis:

- Prioritise collection efforts using receivables ageing categories
- Monitor customers with consistently high outstanding balances
- Improve visibility of overdue invoices through regular reporting
- Use customer segmentation to support targeted collection strategies

---

# Repository Structure

├── dataset
├── excel
├── sql
├── powerbi
├── screenshots
├── insights
└── README.md


---

# Author

**Aderonke Ojedokun**

Accounting Graduate | Data Analytics Portfolio

Skills:
Excel | MySQL | Power BI | Financial Analysis

---

# Project Navigation

| Section | Description |
|---|---|
| Dataset | Dataset structure and field documentation |
| Excel | Data preparation and initial analysis |
| SQL | Database setup, validation, and financial analysis queries |
| Power BI | Interactive dashboard development |
| Insights | Business findings and recommendations |

---

# Key Project Highlights

📌 Analysed **4,506 invoice records**  
📌 Evaluated **$15.54M total invoice value**  
📌 Identified receivables exposure and ageing risks  
📌 Built customer risk segmentation analysis  
📌 Developed an interactive Power BI dashboard  

---

# Tools Used

| Tool | Purpose |
|---|---|
| Excel | Data preparation and exploratory analysis |
| MySQL | Database management and SQL analysis |
| SQL | Financial analysis and validation |
| Power BI | Dashboard development and reporting |

---
