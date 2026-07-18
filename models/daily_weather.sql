{{ 
    config(materialized='table') 
}}

WITH daily_weather AS(
    SELECT
    DATE(TIME) AS daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    FROM {{ source('demo', 'weather') }}
),

daily_weather_agg AS(

    SELECT
    daily_weather,
    weather,
    ROUND(avg(temp), 2) AS avg_temp,
    ROUND(avg(pressure), 2) AS avg_pressure,
    ROUND(avg(humidity), 2) AS avg_humidity,
    ROUND(avg(clouds), 2) AS avg_clouds

    FROM daily_weather

    GROUP BY daily_weather, weather

    QUALIFY ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY  count(weather) desc) = 1
)

SELECT
*
FROM daily_weather_agg
ORDER BY daily_weather