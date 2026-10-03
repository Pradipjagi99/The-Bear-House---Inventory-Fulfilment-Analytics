# <img width="50" height="50" alt="unnamed" src="https://github.com/user-attachments/assets/7a3a9e8a-e08b-4270-82e3-580e3b966080" /> The-Bear-House - Inventory-Fulfilment-Analytics

## 📌 Project Overview

This project presents an end-to-end **Omnichannel Inventory & Fulfilment Analytics** solution developed for **The Bear House**, a fashion retail business.

The objective of the project is to analyze sales performance, inventory levels, product movement, customer returns, and fulfilment operations across multiple sales channels and stores.

The analysis was developed using **PostgreSQL for data preparation and SQL analysis** and **Microsoft Power BI for interactive business intelligence and dashboarding**.

The project follows a practical data analyst workflow:

**Raw Data → Data Cleaning → Data Validation → SQL Analysis → Data Modeling → DAX Measures → Power BI Dashboard → Business Insights**

> **Data Note:** The dataset used in this project is synthetic and designed to simulate internal operational data for an omnichannel fashion retailer. It is created for portfolio and analytical demonstration purposes and does not represent actual confidential data from The Bear House.

## ❓ Business Problem

As an omnichannel fashion retailer, The Bear House needs visibility into how products are selling, where inventory is concentrated, how frequently products are returned, and how efficiently customer orders are fulfilled.

The business needs to answer key operational questions such as:

- Which products and categories generate the highest sales?
- Which sales channels contribute the most revenue?
- Where is inventory concentrated across stores and categories?
- Which products have comparatively low stock levels?
- What are the major reasons for product returns?
- How does the return rate vary across categories?
- How efficiently are customer orders being fulfilled?
- What proportion of deliveries are completed late?
- Which stores experience higher fulfilment delays?
- How do sales, inventory, returns, and fulfilment performance change over time?

The project addresses these questions by integrating sales, product, inventory, returns, store, date, and fulfilment data into a centralized analytical model.

## 🎯 Project Objectives

The main objectives of this project are to:

- Analyze overall sales performance across products, categories, stores, and sales channels.
- Identify products and categories contributing significantly to net sales and units sold.
- Evaluate inventory levels, inventory value, and stock distribution across stores and product categories.
- Identify products with comparatively low stock levels and examine inventory concentration.
- Analyze customer returns, refund amounts, return reasons, and return rates across categories.
- Measure fulfilment performance using delivery time, on-time delivery, and late delivery metrics.
- Compare fulfilment performance across stores and identify variations in delivery efficiency.
- Track sales, inventory, returns, and fulfilment trends over time.
- Build a centralized analytical data model using PostgreSQL and Power BI.
- Develop an interactive Power BI dashboard to support operational and business analysis.

## 🛠️ Tools & Technologies

| Tool / Technology | Purpose |
|---|---|
| **PostgreSQL** | Database creation, data storage, cleaning, validation, and SQL analysis |
| **SQL** | Data transformation, analytical queries, validation, and KPI preparation |
| **Power BI** | Interactive dashboards, data visualization, and business reporting |
| **DAX** | Measures and calculated logic for business KPIs and analytical metrics |
| **Power Query** | Data preparation and transformation within Power BI |
| **Data Modeling** | Star-schema based analytical model and relationship management |
| **GitHub** | Project documentation, version control, and portfolio presentation |

## 📊 Key KPIs

The completed analysis provides the following key business metrics:

| KPI | Value |
|---|---:|
| **Net Sales** | **364.73M** |
| **Orders Represented in Sales Analysis** | **82K** |
| **Total Units Sold** | **289K** |
| **Total Refunds** | **22.33M** |
| **Total Returned Units** | **15K** |
| **Return Rate** | **5.06%** |
| **Closing Stock** | **3.67B units** |
| **Inventory Value** | **3.57T** |
| **Fulfilment Records** | **100K** |
| **On-Time Fulfilment Rate** | **71.43%** |
| **Late Fulfilment Rate** | **28.57%** |
| **Average Order Value** | **4.42K** |

> **Note:** The database contains **100,000 order headers** in `fact_orders`. The **82K** figure represents distinct orders available in the cleaned `vw_sales_analysis` dataset used for the sales dashboard.
