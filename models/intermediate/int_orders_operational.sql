SELECT orders_sales.orders_id,
date_date,
ship.shipping_fee,
ship.logcost,
ship.ship_cost,
ROUND((orders_sales.total_margin + ship.shipping_fee) - (ship.logcost + ship.ship_cost),2) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS orders_sales
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship
ON orders_sales.orders_id = ship.orders_id
