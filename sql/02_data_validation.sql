/*
Project: Accounts Receivable & Collections Analytics
Tool: MySQL

Purpose:
This script validates imported data,
checks consistency, and confirms data quality.
*/


SELECT Invoice_Status,
COUNT(Invoice_ID) AS Invoice_Count,
SUM(Invoice_Value) AS Total_Value
FROM invoices
GROUP BY Invoice_Status;

SELECT *
FROM invoices
WHERE Invoice_Status = 'Seriously Late'
AND Days_Late = 0;

SELECT  Invoice_ID, Invoice_Status, Days_Late, Paid_Date
FROM invoices
WHERE Days_Late = 0
AND Invoice_Status <> 'On Time';

SELECT Customer_ID, SUM(Invoice_Value) AS Seriously_Late_Value
FROM invoices
WHERE Invoice_Status = 'Seriously Late'
GROUP BY Customer_ID
ORDER BY Seriously_Late_Value DESC
LIMIT 10;

SELECT
i.Customer_ID,
c.Industry,
c.Customer_Size,
c.Region,
SUM(i.Invoice_Value) AS Seriously_Late_Value
FROM invoices i
INNER JOIN customers_sql c
ON i.Customer_ID = c.Customer_ID
WHERE i.Invoice_Status = 'Seriously Late'
GROUP BY
    i.Customer_ID,
    c.Industry,
    c.Customer_Size,
    c.Region
ORDER BY Seriously_Late_Value DESC
LIMIT 10;

ALTER TABLE customer_sql
CHANGE `ï»¿customer_ID` customer_ID VARCHAR(50);

SELECT
    i.Customer_ID,
    c.Industry,
    c.Customer_Size,
    c.Region,
    SUM(i.Invoice_Value) AS Seriously_Late_Value
FROM invoices i
INNER JOIN customer_sql c
    ON i.Customer_ID = c.Customer_ID
WHERE i.Invoice_Status = 'Seriously Late'
GROUP BY
    i.Customer_ID,
    c.Industry,
    c.Customer_Size,
    c.Region
ORDER BY Seriously_Late_Value DESC
LIMIT 10;


SELECT
    c.Customer_Size,
    SUM(i.Invoice_Value) AS Seriously_Late_Value
FROM invoices i
INNER JOIN customer_sql c
    ON i.Customer_ID = c.Customer_ID
WHERE i.Invoice_Status = 'Seriously Late'
GROUP BY c.Customer_Size
ORDER BY Seriously_Late_Value DESC;

SELECT
    c.Industry,
    SUM(i.Invoice_Value) AS Seriously_Late_Value
FROM invoices i
INNER JOIN customer_sql c
    ON i.Customer_ID = c.Customer_ID
WHERE i.Invoice_Status = 'Seriously Late'
GROUP BY c.Industry
ORDER BY Seriously_Late_Value DESC;

SELECT
    c.Industry,
    c.Customer_Size,
    SUM(i.Invoice_Value) AS Seriously_Late_Value
FROM invoices i
INNER JOIN customer_sql c
    ON i.Customer_ID = c.Customer_ID
WHERE i.Invoice_Status = 'Seriously Late'
GROUP BY
    c.Industry,
    c.Customer_Size
ORDER BY Seriously_Late_Value DESC;

