# Dataset Documentation

## Overview

This project uses an Accounts Receivable dataset designed to simulate a company's invoice and customer payment environment.

The dataset represents a typical finance workflow where businesses issue invoices to customers, monitor payment activity, and track outstanding receivables.

The purpose of analysing this dataset is to understand customer payment behaviour, identify receivables ageing risks, measure outstanding balances, and determine where collection efforts should be prioritised.

The dataset consists of two connected tables:

1. Invoice Data
2. Customer Data

# Invoice Dataset

The Invoice dataset represents transactional billing activity.

Each row represents an individual invoice issued to a customer. The table contains the financial and payment information required to analyse invoice performance, payment behaviour, outstanding receivables, and ageing risk.

# Customer Dataset

The Customer dataset contains customer-level attributes that provide additional business context for invoice transactions.

While the Invoice table explains the financial activity, the Customer table helps identify where receivables exposure is concentrated across different industries, customer sizes, and regions.

---

# Relationship Between Tables

The Invoice and Customer datasets were connected using the `Customer_ID` field.

This relationship allowed invoice-level financial information to be analysed alongside customer-level characteristics.

By combining both tables, the analysis was able to answer questions such as:

- Which customers contribute the highest outstanding balances?
- Which industries have greater receivables exposure?
- How does payment behaviour differ across customer segments?

The relationship between these tables transformed the analysis from simply measuring unpaid invoices into understanding the business factors contributing to receivables risk.

# Data Quality Assessment & Validation

Before analysis, the dataset was reviewed to ensure accuracy, consistency, and suitability for financial analysis.

The validation process focused on identifying issues that could affect receivables calculations and reporting accuracy.

## Missing Value Checks

Missing values were reviewed across key fields including:

- Paid_Date
- Days_Late
- Customer_ID
- Invoice-related fields

The purpose was to determine whether missing values represented data quality issues or valid unavailable information.

## Days_Late Handling

The Days_Late field was reviewed because missing values could affect payment delay analysis.

Blank Days_Late values were investigated alongside payment information to determine whether payment delays could be calculated.

Where payment completion information was unavailable, Days_Late values were retained as unavailable rather than replaced with zero.

This prevented unpaid invoices from being incorrectly classified as invoices paid on time.

## Duplicate Checks

Duplicate checks were performed to ensure that:

- Invoice records represented unique transactions
- Duplicate entries did not inflate financial calculations
- Customer records remained consistent

## Date Consistency Checks

Date fields were reviewed to ensure logical relationships between:

- Invoice_Date
- Due_Date
- Paid_Date

These checks supported accurate calculations for:

- Payment delays
- Ageing categories
- Collection analysis

## Relationship Validation

The connection between Invoice and Customer tables was checked to ensure:

- Invoice records contained valid Customer_ID values
- Customer information could be correctly linked
- Customer segmentation analysis could be performed reliably
