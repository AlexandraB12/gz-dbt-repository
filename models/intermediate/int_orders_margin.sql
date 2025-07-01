SELECT orders_id, 
    date_date,
    ROUND(SUM(revenue),2) AS total_revenue, 
    SUM(quantity) AS total_quantity, 
    SUM(purchase_cost) AS total_purchase_cost,
    SUM(margin) AS total_margin
FROM {{ ref('int_sales_margin') }} AS sales_margin
GROUP BY orders_id, date_date
ORDER BY orders_id, date_date 

