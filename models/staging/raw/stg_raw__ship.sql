WITH source AS (

    SELECT * FROM {{ source('raw', 'ship') }}

),

renamed AS (

    SELECT
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        ship_cost
    FROM source

),

filtered AS (

    SELECT
        orders_id,
        shipping_fee,
        logcost,
        CAST(ship_cost AS FLOAT64) AS ship_cost
    FROM renamed
    WHERE shipping_fee <> shipping_fee_1

)

SELECT * FROM filtered;
