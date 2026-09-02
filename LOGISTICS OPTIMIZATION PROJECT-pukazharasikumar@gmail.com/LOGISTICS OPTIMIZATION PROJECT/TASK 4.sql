-- Task 4: Warehouse Performance 

-- TASK 4.1:Find the top 3 warehouses with the highest average delay in shipments dispatched

CREATE VIEW Top3_Delayed_Warehouses AS
SELECT Warehouse_ID,AVG(Delay_Hours) AS Avg_Delay_Hours
FROM dhl_shipments GROUP BY Warehouse_ID
ORDER BY Avg_Delay_Hours DESC LIMIT 3;

SELECT *FROM Top3_Delayed_Warehouses;

-- TASK 4.2:Calculate total shipments vs delayed shipments for each warehouse. 

CREATE VIEW Warehouse_Shipment_Delay_Summary AS
SELECT Warehouse_ID,COUNT(*) AS Total_Shipments,
SUM(CASE
	WHEN Delay_Hours > 0 THEN 1
	ELSE 0
	END) AS Delayed_Shipments
FROM dhl_shipments GROUP BY Warehouse_ID;

SELECT *FROM Warehouse_Shipment_Delay_Summary;

-- TASK :4.3:

CREATE VIEW High_Delay_Warehouses AS
WITH GlobalAvg AS (SELECT AVG(Delay_Hours) AS AvgDelay
FROM dhl_shipments)SELECT Warehouse_ID,AVG(Delay_Hours) AS Warehouse_Avg_Delay
FROM dhl_shipments GROUP BY Warehouse_ID
HAVING AVG(Delay_Hours) >(SELECT AvgDelay FROM GlobalAvg);

SELECT * FROM High_Delay_Warehouses;

-- TASK 4.4:Rank all warehouses based on on-time delivery percentage.

CREATE VIEW Warehouse_OnTime_Ranking AS
SELECT Warehouse_ID,ROUND(SUM(CASE WHEN Delay_Hours = 0 THEN 1 ELSE 0 END) * 100.0
/ COUNT(*), 2) AS OnTime_Percentage,RANK() OVER (ORDER BY
SUM(CASE WHEN Delay_Hours = 0 THEN 1 ELSE 0 END) * 100.0
/ COUNT(*) DESC) AS Warehouse_Rank
FROM dhl_shipments GROUP BY Warehouse_ID;

SELECT * FROM Warehouse_OnTime_Ranking;


