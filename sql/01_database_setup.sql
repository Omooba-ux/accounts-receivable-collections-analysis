/*
Project: Accounts Receivable & Collections Analytics
Tool: MySQL

Purpose:
This script creates the database structure
and prepares tables for analysis.
*/

create database AR_Analysis;
use AR_Analysis;

select count(*)
from customer_sql;

select count(*)
from invoices;

select *
from invoices 
limit 5;