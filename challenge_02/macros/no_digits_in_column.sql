{% test no_digits_in_column(model, column_name) %}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} NOT LIKE '%[0-9]%'
{% endtest %}