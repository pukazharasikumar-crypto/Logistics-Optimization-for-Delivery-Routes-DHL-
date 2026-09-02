-- TASK 5: Delivery Agent Performance

-- TASK 5.1:Rank delivery agents (per route) by on-time delivery percentage. 

CREATE VIEW Agent_Route_Ranking AS
SELECT Route_ID,Agent_ID,ROUND(SUM(CASE WHEN Delay_Hours = 0 THEN 1 ELSE 0 END) * 100.0
/ COUNT(*), 2) AS OnTime_Percentage,RANK() OVER (PARTITION BY Route_ID ORDER BY
SUM(CASE WHEN Delay_Hours = 0 THEN 1 ELSE 0 END) * 100.0/ COUNT(*) DESC) AS Agent_Rank
FROM dhl_shipments GROUP BY Route_ID, Agent_ID;

SELECT * FROM Agent_Route_Ranking;
 
 -- TASK 5.2:Find agents whose on-time % is below 85%. 
 CREATE VIEW Low_Performing_Agents AS
SELECT *
FROM Agent_Route_Ranking
WHERE OnTime_Percentage < 85;
SELECT * FROM Low_Performing_Agents;

-- TASK 5.3:Compare the average rating and experience (in years) of the top 5 vs bottom 5 agents 
-- using subqueries.

SELECT * FROM dhl_delivery_agents;
DESC dhl_delivery_agents;
CREATE VIEW Agent_Performance_Ranking AS
SELECT Agent_ID,ROUND(SUM(CASE WHEN Delay_Hours = 0 THEN 1 ELSE 0 END) * 100.0
 / COUNT(*), 2) AS OnTime_Percentage
FROM dhl_shipments GROUP BY Agent_ID;

SELECT * FROM Agent_Performance_Ranking;

CREATE VIEW Agent_Performance_Details AS
SELECT a.Agent_ID,d.Agent_Name,a.OnTime_Percentage,d.Experience_Years,d.Avg_Rating
FROM Agent_Performance_Ranking a JOIN dhl_delivery_agents d ON a.Agent_ID = d.Agent_ID;
SELECT * FROM Agent_Performance_Details;


CREATE VIEW TOP_5_AGENT_PERFORMANCE AS
SELECT *FROM Agent_Performance_Details ORDER BY OnTime_Percentage DESC LIMIT 5;

SELECT * FROM TOP_5_AGENT_PERFORMANCE;

CREATE VIEW BOTTOM_5_AGENT_PERFORMANCE AS
SELECT *FROM Agent_Performance_Details ORDER BY OnTime_Percentage ASC LIMIT 5;

 SELECT * FROM BOTTOM_5_AGENT_PERFORMANCE;
 
 SELECT * FROM TOP_5_AGENT_PERFORMANCE UNION ALL SELECT * FROM BOTTOM_5_AGENT_PERFORMANCE ;
 









