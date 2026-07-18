WITH BIKE AS (
    SELECT
    start_station_id AS station_id,
    start_station_name AS station_name,
    start_lat AS start_station_lat,
    start_lng AS start_station_lng
    FROM {{ source('demo', 'bike') }}

    WHERE RIDE_ID != 'ride_id'

)

SELECT
*
FROM BIKE