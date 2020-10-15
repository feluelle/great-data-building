{% macro test_is_100_percent(model, column_name) %}

with validation as (

    select sum({{ column_name }}) as total
    from {{ model }}

), validation_errors as (

    select total
    from validation
    where total != 100

)

select count(*)
from validation_errors

{% endmacro %}