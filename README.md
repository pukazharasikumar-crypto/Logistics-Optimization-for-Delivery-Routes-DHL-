# DHL Logistics Optimization Using SQL

## 📌 Project Overview

This project focuses on analyzing logistics and delivery operations for DHL using SQL.

The objective is to analyze shipment performance, identify delivery delays, evaluate route efficiency, measure warehouse and delivery-agent performance, and develop KPI-based insights to support logistics optimization.

The analysis uses relational logistics data covering orders, routes, warehouses, delivery agents, and shipment tracking.

---

## 🎯 Project Objectives

- Identify delivery delay patterns and operational inefficiencies.
- Analyze and compare route performance.
- Identify inefficient routes and potential optimization opportunities.
- Evaluate warehouse-level delivery performance.
- Analyze delivery-agent performance.
- Examine shipment tracking and delivery status.
- Calculate important logistics KPIs.
- Provide data-driven recommendations for improving delivery efficiency.

---

## 🗂️ Project Tasks

### Task 1 – Data Cleaning & Preparation

Performed SQL-based data preparation including:

- Identifying duplicate Order_ID and Shipment_ID records.
- Handling missing Delay_Hours values.
- Standardizing date formats.
- Flagging invalid delivery dates.
- Validating relationships between logistics tables.
---

### Task 2 – Delivery Delay Analysis

Analyzed:

- Delivery delay in hours.
- Top 10 delayed routes.
- Shipment delay ranking within warehouses using window functions.
- Average delay by delivery type.
### Task 2 – Delivery Delay Analysis

