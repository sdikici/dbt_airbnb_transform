--we create an incremental materialization here for appends


with  __dbt__cte__src_reviews as (
with raw_reviews as (
select * from airbnb.raw.raw_reviews
)

select
listing_id,
date as review_date,
reviewer_name,
comments as review_text,
sentiment as review_sentiment
from raw_reviews
), src_reviews as (SELECT * from __dbt__cte__src_reviews)

SELECT * FROM src_reviews
WHERE review_text is not null
 --we check the most recent reviews for appending new reviews to the tables
    AND review_date > (SELECT max(review_date) from AIRBNB.DEV.fct_reviews)  --'this' word here refers to the same model fct_reviews
