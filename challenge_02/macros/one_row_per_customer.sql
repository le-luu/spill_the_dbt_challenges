{% test one_row_per_customer(model, column_name) %}
SELECT {{column_name}}
FROM {{model}}
GROUP BY {{column_name}}
HAVING COUNT(DISTINCT {{column_name}}) > 1
{% endtest%}