# 🏨 Hotel Booking Data Warehouse & BI Solution

## 📌 Overview
This project implements a complete end-to-end Data Warehousing and Business Intelligence system using a real-world hotel booking dataset.  
It covers the full pipeline from raw data sources → ETL processing → Data Warehouse → OLAP Cube → Interactive Reporting.

---

## 🏗️ Architecture
Data Flow:

📂 CSV / Excel Sources  
➡️ SSIS ETL Process  
➡️ Star Schema Data Warehouse  
➡️ SSAS OLAP Cube  
➡️ Power BI Dashboards  

---

## 🧰 Technologies Used
- SQL Server
- SSIS (ETL Development)
- SSAS (OLAP Cube)
- Power BI
- Excel (Data Analysis)

---

## 🗄️ Data Warehouse Design
Star Schema Model:

- Fact Table: `FactBooking`
- Dimensions:
  - DimGuest (SCD Type 2)
  - DimHotel
  - DimRoom
  - DimAgent
  - DimDate

✔ Includes accumulating fact table for transaction lifecycle tracking

---

## ⚙️ ETL Process
- Data extraction from multiple sources (CSV + Excel)
- Staging layer implementation
- Data cleansing and transformation using SSIS
- Surrogate key management via Lookups
- Slowly Changing Dimension Type 2 (DimGuest)
- Fact table loading with surrogate key mapping

---

## 📊 OLAP Cube (SSAS)

- Built using FactBooking measure group
- Hierarchies:
  - Year → Quarter → Month
- Supports OLAP operations:
  - Roll-up
  - Drill-down
  - Slice
  - Dice
  - Pivot

---

## 📈 Power BI Reports

Interactive dashboards include:
- Booking trend analysis
- Hotel performance comparison
- Drill-down hierarchy reports
- Drill-through detailed analysis
- Dynamic slicers for filtering

---

## 📁 Repository Structure

- 01_Data_Warehouse/
- 02_Cube_SSAS/
- 03_PowerBI/
- 04_Dataset/
- 05_Documentation/


---

## 🚀 Key Features

✔ End-to-end BI pipeline  
✔ Real-world hotel dataset  
✔ SCD Type 2 implementation  
✔ Accumulating fact table  
✔ OLAP cube with hierarchies  
✔ Interactive Power BI dashboards  
