USE dhl_logistic

-- Task 2: Delivery Delay Analysis --

-- Task 2.1:Calculate delivery delay (in hours) for each shipment --

 ALTER TABLE dhl_shipments ADD Delivery_Delay_Hours INT;
 UPDATE dhl_shipments SET Delivery_Delay_Hours =TIMESTAMPDIFF
 (HOUR, Pickup_Date, Delivery_Date);
 CREATE VIEW Cal_delivery_delay AS
 SELECT Shipment_ID,Pickup_Date,Delivery_Date,Delivery_Delay_Hours
FROM dhl_shipments;
SELECT * FROM cal_delivery_delay;

-- Task 2.2:Find the Top 10 delayed routes based on average delay hours.

CREATE VIEW Top10_Delayed_Routes AS
SELECT Route_ID,AVG(Delivery_Delay_Hours) AS Avg_Delay_Hours
FROM dhl_shipments GROUP BY Route_ID ORDER BY Avg_Delay_Hours
DESC LIMIT 10;

SELECT * FROM top10_delayed_routes;


-- TASK 2.3:Use SQL window functions to rank shipments by 
-- delay within each Warehouse_ID.

CREATE VIEW Shipment_Delay_Ranking AS
SELECT Shipment_ID,Warehouse_ID,Delivery_Delay_Hours,RANK() 
OVER (PARTITION BY Warehouse_ID ORDER BY Delivery_Delay_Hours 
DESC) AS Delay_Rank FROM dhl_shipments; 

SELECT * FROM Shipment_Delay_Ranking;
-- WOO1 HAVE POOR PREFORMANCE IN DELIVAERY--

-- TASK 2.4 Identify the average delay per Delivery_Type (Express / Standard) to compare 
-- service-level efficiency. 

CREATE VIEW Delivery_Type_Efficiency AS
SELECT o.Delivery_Type,AVG(s.Delivery_Delay_Hours) AS Avg_Delay_Hours
FROM dhl_orders o JOIN dhl_shipments s ON o.Order_ID = s.Order_ID
GROUP BY o.Delivery_Type;
SELECT * FROM Delivery_Type_Efficiency;

-- STANDARD TYPE OF DELIVERY IS BETTER PERFORMANCE--


