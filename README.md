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

### Dimension Tables

| Table | Description |
|---|---|
| [`dim_category`](./Datasets/dim_category.csv) | Product category information |
| [`dim_date`](./Datasets/dim_date.csv) | Date, month, quarter, year, and day attributes |
| [`dim_product`](./Datasets/dim_product.csv) | Product master data |
| [`dim_product_variant`](./Datasets/dim_product_variant.csv) | Product-level variant information |
| [`dim_store`](./Datasets/dim_store.csv) | Store and location information |

### Fact Tables

| Table | Description |
|---|---|
| [`fact_orders`](./Datasets/fact_orders.csv) | Order-level transactional information |
| [`fact_order_items`](./Datasets/fact_order_items.csv) | Individual products and quantities within orders |
| [`fact_inventory`](./Datasets/fact_inventory.csv) | Inventory snapshots across products, variants, stores, and dates |
| [`fact_fulfilment`](./Datasets/fact_fulfilment.csv) | Order fulfilment and delivery information |
| [`fact_returns`](./Datasets/fact_returns.csv) | Product return and refund transactions |

### Analytical Views

| View | Purpose |
|---|---|
| `vw_sales_analysis` | Sales, orders, quantities, discounts, gross sales, and net sales analysis |
| `vw_returns_analysis` | Return quantities, refund amounts, return reasons, and return status analysis |
| `vw_inventory_analysis` | Inventory levels, stock status, unit cost, and inventory value analysis |

## 🗄️ SQL Analysis & Data Preparation

PostgreSQL was used for database creation, data loading, cleaning, validation, analytical querying, and preparation of reporting datasets for Power BI.

### SQL Workflow

The SQL work was organized into separate scripts covering the major stages of the project:

| SQL Script | Purpose |
|---|---|
| [`01_database_schema.sql`](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/SQL%20Query/01_database_schema.sql) | Creates the database tables, keys, constraints, and analytical structure |
| [`02_data_cleaning.sql`](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/SQL%20Query/02_data_cleaning.sql) | Cleans invalid records and prepares the transactional datasets |
| [`03_data_validation.sql`](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/SQL%20Query/03_data_validation.sql) | Performs NULL, duplicate, orphan-record, referential-integrity, and coverage checks |
| [`04_sales_analysis.sql`](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/SQL%20Query/04_sales_analysis.sql) | Analyzes sales, orders, units, discounts, revenue, and sales channels |
| [`05_inventory_analysis.sql`](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/SQL%20Query/05_inventory_analysis.sql) | Analyzes stock levels, inventory value, stores, categories, and products |
| [`06_returns_analysis.sql`](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/SQL%20Query/06_returns_analysis.sql) | Analyzes return quantities, refund amounts, return reasons, and return rates |
| [`07_fulfilment_analysis.sql`](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/SQL%20Query/07_fulfilment_analysis.sql) | Analyzes delivery performance, delivery time, and late fulfilment |
| [`08_analytical_views.sql`](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/SQL%20Query/08_analytical_views.sql) | Creates reusable analytical and KPI views for Power BI |

### Key SQL Techniques Used

- `JOIN` operations across fact and dimension tables
- `GROUP BY` and aggregate functions
- `CASE WHEN` conditional logic
- `COUNT`, `SUM`, `AVG`, and `DISTINCT`
- Data-quality and referential-integrity checks
- NULL and duplicate detection
- Orphan-record identification
- Financial reconciliation
- KPI aggregation
- Creation of reusable PostgreSQL analytical views

### Data Cleaning Results

- Removed **40,762 invalid order-item records**
- Retained **209,238 valid order-item records**
- Removed **2,895 invalid return records**
- Retained **14,605 valid return records**
- Cleaned inventory to **12,233,440 valid records**
- Loaded **100,000 fulfilment records**

### Analytical Views

The following PostgreSQL views were created for Power BI:

- `vw_sales_analysis`
- `vw_returns_analysis`
- `vw_inventory_analysis`

Additional KPI views were created for validation and aggregated analysis:

