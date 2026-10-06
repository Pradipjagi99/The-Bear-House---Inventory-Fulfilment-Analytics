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

## 📊 Power BI Dashboard

The interactive Power BI report was developed using PostgreSQL, Power Query,
data modeling, and DAX.

Due to the size of the `.pbix` file, the Power BI source file is hosted
separately rather than stored directly in this GitHub repository.

### Dashboard Preview

Screenshots of the completed dashboard are available below.

[View Dashboard Screenshots](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/tree/main/Images)

## 🖼️ Dashboard Preview

The Power BI report consists of multiple analytical pages designed to provide a complete view of sales, inventory, returns, and fulfilment performance.

### Executive Overview

Provides a high-level view of business performance through key KPIs including Net Sales, Total Orders, Units Sold, Refunds, Average Order Value, Inventory Value, Return Rate, and Closing Stock.

[![Executive Overview](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100147.jpg)](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100147.jpg)

### Sales Analysis

Analyzes revenue, units sold, average selling price, discounts, order channels, order status, and category-level sales performance.

[![Sales Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100333.jpg)](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100333.jpg)

### Inventory Analysis

Provides visibility into closing stock, inventory value, stock status, stock turnover, low-stock products, and inventory distribution across stores and categories.

[![Inventory Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100417.jpg)](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100417.jpg)

### Returns & Customer Analysis

Analyzes returned units, refund amounts, return reasons, return rates, product categories, and return status.

[![Returns & Customer Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100450.jpg)](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100450.jpg)

### Fulfilment & Operations Analysis

Tracks fulfilment volume, average delivery days, on-time versus late deliveries, store-level delivery performance, and monthly operational trends.

[![Fulfilment & Operations Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100520.jpg)](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/blob/main/Images/Screenshot%202026-10-06%20100520.jpg)

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

## 💡 Business Recommendations

Based on the analysis, the following actions could help improve commercial performance, inventory efficiency, customer experience, and fulfilment operations.

### 1. Optimize Inventory Allocation

Use product-, category-, and store-level inventory analysis to identify locations with excess stock and locations approaching low-stock levels.

**Recommended action:**
- Prioritize replenishment for low-stock products.
- Review excess inventory across stores.
- Consider reallocating slow-moving inventory to locations with stronger demand.

### 2. Improve Stock Turnover

Use stock turnover analysis to identify products and categories where inventory is not converting efficiently into sales.

**Recommended action:**
- Monitor slow-moving products regularly.
- Use targeted promotions to improve inventory movement.
- Avoid excessive replenishment of products with consistently low turnover.

### 3. Monitor Return Drivers

The return analysis highlights differences in return volume, refund amounts, and return reasons.

**Recommended action:**
- Investigate categories and products with comparatively high return rates.
- Analyze recurring return reasons.
- Use return insights to improve product information, sizing guidance, quality checks, and customer communication where applicable.

### 4. Reduce Late Deliveries

With **28.57% of fulfilments classified as late**, delivery performance represents an important operational improvement opportunity.

**Recommended action:**
- Identify stores with comparatively higher late-delivery rates.
- Investigate operational causes of delivery delays.
- Monitor late-delivery rates regularly at store and monthly levels.
- Compare promised versus actual delivery performance to improve fulfilment planning.

### 5. Improve Fulfilment Planning

Store-level fulfilment volume and average delivery time can be used to understand operational workload and delivery efficiency.

**Recommended action:**
- Monitor fulfilment volumes across stores.
- Identify locations experiencing consistently higher delivery times.
- Align operational capacity with fulfilment demand where necessary.

### 6. Balance Discounts and Revenue

Discount analysis can help evaluate how promotional activity affects sales performance.

**Recommended action:**
- Monitor discount levels alongside net sales.
- Identify categories where discounts generate strong sales contribution.
- Review high-discount areas where incremental sales may not justify the reduction in revenue.

### 7. Establish Ongoing KPI Monitoring

The Power BI dashboard can be used as a recurring management reporting tool rather than a one-time analysis.

**Recommended action:**
Track the following KPIs regularly:

- Net Sales
- Units Sold
- Average Order Value
- Inventory Value
- Closing Stock
- Return Rate
- Refund Amount
- On-Time Fulfilment Rate
- Late Delivery Rate
- Average Delivery Days

> **Note:** These recommendations are based on the analytical framework and observed patterns in the project. Store-, product-, and category-specific actions should be validated against operational context before implementation.

## 🧹 Data Cleaning & Validation

Data quality checks were performed throughout the preparation process to ensure that the datasets used for analysis were consistent, complete, and suitable for reporting.

### Data Cleaning

The following cleaning activities were performed:

