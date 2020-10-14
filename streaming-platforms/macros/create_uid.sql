{% macro create_uid(title, type, release_year, duration, directors) %}
    md5(row({{ title }}, {{ type }}, {{ release_year }}, {{ duration }}, {{ directors }})::text)
{% endmacro %}