{% macro test_is_in_range(model, min_value, max_value, column_name) %}

with validation as (

    select {{ column_name }} as value
    from {{ model }}

), validation_errors as (

    select value
    from validation
    where value not between {{ min_value }} and {{ max_value }}

)

select count(*)
from validation_errors

{% endmacro %}