![Task 2 Dashboard](https://github.com/pukazharasikumar-crypto/Logistics-Optimization-for-Delivery-Routes-DHL-/blob/main/LOGISTICS%20OPTIMIZATION%20PROJECT-pukazharasikumar@gmail.com/sqlimage/Task-2-Dashboard.png?raw=true)

---

### Task 3 – Route Optimization Insights

Analyzed route efficiency using:

- Average transit time.
- Average delay.
- Distance-to-time efficiency ratio.
- Routes with poor efficiency.
- Routes with a high percentage of delayed shipments.

Potential route and hub optimization opportunities were identified from the analysis.
### Task 3 – Route Optimization

![Task 3A Dashboard](https://github.com/pukazharasikumar-crypto/Logistics-Optimization-for-Delivery-Routes-DHL-/blob/main/LOGISTICS%20OPTIMIZATION%20PROJECT-pukazharasikumar@gmail.com/sqlimage/Task-3a-Dashboard.png?raw=true)

![Task 3B Dashboard](https://github.com/pukazharasikumar-crypto/Logistics-Optimization-for-Delivery-Routes-DHL-/blob/main/LOGISTICS%20OPTIMIZATION%20PROJECT-pukazharasikumar@gmail.com/sqlimage/Task-3b-Dashboard.png?raw=true)

---
### Task 4 – Warehouse Performance

Evaluated warehouses based on:

- Average shipment delay.
- Total shipments.
- Delayed shipments.
- On-time delivery percentage.
- Performance compared with the global average delay.

CTEs were used to support warehouse-level analysis.
### Task 4 – Warehouse Performance

![Task 4 Dashboard](https://github.com/pukazharasikumar-crypto/Logistics-Optimization-for-Delivery-Routes-DHL-/blob/main/LOGISTICS%20OPTIMIZATION%20PROJECT-pukazharasikumar@gmail.com/sqlimage/Task-4-Dashboard.png?raw=true)

---
### Task 5 – Delivery Agent Performance

Analyzed delivery-agent performance using:

- On-time delivery percentage.
- Agent ranking by route.
- Identification of agents below the 85% on-time threshold.
- Comparison of experience and customer ratings.
- Training and workload-balancing opportunities.
### Task 5 – Delivery Agent Performance

![Task 5 Dashboard](https://github.com/pukazharasikumar-crypto/Logistics-Optimization-for-Delivery-Routes-DHL-/blob/main/LOGISTICS%20OPTIMIZATION%20PROJECT-pukazharasikumar@gmail.com/sqlimage/Task-5-Dashboard.png?raw=true)

![Task 5B Dashboard](https://github.com/pukazharasikumar-crypto/Logistics-Optimization-for-Delivery-Routes-DHL-/blob/main/LOGISTICS%20OPTIMIZATION%20PROJECT-pukazharasikumar@gmail.com/sqlimage/Task-5b-Dashboard.png?raw=true)

---
### Task 6 – Shipment Tracking Analytics

Analyzed:

- Latest shipment status.
- Latest delivery date.
- In Transit shipments.
- Returned shipments.
- Routes with a high proportion of unresolved shipments.
- Exceptionally delayed orders.
### Task 6 – Shipment Tracking

![Task 6 Dashboard](https://github.com/pukazharasikumar-crypto/Logistics-Optimization-for-Delivery-Routes-DHL-/blob/main/LOGISTICS%20OPTIMIZATION%20PROJECT-pukazharasikumar@gmail.com/sqlimage/Task-6-Dashboard.png?raw=true)

---
### Task 7 – Advanced KPI Reporting

Calculated key logistics KPIs including:

- Average delivery delay by source country.
- On-time delivery percentage.
- Average delay by route.
- Warehouse utilization percentage.
### Task 7 – KPI Reporting

![Task 7 Dashboard](https://github.com/pukazharasikumar-crypto/Logistics-Optimization-for-Delivery-Routes-DHL-/blob/main/LOGISTICS%20OPTIMIZATION%20PROJECT-pukazharasikumar@gmail.com/sqlimage/Task-7-Dashboard.png?raw=true)

---

## 🛠️ Tools & Technologies

- SQL
- Relational Database
- SQL Aggregations
- CASE Statements
- Common Table Expressions (CTEs)
- Window Functions
- Subqueries
- Data Cleaning
- KPI Analysis

---

## 📊 Database Tables

### Orders

- Order_ID
- Customer_ID
- Order_Date
- Route_ID
- Warehouse_ID
- Order_Amount
- Delivery_Type
- Payment_Mode

### Routes

- Route_ID
- Source_City
- Source_Country
- Destination_City
- Destination_Country
- Distance_KM
- Avg_Transit_Time_Hours

### Warehouses

- Warehouse_ID
- City
- Country
- Capacity_per_day
- Manager_Name

### Delivery Agents

- Agent_ID
- Agent_Name
- Zone
- Zone_Country
- Experience_Years
- Avg_Rating

### Shipments

- Shipment_ID
- Order_ID
- Agent_ID
- Route_ID
- Warehouse_ID
- Pickup_Date
- Delivery_Date
- Delivery_Status
- Delay_Hours
- Delivery_Feedback

---

## 📈 Key KPIs

| KPI | Purpose |
|---|---|
| Average Delivery Delay | Measures average shipment delay |
| On-Time Delivery % | Measures service reliability |
| Average Route Delay | Compares route performance |
| Distance-to-Time Ratio | Evaluates route efficiency |
| Warehouse Utilization % | Measures warehouse capacity usage |
| Delayed Shipment Count | Identifies operational problems |
| Agent On-Time % | Evaluates delivery-agent performance |

---

## 💡 Business Recommendations

Based on the analysis, DHL can consider:

- Prioritizing routes with consistently high delays.
- Reviewing inefficient route and hub combinations.
- Monitoring warehouses with above-average delays.
- Providing targeted training for low-performing delivery agents.
- Balancing workloads among delivery agents.
- Monitoring shipments with exceptionally high delays.
- Using KPI monitoring to improve on-time delivery performance.
- Improving route planning using historical transit and delay patterns.

---

## 📁 Project Structure

```text
DHL-Logistics-Optimization-SQL/
│
├── README.md
│
├── SQL/
│   ├── 01_Data_Cleaning.sql
│   ├── 02_Delivery_Delay_Analysis.sql
│   ├── 03_Route_Optimization.sql
│   ├── 04_Warehouse_Performance.sql
│   ├── 05_Delivery_Agent_Performance.sql
│   ├── 06_Shipment_Tracking.sql
│   └── 07_KPI_Reporting.sql
│
├── Presentation/
│   └── DHL_Logistics_Optimization.pptx
│
└── Results/
    └── screenshots/
        ├── Task-2-Dashboard.png
        ├── Task-3a-Dashboard.png
        ├── Task-3b-Dashboard.png
        ├── Task-4-Dashboard.png
        ├── Task-5-Dashboard.png
        ├── Task-5b-Dashboard.png
        ├── Task-6-Dashboard.png
        └── Task-7-Dashboard.png
