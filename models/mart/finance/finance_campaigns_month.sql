WITH campaigns_daily AS (
    SELECT 
        campaigns.date_date,
        finance.total_operational_margin - campaigns.daily_ads_cost AS ads_margin,
        finance.average_basket,
        finance.total_operational_margin AS operational_margin,
        campaigns.daily_ads_cost AS ads_cost,
        campaigns.daily_impressions AS ads_impression,
        campaigns.daily_clicks AS ads_clicks,
        finance.total_quantity_sold AS quantity,
        finance.total_revenue AS revenue,
        finance.total_purchase_cost AS purchase_cost,
        finance.total_margin AS margin,
        finance.total_shipping_fees AS shipping_fee,
        finance.total_log_costs AS log_cost,
        finance.total_ship_costs AS ship_cost
    FROM {{ ref('int_campaigns_day') }} AS campaigns
    LEFT JOIN {{ ref('finance_days') }} AS finance 
        ON campaigns.date_date = finance.date_date
)

SELECT 
    EXTRACT(MONTH FROM date_date) AS datemonth,
    ROUND(SUM(ads_margin),2) AS ads_margin,
    AVG(average_basket) AS average_basket,
    ROUND(SUM(operational_margin),2) AS operational_margin,
    SUM(ads_cost) AS ads_cost,
    SUM(ads_impression) AS ads_impression,
    SUM(ads_clicks) AS ads_clicks,
    SUM(quantity) AS quantity,
    ROUND(SUM(revenue),2) AS revenue,
    SUM(purchase_cost) AS purchase_cost,
    SUM(margin) AS margin,
    ROUND(SUM(shipping_fee),2) AS shipping_fee,
    ROUND(SUM(log_cost),2) AS log_cost,
    SUM(ship_cost) AS ship_cost
FROM campaigns_daily
GROUP BY datemonth
ORDER BY datemonth