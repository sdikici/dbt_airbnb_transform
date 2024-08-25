--we create an incremental materialization here for appends
{{
    config (
        materialized ="incremental",
        on_schema_change="fail" 
    )
}}

with src_reviews as (SELECT * from {{ ref("src_reviews")}})

SELECT 
  {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }}
    AS review_id,
  *  
FROM src_reviews
WHERE review_text is not null
{%if is_incremental() %} --we check the most recent reviews for appending new reviews to the tables
    AND review_date > (SELECT max(review_date) from {{ this }})  --'this' word here refers to the same model fct_reviews
{% endif %}