- Identified and removed invalid product variant references from transactional datasets.
- Removed **40,762 invalid order-item records**, retaining **209,238 valid records**.
- Removed **2,895 invalid return records**, retaining **14,605 valid records**.
- Cleaned the inventory dataset by removing records associated with invalid product variants.
- Retained **12,233,440 valid inventory records**.
- Prepared the fulfilment dataset using a staging table before loading the final `fact_fulfilment` table.
- Mapped source fields to the final analytical schema where source and target column names differed.
- Preserved source-provided inventory attributes where no reliable business rule was available for recalculation.

### Data Validation

Multiple SQL validation checks were performed, including:

- Primary-key duplicate checks
- Foreign-key and referential-integrity checks
- Orphan-record detection
- NULL-value checks
- Product and variant coverage checks
- Store and date coverage checks
- Fulfilment record integrity checks
- Financial reconciliation between base analytical views and KPI aggregations

### Validation Results

| Validation Area | Result |
|---|---:|
| Products | **500** |
| Product Variants | **1,256** |
| Stores | **10** |
| Dates Represented | **974** |
| Fulfilment Records | **100,000** |
| Valid Order Items | **209,238** |
| Valid Return Records | **14,605** |
| Valid Inventory Records | **12,233,440** |
| Critical Orphan Records | **0** |

### Financial Reconciliation

The core financial calculations were reconciled against the underlying analytical views:

| Metric | Validated Result |
|---|---:|
| Gross Sales | **441,825,348.73** |
| Total Discounts | **77,091,930.09** |
| Net Sales | **364,733,418.64** |
| Total Refunds | **22,328,114.90** |

The inventory calculation was also validated using:

```text
Inventory Value = Closing Stock × Unit Cost

```

## 🧮 Key DAX Measures

The Power BI dashboard uses DAX measures to calculate core business KPIs and analytical metrics.

### Sales Measures

```DAX
Net Sales =
SUM ( 'public vw_sales_analysis'[net_amount] )

Gross Sales =
SUM ( 'public vw_sales_analysis'[gross_amount] )

Total Orders =
DISTINCTCOUNT ( 'public vw_sales_analysis'[order_id] )

Total Units Sold =
SUM ( 'public vw_sales_analysis'[quantity] )

Average Order Value =
DIVIDE ( [Net Sales], [Total Orders] )

Total Refunds =
SUM ( 'public vw_returns_analysis'[refund_amount] )

Total Returned Units =
SUM ( 'public vw_returns_analysis'[return_quantity] )

Return Rate =
DIVIDE ( [Total Returned Units], [Total Units Sold] )

Closing Stock =
SUM ( 'public vw_inventory_analysis'[closing_stock] )

Inventory Value =
SUM ( 'public vw_inventory_analysis'[inventory_value] )

Average Unit Cost =
AVERAGE ( 'public vw_inventory_analysis'[unit_cost] )

Delivery Status =
IF(
    'public fact_fulfilment'[actual_delivery]
        <= 'public fact_fulfilment'[promised_delivery],
    "On Time",
    "Late"
)

Late Delivery Rate =
DIVIDE(
    CALCULATE(
        COUNTROWS('public fact_fulfilment'),
        'public fact_fulfilment'[Delivery Status] = "Late"
    ),
    COUNTROWS('public fact_fulfilment')
)
```

## 📚 Project Resources

| Resource | Description |
|---|---|
| 📊 [Datasets](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/tree/main/Datasets) | Source dimension and fact datasets used in the analysis |
| 🗄️ [SQL Analysis](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/tree/main/SQL%20Query) | Database schema, cleaning, validation, analytical queries, and views |
| 📈 [Power BI Dashboard](https://github.com/Pradipjagi99/The-Bear-House---Inventory-Fulfilment-Analytics/tree/main/Images) | Dashboard screenshots and Power BI-related resources |

## 📌 Conclusion

The Bear House Omnichannel Inventory & Fulfilment Analytics project demonstrates an end-to-end data analytics workflow, from raw transactional data preparation and SQL-based analysis to data modeling, DAX calculations, and interactive Power BI reporting.

The project brings together sales, inventory, returns, customer, store, product, and fulfilment data to provide a consolidated view of retail operations and identify opportunities for improving inventory efficiency, customer experience, sales performance, and fulfilment operations.

The solution demonstrates practical skills in:

- Data Cleaning & Validation
- SQL Analysis
- PostgreSQL
- Data Modeling
- Power BI
- DAX
- Business Intelligence
- KPI Development
- Business Insights & Recommendations

---

## 👤 Author

### Jagi Pradip Rao

**Aspiring Data Analyst**

📍 India

🔗 [GitHub](https://github.com/Pradipjagi99)

🔗 [![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jagipradiprao/)

## 📧 Contact

For any queries or feedback, feel free to reach out:

- **Name**: Jagi Pradip Rao
- **Email**: pradip.jagi@gmail.com
