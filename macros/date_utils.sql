{% macro season_type(sample_date) %}

CASE
    WHEN MONTH(TO_TIMESTAMP({{sample_date}})) IN (12, 1, 2) THEN 'Winter'
    WHEN MONTH(TO_TIMESTAMP({{sample_date}})) IN (3, 4, 5) THEN 'Spring'
    WHEN MONTH(TO_TIMESTAMP({{sample_date}})) IN (6, 7, 8) THEN 'Summer'
    ELSE 'Autumn'
END

{% endmacro%}



{% macro day_type(sample_date) %}

CASE  
    WHEN DAYNAME(TO_TIMESTAMP({{sample_date}})) IN ('Sat', 'Sun') THEN 'Weekend'
    ELSE 'Business Day'
END

{% endmacro%}