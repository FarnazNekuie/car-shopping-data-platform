WITH source AS (

    SELECT *
    FROM {{ ref('stg_vehicle_listings') }}

)

SELECT
    vin,
    dealer_id,
    brand_name,
    model_name,
    model_year,
    body_class,
    vehicle_type,
    fuel_type,
    transmission_style,
    mileage,
    ask_price,
    msrp,
    is_new,
    first_seen,
    last_seen,
    DATEDIFF(day, first_seen, last_seen) AS listing_duration_days

FROM source