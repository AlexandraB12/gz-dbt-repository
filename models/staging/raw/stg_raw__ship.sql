WITH source AS (
  SELECT * FROM `zinc-fusion-462408-v9.gz_raw_data.raw_gz_ship` 
),

renamed AS (
  SELECT
    orders_id,
    shipping_fee,
    shipping_fee_1,
    logCost,
    ship_cost
  FROM source
),

filtered AS (
  SELECT
    orders_id,
    shipping_fee,
    logCost,
    CAST(ship_cost AS FLOAT64) AS ship_cost
  FROM renamed
  WHERE shipping_fee <> shipping_fee_1
)

SELECT * FROM filtered

