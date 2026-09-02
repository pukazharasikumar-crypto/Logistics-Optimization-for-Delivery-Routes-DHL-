-- TASK 1:Data Cleaning & Preparation

-- TASK 1.1:Identify and delete duplicate Order_ID or Shipment_ID records. 

USE dhl_logistic;

SELECT Order_ID, COUNT(*)FROM dhl_orders GROUP BY Order_ID
HAVING COUNT(*) > 1;
-- No duplicate value have order table

SELECT Shipment_ID, COUNT(*)FROM dhl_shipments GROUP BY Shipment_ID
HAVING COUNT(*) > 1;
-- No duplicate value have shipments table

-- TASK 1.2:Replace null or missing Delay_Hours values in the Shipments 
-- Table with the average delay for that Route_ID.
 
SELECT *FROM dhl_shipments WHERE Delay_Hours IS NULL;

-- No NULL values were found in the Delay_Hours column ,so no replacement is requried.

-- TASK 1.3:Convert all date columns (Order_Date, Pickup_Date, Delivery_Date)
-- into YYYY-MM-DD HH:MM:SS format using SQL date functions. 


UPDATE dhl_orders SET Order_Date = DATE_FORMAT(Order_Date, '%Y-%m-%d %H:%i:%s');
SELECT Order_Date FROM dhl_orders  LIMIT 5;

UPDATE dhl_shipments SET Pickup_Date = DATE_FORMAT(Pickup_Date, '%Y-%m-%d %H:%i:%s'),
Delivery_Date = DATE_FORMAT(Delivery_Date, '%Y-%m-%d %H:%i:%s');
SELECT Pickup_Date, Delivery_Date FROM dhl_shipments LIMIT 5;

-- Task 1.4:Ensure that no Delivery_Date occurs before Pickup_Date (flag such records). 

ALTER TABLE dhl_shipments ADD Date_Status VARCHAR(20);
UPDATE dhl_shipments SET Date_Status =CASE
WHEN Delivery_Date < Pickup_Date THEN 'Invalid'ELSE 'Valid'END;
SELECT Shipment_ID,Pickup_Date,Delivery_Date,Date_Status
FROM dhl_shipments;
 
 -- TASK 1.5:Validate referential integrity between Orders, Routes, Warehouses, 
 -- and Shipments.
 -- Route_ID Integrity
 
 SELECT o.* FROM dhl_orders o LEFT JOIN dhl_routes r ON o.Route_ID = r.Route_ID
WHERE r.Route_ID IS NULL;

-- Warehouse_ID Integrity

SELECT o.*FROM dhl_orders o LEFT JOIN dhl_warehouses w ON o.Warehouse_ID = w.Warehouse_ID
WHERE w.Warehouse_ID IS NULL;

-- Order_ID Integrity

SELECT s.*FROM dhl_shipments s LEFT JOIN dhl_orders o ON s.Order_ID = o.Order_ID
WHERE o.Order_ID IS NULL;

-- ALL RELATIONSHIP ARE MAINTAIN CORRECTLY--

--                   TASK 1 IS COMPLETED                            --
