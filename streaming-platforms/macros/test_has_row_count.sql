{% macro test_has_row_count(model) %}

{% set row_count = kwargs.get('value') %}

with validation as (

    select count(*) as total
    from {{ model }}

), validation_errors as (

    select total
    from validation
    where total != {{ row_count }}

)

select count(*)
from validation_errors

{% endmacro %}