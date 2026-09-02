-- TASK 7:Advanced KPI Reporting 

-- TASK 7.1:Average Delivery Delay per Source_Country

CREATE VIEW KPI_Avg_Delay_By_Country AS
SELECT r.Source_Country,ROUND(AVG(s.Delay_Hours),2) AS Avg_Delay_Hours
FROM dhl_routes r JOIN dhl_shipments s ON r.Route_ID = s.Route_ID
GROUP BY r.Source_Country;

SELECT * FROM KPI_Avg_Delay_By_Country;

-- TASK 7.2:KPI_OnTime_Delivery

CREATE VIEW KPI_OnTime_Delivery AS
SELECT COUNT(*) AS Total_Deliveries,SUM(CASE WHEN Delay_Hours = 0 THEN 1 ELSE 0 END) AS OnTime_Deliveries,
ROUND(SUM(CASE WHEN Delay_Hours = 0 THEN 1 ELSE 0 END)* 100.0 / COUNT(*), 2) AS OnTime_Percentage
FROM dhl_shipments;

SELECT * FROM KPI_OnTime_Delivery;

-- TASK 7.3:Average Delay (in hours) per Route_ID.
CREATE VIEW Avg_Delay_Per_Route AS
SELECT Route_ID,AVG(Delay_Hours) AS Avg_Delay_Hours
FROM dhl_shipments GROUP BY Route_ID;

SELECT * FROM avg_delay_per_route;

-- TASK 7.4:Warehouse Utilization %

CREATE VIEW KPI_Warehouse_Utilization AS
SELECT w.Warehouse_ID,COUNT(s.Shipment_ID) AS Shipments_Handled,
w.Capacity_per_day,ROUND(COUNT(s.Shipment_ID) * 100.0 / w.Capacity_per_day,
2) AS Utilization_Percentage FROM dhl_warehouses w JOIN dhl_shipments s
ON w.Warehouse_ID = s.Warehouse_ID GROUP BY w.Warehouse_ID, w.Capacity_per_day;

SELECT * FROM KPI_Warehouse_Utilization;

