# Dataset Documentation

## Overview

This project uses Accounts Receivable data consisting of invoice transactions and customer information.

The dataset was designed to analyse customer payment behaviour, outstanding receivables, ageing patterns, and collection risk.

The data consists of two main tables:

1. Invoice Data
2. Customer Data

---

# Invoice Dataset

The invoice dataset contains transactional information related to customer invoices, payments, and receivables status.

## Fields

| Field | Description |
|---|---|
| Invoice_ID | Unique identifier assigned to each invoice |
| Customer_ID | Unique identifier linking invoices to customers |
| Invoice_Date | Date the invoice was issued |
| Due_Date | Date payment was expected |
| Paid_Date | Date payment was received |
| Invoice_Value | Monetary value of the invoice |
| Invoice_Status | Payment status classification |
| Days_Late | Number of days payment exceeded the due date |
| Payment_Terms | Agreed payment period |
| Region | Customer location category |
| Industry | Customer industry classification |
| Customer_Size | Customer segment classification |

---

# Customer Dataset

The customer dataset contains customer-level information used to analyse receivables exposure across different segments.

## Fields

| Field | Description |
|---|---|
| Customer_ID | Unique identifier assigned to each customer |
| Industry | Industry classification of the customer |
| Customer_Size | Customer segment (SME, Mid-Size, Enterprise) |
| Region | Geographic customer grouping |

---

# Data Preparation

Before analysis, the dataset was reviewed and prepared to ensure accuracy and reliability.

Preparation activities included:

- Reviewing table structures
- Validating financial fields
- Checking payment information
- Reviewing missing values
- Creating analytical categories for reporting
- Preparing data for SQL analysis and Power BI visualisation

---

# Business Use Cases

The dataset supports analysis of:

## Receivables Performance

Understanding:

- Total invoice value
- Outstanding balances
- Payment behaviour
- Collection performance

## Ageing Analysis

Evaluating:

- Recently overdue invoices
- Long outstanding balances
- Collection priority areas

## Customer Risk Analysis

Identifying:

- High-exposure customers
- Industry concentration
- Customer segments contributing to receivables risk

---

# Data Limitations

The dataset represents a structured analytical environment and may not include all operational factors that influence collections, such as:

- Customer communication history
- Contract terms
- Dispute reasons
- External economic conditions

The analysis focuses on identifying patterns within available invoice and customer information.
