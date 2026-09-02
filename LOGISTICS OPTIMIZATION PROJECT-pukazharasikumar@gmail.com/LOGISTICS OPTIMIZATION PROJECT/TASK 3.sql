-- TASK:3 Route Optimization Insights

-- TASk 3.1:Average transit time (in hours) across all shipments. 

CREATE VIEW Route_Avg_Transit_Time AS
SELECT Route_ID,AVG(TIMESTAMPDIFF(HOUR, Pickup_Date, Delivery_Date)) 
AS Avg_Transit_Time_Hours FROM dhl_shipments GROUP BY Route_ID;

SELECT * FROM Route_Avg_Transit_Time;

-- TASK 3.2:Average delay (in hours) per route.

CREATE VIEW Avg_Delay_Per_Route AS
SELECT Route_ID,AVG(Delay_Hours) AS Avg_Delay_Hours
FROM dhl_shipments GROUP BY Route_ID;

SELECT * FROM Avg_Delay_Per_Route;

-- TASK 3.3:Distance-to-time efficiency ratio = Distance_KM / Avg_Transit_Time_Hours. 

CREATE VIEW Route_Efficiency_Ratio AS
SELECT Route_ID,Distance_KM,Avg_Transit_Time_Hours,
ROUND(Distance_KM / Avg_Transit_Time_Hours, 2) AS Efficiency_Ratio
FROM dhl_routes;

SELECT *FROM Route_Efficiency_Ratio;

-- TASK 3.4:Identify 3 routes with the worst efficiency ratio (lowest distance-to-time).

CREATE VIEW Worst_3_Routes AS
SELECT Route_ID,Distance_KM,Avg_Transit_Time_Hours,Efficiency_Ratio
FROM Route_Efficiency_Ratio ORDER BY Efficiency_Ratio ASC LIMIT 3;

SELECT *FROM Worst_3_Routes;

-- TASK 3.5: Find routes with >20% of shipments delayed beyond expected transit time. 

CREATE VIEW Routes_High_Delay_Percentage AS
SELECT s.Route_ID,COUNT(*) AS Total_Shipments,SUM(CASE
WHEN s.Delay_Hours > r.Avg_Transit_Time_Hours THEN 1 ELSE 0
END) AS Delayed_Shipments,ROUND(SUM(CASE
WHEN s.Delay_Hours > r.Avg_Transit_Time_Hours THEN 1
ELSE 0 END) * 100.0 / COUNT(*),2) AS Delay_Percentage
FROM dhl_shipments s JOIN dhl_routes r ON s.Route_ID = r.Route_ID
GROUP BY s.Route_ID HAVING Delay_Percentage > 20;

SELECT * FROM Routes_High_Delay_Percentage;



