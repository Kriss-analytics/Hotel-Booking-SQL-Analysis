/*==========================================================
                  HOTEL BOOKING ANALYSIS
============================================================

Project: Hotel Booking Analysis Using SQL

Description:
This project analyzes hotel booking data to answer key
business questions related to customer behavior,
revenue generation, booking trends, cancellation
patterns, and seasonal demand.

Tool:
- Microsoft SQL Server Management Studio (SSMS)

Author:
Chris Nwobun

==========================================================*/

/*===============================================================
=========================================================

Question 1

Business Question:
Which market segment generates the highest revenue?
===================================================================
=====================================================*/

SELECT 
market_segment,
ROUND (SUM(Average_Daily_Rate * (stays_in_week_nights + stays_in_weekend_nights)),0) AS total_revenue
FROM [Hotel Dataset]
WHERE Booking_Cancelled = 0
GROUP BY market_segment
ORDER BY total_revenue DESC;

/*=================================================================
=========================================================

Question 2

Business Question:
What is the Average Lead time for Booking?
===================================================================
======================================================*/

SELECT 
ROUND(AVG(Lead_Time_Days), 2) AS avg_lead_time
FROM [Hotel Dataset]
WHERE Booking_Cancelled = 0;

/*==================================================================
========================================================

Question 3

Business Question:
Which Room type have the highest cancellaton rates?
====================================================================
=========================================================*/

SELECT 
reserved_room_type,
COUNT(*) AS total_bookings,
SUM(Booking_Cancelled) AS cancelled_bookings,
ROUND(SUM(Booking_Cancelled) * 100 / COUNT(*), 2) AS cancellation_rate_pct
FROM [Hotel Dataset]
GROUP BY reserved_room_type
ORDER BY cancellation_rate_pct DESC;


/*======================================================================
============================================================

Question 4

Business Question:
How many Bookings were made by each Market Segment?
=========================================================================
============================================================*/

SELECT 
market_segment,
COUNT(*) AS total_bookings
FROM [Hotel Dataset]
GROUP BY market_segment
ORDER BY total_bookings DESC;

/*========================================================================
==============================================================

Question 5

Business Question:
What is the distribution of bookings accross Customer Types?
==========================================================================
==============================================================*/

SELECT 
customer_type,
COUNT(*) AS total_bookings,
ROUND(COUNT(*) * 100.0 / 
(SELECT COUNT(*) FROM [Hotel Dataset]), 2) AS percentage
FROM [Hotel Dataset]
GROUP BY customer_type
ORDER BY total_bookings DESC,
Percentage DESC;

/*==========================================================================
================================================================

Question 6

Business Question:
Which Room types generates the highest Revenue?
=============================================================================
================================================================*/

SELECT 
reserved_room_type,
ROUND(SUM(Average_Daily_Rate * (stays_in_week_nights + stays_in_weekend_nights)), 0) AS total_revenue
FROM [Hotel Dataset]
WHERE Booking_Cancelled = 0
GROUP BY reserved_room_type
ORDER BY total_revenue DESC;

/*=============================================================================
================================================================

Question 7

Business Question:
During which Season is Revenue Highest?
================================================================================
================================================================*/

SELECT 
 CASE
 WHEN MONTH(Arrival_Date) IN (12,1,2) THEN 'Winter'
 WHEN MONTH(Arrival_Date) IN (3,4,5) THEN 'Spring'
 WHEN MONTH(Arrival_Date) IN (6,7,8) THEN 'Summer'
 WHEN MONTH(Arrival_Date) IN (9,10,11) THEN 'Autumn'
 END AS arrival_date_season,
 ROUND (SUM(Average_Daily_Rate * (stays_in_week_nights + stays_in_weekend_nights)),0) AS total_revenue
 FROM [Hotel Dataset]
 GROUP BY 
 CASE
 WHEN MONTH(Arrival_Date) IN (12,1,2) THEN 'Winter'
 WHEN MONTH(Arrival_Date) IN (3,4,5) THEN 'Spring'
 WHEN MONTH(Arrival_Date) IN (6,7,8) THEN 'Summer'
 WHEN MONTH(Arrival_Date) IN (9,10,11) THEN 'Autumn'
 END
 ORDER BY total_revenue DESC;

/*================================================================================
======================================================================

Question 8

Business Question:
Which Countries have most Bookings?
==================================================================================
======================================================================*/

SELECT TOP 10
Country,
COUNT(*) AS total_bookings
FROM [Hotel Dataset]
GROUP BY Country
ORDER BY total_bookings DESC;

/*=================================================================================
=======================================================================

Question 9

Business Question:
What is the Ratio of Repeat Customers vs New Customers?
====================================================================================
=======================================================================*/

SELECT
CASE 
WHEN is_repeated_guest = 1 THEN 'Repeat Customers'
ELSE 'New Customers'
END AS customer_group,
COUNT(*) AS total_bookings,
ROUND(COUNT(*) * 100.0 / 
(SELECT COUNT(*) FROM [Hotel Dataset]), 2) AS percentage
FROM [Hotel Dataset]

GROUP BY 
CASE 
WHEN is_repeated_guest = 1 THEN 'Repeat Customers'
ELSE 'New Customers'
END;

/*====================================================================================
=======================================================================

Question 10

Business Question:
What are the monthly trends in booking numbers?
====================================================================================
=======================================================================*/

SELECT 
    arrival_date_year,
    arrival_date_month,
    COUNT(*) AS total_bookings
FROM [Hotel Dataset]
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year, arrival_date_month;



















