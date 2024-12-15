USE Gs

SELECT * FROM Zomato_Data

--What is the total revenue generated daily and monthly?
SELECT Date, SUM(Order_Value) AS Total_Revenue
FROM Zomato_Data
WHERE Delivery_Status  = 'Delivered'
GROUP BY Date 

--Which restaurants have the highest total revenue?
SELECT TOP 10 Restaurant_Name,SUM(Order_Value) AS Total_Revenue 
FROM Zomato_Data
WHERE Delivery_Status  = 'Delivered'
GROUP BY Restaurant_Name
ORDER BY Total_Revenue DESC

--How many orders were delivered, pending, or cancelled?
SELECT Delivery_Status, COUNT(*) AS	Order_Count
FROM Zomato_Data
GROUP BY Delivery_Status 

--What are the most common reasons for order cancellations?
SELECT Order_Cancellation_Reason , COUNT(*) AS Cancelletion_Count  
FROM Zomato_Data
WHERE Delivery_Status = 'Cancelled' 
GROUP BY Order_Cancellation_Reason 
Order BY Cancelletion_Count DESC;

--Who are the top 10 customers by order frequency and value?
SELECT TOP 10 Customer_ID, COUNT(*) AS Order_Count , SUM(Order_Value) AS Total_Spend
FROM Zomato_Data
WHERE Delivery_Status = 'Delivered'
GROUP BY Customer_ID 
ORDER BY Total_Spend DESC

--What is the average delivery time for each restaurant?
SELECT Restaurant_Name ,AVG(Delivery_Time) AS Avg_Delivery_time
FROM Zomato_Data
WHERE Delivery_Status = 'Delivered'
GROUP BY Restaurant_Name
ORDER BY Avg_Delivery_time ASC

--Which restaurant categories are ordered the most?
SELECT Restaurant_Category, COUNT(*) AS Order_Count
FROM Zomato_Data 
GROUP BY Restaurant_Category
ORDER BY Order_Count DESC

--What is the total discount given daily?
SELECT Date, SUM(Discount_Applied) AS Total_Discount
FROM Zomato_Data
WHERE Discount_Applied > 0 
GROUP BY Date
ORDER BY DATE ASC


--What is the average customer and driver rating?
SELECT Date, AVG(Customer_Rating) AS Avg_Customer_Rating, AVG(Driver_Rating) AS Avg_Driver_Rating
FROM Zomato_Data
WHERE Delivery_Status = 'Delivered'
GROUP BY Date 
Order BY Date ASC


SELECT DATEPART(HOUR, Time) AS Busiest_Hour, COUNT(*) AS Order_Count
FROM Zomato_Data
GROUP BY DATEPART(HOUR, Time)
ORDER BY Order_Count DESC
