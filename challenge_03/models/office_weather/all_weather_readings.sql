-- configure the model with materialization is incremental
-- set the unique keys of the model, so when the data is updated, it will create new records
{{
  config(
    materialized = 'incremental',
    unique_key= ['time','office','latitude','longitude'] 
    )
}}

SELECT *
FROM {{ ref('extract_weather_data') }}
{% if is_incremental() %}
  WHERE time > (SELECT MAX(time) FROM {{this}})
{% endif %}