- `vw_sales_kpi`
- `vw_returns_kpi`
- `vw_inventory_kpi`

## 📈 Power BI Dashboard

The cleaned PostgreSQL datasets were connected to Power BI to build an interactive business intelligence dashboard.

The Power BI report uses a structured analytical model with shared dimensions, analytical views, and DAX measures to provide consistent filtering and business-level analysis.

### Dashboard Pages

| Page | Purpose |
|---|---|
| **Cover Page** | Project introduction and report branding |
| **Executive Overview** | High-level business performance and key KPIs |
| **Sales Analysis** | Sales, revenue, discounts, orders, and product performance |
| **Inventory Analysis** | Stock levels, inventory value, stock turnover, and inventory distribution |
| **Returns & Customer Analysis** | Returns, refunds, return reasons, and return-rate analysis |
| **Fulfilment & Operations Analysis** | Delivery performance, fulfilment volume, and late-delivery analysis |

### Power BI Features Used

- Data modeling and relationship management
- Star-schema-oriented analytical model
- DAX measures for business KPIs
- Power Query for data preparation
- Interactive slicers and cross-filtering
- KPI cards
- Trend analysis
- Category and product-level analysis
- Store-level performance analysis
- Conditional business analysis

### Key Analytical Areas

**Sales**
- Net Sales
- Gross Sales
- Units Sold
- Average Order Value
- Discounts
- Sales by category, channel, store, and product

**Inventory**
- Closing Stock
- Inventory Value
- Stock Status
- Stock Turnover
- Inventory distribution by category, store, and product

**Returns**
- Returned Units
- Refund Amount
- Return Rate
- Return Reasons
- Return Status

**Fulfilment**
- Fulfilment Volume
- Average Delivery Days
- On-Time Delivery
- Late Delivery Rate
- Store-level delivery performance

## 🖼️ Dashboard Preview

### Executive Overview

![Executive Overview](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100147.jpg)

### Sales Analysis

![Sales Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100333.jpg)

### Inventory Analysis

![Inventory Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100417.jpg)

### Returns & Customer Analysis

![Returns & Customer Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100450.jpg)

### Fulfilment & Operations Analysis

![Fulfilment & Operations Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100520.jpg)

## 🔍 Key Business Insights

The analysis of sales, inventory, returns, and fulfilment data produced several business-level observations:

### Sales Performance

- The analysis generated **364.73M in net sales** across the cleaned sales dataset.
- Total units sold reached approximately **289K**, indicating substantial product movement across the analyzed period.
- Sales performance varies across product categories, stores, and order channels, highlighting differences in commercial contribution.
- Product-level analysis helps identify the highest-performing products and categories that contribute significantly to overall revenue.
- Discount analysis provides visibility into the relationship between promotional activity and net sales.

### Inventory Performance

- The business holds approximately **3.67B units of closing stock** across the analyzed inventory records.
- Total inventory value is approximately **3.57T**, making inventory allocation and stock efficiency important operational considerations.
- Inventory concentration varies across products, categories, and stores.
- Low-stock analysis can help identify products requiring replenishment attention.
- Stock turnover analysis provides an additional perspective on how efficiently inventory is being converted into sales.

### Returns & Customer Analysis

- Approximately **15K units were returned**, resulting in **22.33M in refunds**.
- The overall return rate is **5.06%** based on returned units relative to units sold.
- Return reasons vary in their contribution to returned units and refund amounts.
- Category-level return analysis helps identify product groups that may require further investigation.
- Refund analysis provides visibility into the financial impact of product returns.

### Fulfilment & Operations

- The analysis contains **100K fulfilment records**.
- Approximately **71.43% of fulfilments were completed on time**, while **28.57% were classified as late**.
- Delivery performance varies across stores, allowing operational teams to identify locations with comparatively higher delivery delays.
- Monthly fulfilment and late-delivery trends provide visibility into changes in operational performance over time.
- Delivery-day analysis helps identify the distribution and typical duration of fulfilment cycles.
