SELECT
        operational.date_date,
        COUNT(operational.orders_id) AS total_transactions,
        ROUND(SUM(orders.total_revenue),2) AS total_revenue,
        ROUND(AVG(orders.total_revenue/operational.orders_id),2) AS average_basket,
        SUM(orders.total_margin) AS total_margin,
        ROUND(SUM(operational.operational_margin),2) AS total_operational_margin,
        SUM(orders.total_purchase_cost) AS total_purchase_cost,
        ROUND(SUM(operational.shipping_fee),2) AS total_shipping_fees,
        ROUND(SUM(operational.logcost),2) AS total_log_costs,
        SUM(orders.total_quantity) AS total_quantity_sold
    FROM {{ ref('int_orders_operational') }} as operational
    LEFT JOIN {{ ref('int_orders_margin') }} AS orders
    ON operational.orders_id = orders.orders_id
    GROUP BY operational.date_date
    ORDER BY operational.date_date
