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






