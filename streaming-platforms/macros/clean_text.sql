{% macro clean_text(column) %}
    regexp_replace({{ column }}, E'[\\n\\r ]+', ' ', 'g')
{% endmacro %}