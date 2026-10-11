# Dunnhumby Retail & Campaign Analytics Dashboard

## 📊 Executive Summary
This project analyzes retail transactions from the Dunnhumby "The Complete Journey" dataset using **MySQL** and **Power BI**. The dashboard evaluates overall revenue trends, top-performing product departments, and measures the effectiveness of targeted coupon campaigns (Types A, B, and C).

---

## 🏗️ System Architecture & Data Pipeline
- **Database Layer:** MySQL relational database (`promo_db`) managing Fact and Dimension tables.
- **Data Reconciliation & SQL Views:** Created optimized views (`vw_campaign_summary`, `vw_data_quality`) to perform data integrity checks and summarize campaign metrics.
- **Visualization:** 2-part interactive Power BI dashboard built with clear layout design and responsive slicers.

---

## 📈 Dashboard Overview & Key Insights

### Part 1: Executive Overview
* **Focus:** High-level revenue drivers, coupon discounts, time-series sales trends, and department breakdowns.
* **Key Metrics:**
  * **Total Sales:** $8.06M
  * **Total Coupon Discount:** $42.61K
* **Key Findings:** `GROCERY` is the dominant revenue generator, followed by `DRUG GM`. Weekly sales show consistent baseline stability around $80K–$100K following initial growth.


<img width="1186" height="662" alt="0FC58868-0929-4E3C-92CA-E2BD4A16E9D6_1_105_c" src="https://github.com/user-attachments/assets/7032b32e-bf9f-47ad-98ab-e08a430f38f3" />


---

### Part 2: Campaign Performance
* **Focus:** Measuring coupon redemption rates, active households, and performance across campaign types.
* **Key Metrics:**
  * **Total Redemptions:** 2,318
  * **Total Targeted Households:** 7,208
  * **Total Redeeming Households:** 889
* **Key Findings:** **Type A** campaigns achieved the highest average redemption rate (~14%), outperforming **Type C** and **Type B**.


<img width="1273" height="720" alt="EE950B56-DA2D-401E-A78C-D13A477460A6_1_201_a" src="https://github.com/user-attachments/assets/15a51bb4-4b8b-43d1-9d3a-b50a9e93e37d" />


---

## 🛠️ Core DAX & Data Validation
- **Redemption Rate:** `DIVIDE([Redeeming HH], [Targeted HH], 0)`
- **Data Integrity:** All aggregates in Power BI (e.g., Total Redemptions: 2,318) match 100% with MySQL `vw_campaign_summary` outputs.
