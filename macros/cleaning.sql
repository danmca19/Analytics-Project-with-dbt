{% macro initcap(field) %}
    -- Simula o INITCAP de outros bancos no DuckDB
    upper(substr(trim({{ field }}), 1, 1)) || lower(substr(trim({{ field }}), 2))
{% endmacro %}

{% macro trim_lower(field) %}
    lower(trim({{ field }}))
{% endmacro %}

{% macro trim_upper(field) %}
    upper(trim({{ field }}))
{% endmacro %}

{% macro safe_cast(field, type) %}
    try_cast({{ field }} as {{ type }})
{% endmacro %}

{% macro remove_special_chars(field) %}
    regexp_replace({{ field }}, '[^a-zA-Z0-9 ]', '', 'g')
{% endmacro %}

