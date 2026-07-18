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
    count(weather),

    ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY  count(weather) desc) AS weather_rank

    FROM daily_weather

    GROUP BY daily_weather, weather
)

SELECT
*
FROM daily_weather_agg
WHERE weather_rank = 1
ORDER BY daily_weather, weather_rank