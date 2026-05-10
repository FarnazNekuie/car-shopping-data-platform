WITH source AS (
    SELECT *
    FROM {{ source('raw', 'vehicle_listings_raw') }}
),

cleaned AS (
    SELECT
        vin,
        stock_num,
        first_seen,
        last_seen,
        msrp,
        ask_price,
        mileage,
        is_new,
        color,
        interior_color,
        brand_name,
        model_name,
        dealer_id,
        body_class,
        doors,
        drive_type,
        engine_cylinders,
        engine_hp,
        fuel_type,
        make,
        model,
        model_year,
        plant_country,
        vehicle_type,
        transmission_style,
        trim
    FROM source
    WHERE ask_price BETWEEN 500 AND 200000
      AND model_year BETWEEN 1980 AND 2026
)

SELECT *
FROM cleaned
