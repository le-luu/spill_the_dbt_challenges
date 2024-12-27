SELECT *
FROM {{ ref('unique_parts') }}
WHERE unique_parts is null