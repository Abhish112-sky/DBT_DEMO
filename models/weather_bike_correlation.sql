WITH CTE AS(
    SELECT
    *
    FROM {{ ref('trip_fact') }} AS t
    LEFT JOIN {{ ref('daily_weather') }} AS w 
    ON t.TRIP_DATE = w.DAILY_WEATHER
)

SELECT
*
FROM CTE