WITH TRIPS AS (
    SELECT 
    ride_id,
    rideable_type,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
    start_station_id,
    end_station_id,
    member_csual AS MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS

    FROM {{ source('demo', 'bike') }}

    WHERE RIDE_ID != 'ride_id'

)

SELECT 
*
FROM TRIPS