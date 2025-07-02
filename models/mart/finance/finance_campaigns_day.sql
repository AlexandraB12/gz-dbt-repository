SELECT 
    campaigns.date_date,
    finance.total_operational_margin - campaigns.daily_ads_cost AS ads_margin,
    finance.average_basket AS average_basket,
    finance.total_operational_margin AS operational_margin,
    campaigns.daily_ads_cost AS ads_cost,
    campaigns.daily_impressions AS ads_impressions,
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
ORDER BY date_date