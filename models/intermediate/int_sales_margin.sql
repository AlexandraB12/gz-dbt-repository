SELECT sales.*,
product.purchase_price,
CAST(quantity * purchase_price AS INT64) AS purchase_cost,
CAST(revenue - (quantity * purchase_price) AS INT64) AS margin
FROM {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN {{ ref('stg_raw__product') }} AS product 
ON sales.products_id = product.products_id