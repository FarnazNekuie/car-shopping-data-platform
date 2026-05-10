WITH listings AS (

    SELECT *
    FROM {{ ref('fct_vehicle_listings') }}

)

SELECT
    brand_name,
    model_name,
    model_year,

    COUNT(*) AS total_listings,

    ROUND(AVG(ask_price), 2) AS avg_price,
    ROUND(MIN(ask_price), 2) AS min_price,
    ROUND(MAX(ask_price), 2) AS max_price,

    ROUND(AVG(mileage), 2) AS avg_mileage

FROM listings

GROUP BY 1,2,3