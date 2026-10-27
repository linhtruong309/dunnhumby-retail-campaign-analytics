# Dunnhumby Retail & Campaign Analytics Dashboard

## 📊 Executive Summary
This project analyzes retail transactions from the Dunnhumby "The Complete Journey" dataset using **MySQL** and **Power BI**. The dashboard evaluates overall revenue trends, top-performing product departments, and measures the effectiveness of targeted coupon campaigns (Types A, B, and C).

---

## 🏗️ System Architecture & Data Pipeline
- **Database Layer:** MySQL relational database (`promo_db`) managing Fact and Dimension tables.
- **Data Reconciliation & SQL View:** Created an optimized view (`vw_campaign_summary`) that summarizes campaign metrics (targeted households, redeeming households, redemptions, redemption rate, coupon discount) and was used to validate the Power BI aggregates.
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
- **Data Integrity:** Aggregates in Power BI match the MySQL `vw_campaign_summary` output exactly: 2,318 total redemptions, 7,208 targeted households, and 889 redeeming households.

---

## 📁 Repository Structure
```
dunnhumby-retail-campaign-analytics/
├── README.md                  # Project overview, findings, and setup
├── 01_schema.sql              # Table definitions for promo_db (structure only, no data)
└── 02_analysis_queries.sql    # vw_campaign_summary view (campaign-level metrics)
```

---

## 🔁 How to Reproduce
1. **Get the data:** download the Dunnhumby "The Complete Journey" dataset (not included in this repo because of its size).
2. **Create the database:** run `01_schema.sql` in MySQL Workbench to create `promo_db` and its tables.
3. **Load the data:** import the dataset CSV files into the matching tables (`campaign_desc`, `campaign_table`, `coupon_redempt`, `hh_demographic`, `product`, `transaction_data`), for example with the Table Data Import Wizard.
4. **Build the view:** run `02_analysis_queries.sql` to create `vw_campaign_summary`.
5. **Check the output:** `SELECT * FROM vw_campaign_summary;` returns one row per campaign. Summed across all campaigns, it gives 7,208 targeted households, 889 redeeming households, and 2,318 redemptions.

---

## 📝 Methodology Notes
- **Avoiding double counting:** `vw_campaign_summary` aggregates each metric in its own subquery before joining. Joining `coupon_redempt` directly to `transaction_data` (many rows per household per day) would duplicate redemption rows and inflate counts and discounts.
- **Coupon discount in the view is an approximation:** `total_coupon_discount` sums the coupon discounts a household received on the days it redeemed a campaign coupon, so it may include discounts from other coupons used on the same day.
- **Two different discount figures:** the $42.61K on the Executive Overview page is the total coupon discount across all transactions. The campaign view only counts redemption days, so the two numbers measure different things and should not be compared directly.
