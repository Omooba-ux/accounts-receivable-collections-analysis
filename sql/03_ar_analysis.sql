/*
Project: Accounts Receivable & Collections Analytics
Tool: MySQL

Purpose:
This script analyses invoice performance,
payment behaviour, and accounts receivable ageing.
*/

SELECT Invoice_ID, Days_Late, Invoice_Status,
    CASE
        WHEN Days_Late = 0 THEN 'On Time'
        WHEN Days_Late BETWEEN 1 AND 15 THEN 'Paid Late'
        WHEN Days_Late > 15 THEN 'Seriously Late'
        ELSE 'Unknown'
    END AS Calculated_Status
FROM invoices
LIMIT 20;

SELECT
    CASE
        WHEN Days_Late = 0 THEN 'On Time'
        WHEN Days_Late BETWEEN 1 AND 15 THEN 'Paid Late'
        WHEN Days_Late > 15 THEN 'Seriously Late'
        ELSE 'Unknown'
    END AS Calculated_Status,
    COUNT(*) AS Invoice_Count,
    SUM(Invoice_Value) AS Total_Value
FROM invoices
GROUP BY Calculated_Status
ORDER BY Invoice_Count DESC;

SELECT
    COUNT(*) AS Status_Mismatches
FROM invoices
WHERE Invoice_Status <>
    CASE
        WHEN Days_Late = 0 THEN 'On Time'
        WHEN Days_Late BETWEEN 1 AND 15 THEN 'Paid Late'
        WHEN Days_Late > 15 THEN 'Seriously Late'
        ELSE 'Unknown'
    END;
    
    WITH customer_risk AS (
    SELECT
        Customer_ID,
        SUM(Invoice_Value) AS Seriously_Late_Value
    FROM invoices
    WHERE Invoice_Status = 'Seriously Late'
    GROUP BY Customer_ID
)

SELECT *
FROM customer_risk
ORDER BY Seriously_Late_Value DESC
LIMIT 10;


WITH customer_risk AS (
    SELECT
        Customer_ID,
        SUM(Invoice_Value) AS Seriously_Late_Value
    FROM invoices
    WHERE Invoice_Status = 'Seriously Late'
    GROUP BY Customer_ID
)

SELECT
    Customer_ID,
    Seriously_Late_Value,
    ROUND(
        Seriously_Late_Value /
        SUM(Seriously_Late_Value) OVER () * 100,
        2
    ) AS Percentage_of_Seriously_Late
FROM customer_risk
ORDER BY Seriously_Late_Value DESC
LIMIT 10;

SELECT
    CASE
        WHEN DATEDIFF('2026-06-20', Invoice_Date) <= 30 THEN '0-30 Days'
        WHEN DATEDIFF('2026-06-20', Invoice_Date) <= 60 THEN '31-60 Days'
        WHEN DATEDIFF('2026-06-20', Invoice_Date) <= 90 THEN '61-90 Days'
        ELSE '90+ Days'
    END AS AR_Age_Bucket,
    SUM(Invoice_Value) AS Outstanding_Value,
    COUNT(*) AS Invoice_Count
FROM invoices
WHERE Paid_Date = ''
GROUP BY AR_Age_Bucket
ORDER BY
    CASE
        WHEN AR_Age_Bucket = '0-30 Days' THEN 1
        WHEN AR_Age_Bucket = '31-60 Days' THEN 2
        WHEN AR_Age_Bucket = '61-90 Days' THEN 3
        ELSE 4
    END;
    
    SELECT
    Invoice_ID,
    Invoice_Date,
    DATEDIFF('2026-06-20', Invoice_Date) AS Outstanding_Days
FROM invoices
WHERE Paid_Date = ''
ORDER BY Invoice_Date DESC
LIMIT 10;

SELECT
    Invoice_ID,
    Invoice_Date,
    STR_TO_DATE(Invoice_Date, '%d/%m/%Y') AS Converted_Date,
    DATEDIFF(
        '2026-06-20',
        STR_TO_DATE(Invoice_Date, '%d/%m/%Y')
    ) AS Outstanding_Days
FROM invoices
WHERE Paid_Date = ''
LIMIT 10;