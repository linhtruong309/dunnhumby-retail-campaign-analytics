-- =============================================================
-- Dunnhumby Retail & Campaign Analytics
-- File: 02_analysis_queries.sql
-- Purpose: Build a campaign-level summary view that measures how
--          effective each coupon campaign (Types A, B, C) was.
-- Prerequisite: run 01_schema.sql and load the Dunnhumby data first.
-- =============================================================

USE promo_db;

CREATE OR REPLACE VIEW vw_campaign_summary AS
SELECT
    c.CAMPAIGN,
    cd.DESCRIPTION AS campaign_type,          -- Campaign type: TypeA / TypeB / TypeC
    cd.START_DAY,
    cd.END_DAY,

    -- Reach: households that received the campaign
    COUNT(DISTINCT c.household_key)  AS targeted_households,

    -- Response: households that redeemed at least one coupon
    COUNT(DISTINCT cr.household_key) AS redeeming_households,

    -- Volume: number of coupon redemption records
    COUNT(cr.COUPON_UPC)             AS total_redemptions,

    -- Redemption rate = redeeming households / targeted households
    -- NULLIF avoids division by zero
    ROUND(
        COUNT(DISTINCT cr.household_key)
        / NULLIF(COUNT(DISTINCT c.household_key), 0),
        4
    ) AS redemption_rate,

    -- Cost: total coupon discount given (COUPON_DISC is stored as negative)
    ROUND(SUM(ABS(t.COUPON_DISC)), 2) AS total_coupon_discount,

    -- Average discount cost per redemption
    ROUND(
        SUM(ABS(t.COUPON_DISC))
        / NULLIF(COUNT(cr.COUPON_UPC), 0),
        2
    ) AS cost_per_redemption

FROM campaign_table c
-- Attach campaign type and dates
JOIN campaign_desc cd
    ON c.CAMPAIGN = cd.CAMPAIGN
-- Keep all targeted households, even those who never redeemed
LEFT JOIN coupon_redempt cr
    ON  c.household_key = cr.household_key
    AND c.CAMPAIGN      = cr.CAMPAIGN
-- Match redemptions to transactions of the same household on the same day
LEFT JOIN transaction_data t
    ON  cr.household_key = t.household_key
    AND cr.DAY           = t.DAY
GROUP BY
    c.CAMPAIGN,
    cd.DESCRIPTION,
    cd.START_DAY,
    cd.END_DAY;

-- Quick check
SELECT * FROM vw_campaign_summary;
