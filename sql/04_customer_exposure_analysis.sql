/*
Project: Accounts Receivable & Collections Analytics
Tool: MySQL

Purpose:
This script analyses customer-level exposure,
outstanding balances, and risk concentration.
*/

SELECT
    CASE
        WHEN DATEDIFF('2026-06-20', STR_TO_DATE(Invoice_Date, '%d/%m/%Y')) <= 30
            THEN '0-30 Days'
        WHEN DATEDIFF('2026-06-20', STR_TO_DATE(Invoice_Date, '%d/%m/%Y')) <= 60
            THEN '31-60 Days'
        WHEN DATEDIFF('2026-06-20', STR_TO_DATE(Invoice_Date, '%d/%m/%Y')) <= 90
            THEN '61-90 Days'
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
    i.Customer_ID,
    SUM(i.Invoice_Value) AS Outstanding_AR
FROM invoices i
WHERE i.Paid_Date = ''
  AND i.Write_Off_Flag <> 'Yes'
GROUP BY i.Customer_ID
ORDER BY Outstanding_AR DESC
LIMIT 10;

SELECT i.Customer_ID, c.Industry, c.Customer_Size, c.Region,
SUM(i.Invoice_Value) AS Outstanding_AR
FROM invoices i
INNER JOIN customer_sql c
ON i.Customer_ID = c.Customer_ID
WHERE i.Paid_Date = ''
AND i.Write_Off_Flag <> 'Yes'
GROUP BY
i.Customer_ID,
c.Industry,
c.Customer_Size,
c.Region
ORDER BY Outstanding_AR DESC
LIMIT 10;


WITH customer_ar AS ( SELECT i.Customer_ID, SUM(i.Invoice_Value) AS Outstanding_AR
FROM invoices i
WHERE i.Paid_Date = ''
AND i.Write_Off_Flag <> 'Yes'
GROUP BY i.Customer_ID
)

SELECT
    Customer_ID,
    Outstanding_AR,
    ROUND(
        Outstanding_AR /
        SUM(Outstanding_AR) OVER () * 100,
        2
    ) AS Percentage_of_Total_AR
FROM customer_ar
ORDER BY Outstanding_AR DESC
LIMIT 10;

WITH customer_ar AS (
    SELECT
        i.Customer_ID,
        SUM(i.Invoice_Value) AS Outstanding_AR
    FROM invoices i
    WHERE i.Paid_Date = ''
      AND i.Write_Off_Flag <> 'Yes'
    GROUP BY i.Customer_ID
)

SELECT
    ca.Customer_ID,
    c.Industry,
    c.Customer_Size,
    c.Region,
    ca.Outstanding_AR,
    ROUND(
        ca.Outstanding_AR /
        SUM(ca.Outstanding_AR) OVER () * 100,
        2
    ) AS Percentage_of_Total_AR
FROM customer_ar ca
INNER JOIN customer_sql c
    ON ca.Customer_ID = c.Customer_ID
ORDER BY ca.Outstanding_AR DESC
LIMIT 10;


SELECT
    COUNT(*) AS Total_Invoices,
    SUM(Invoice_Value) AS Total_Invoice_Value,

    SUM(
        CASE
            WHEN Paid_Date = '' THEN Invoice_Value
            ELSE 0
        END
    ) AS Outstanding_Exposure,

    SUM(
        CASE
            WHEN Paid_Date = ''
             AND Write_Off_Flag <> 'Yes'
            THEN Invoice_Value
            ELSE 0
        END
    ) AS Collectible_AR,

    SUM(
        CASE
            WHEN Invoice_Status = 'Seriously Late'
            THEN Invoice_Value
            ELSE 0
        END
    ) AS Seriously_Late_Exposure
FROM invoices;