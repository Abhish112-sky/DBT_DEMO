SELECT
*
FROM {{ source('demo', 'bike') }}
limit 20