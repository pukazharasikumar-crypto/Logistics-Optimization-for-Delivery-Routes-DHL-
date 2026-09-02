-- TASK 6:Shipment Tracking Analytics 

DESC dhl_shipments;
-- TASK 6.1:For each shipment, display the latest status (Delivered, In Transit, or Returned) along 
-- with the latest Delivery_Date. 

CREATE VIEW Shipment_Latest_Status AS
SELECT Shipment_ID, Delivery_Status,Delivery_Date FROM dhl_shipments;
SELECT * FROM Shipment_Latest_Status;

-- TASK 6.2:Identify routes where the majority of shipments are still “In Transit” or “Returned”. 

CREATE VIEW Route_Status_Analysis AS
SELECT Route_ID, COUNT(*) AS Total_Shipments, SUM(CASE
WHEN Delivery_Status IN ('In Transit','Returned')THEN 1
ELSE 0 END) AS InTransit_Returned_Count
FROM dhl_shipments GROUP BY Route_ID;
SELECT * FROM Route_Status_Analysis;

SELECT * FROM Route_Status_Analysis where InTransit_Returned_Count > 5 ORDER BY InTransit_Returned_Count desc  ;

-- TASK 6.3: Find the most frequent delay reasons (if available in delay-related columns or flags).

CREATE VIEW Frequent_Delay_Reasons AS
SELECT Delay_Reason,COUNT(*) AS Frequency FROM dhl_shipments
GROUP BY Delay_Reason ORDER BY Frequency DESC;

SELECT *FROM Frequent_Delay_Reasons;

--   TASK 6.4:Identify orders with exceptionally high delay (>120 hours) to investigate potential bottlenecks. 

CREATE VIEW High_Delay_Orders AS
SELECT Order_ID,Shipment_ID,Route_ID, Warehouse_ID, Delay_Hours,Delay_Reason
FROM dhl_shipments WHERE Delay_Hours > 120;

SELECT *FROM High_Delay_Orders order by Delay_Hours DESC;






