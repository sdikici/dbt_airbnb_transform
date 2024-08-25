
  create or replace   view AIRBNB.DEV.dim_listings_cleansed
  
   as (
    



WITH  __dbt__cte__src_listings as (
with raw_listings as (
select * from AIRBNB.raw.raw_listings
)

select 
id as listing_id,
name AS listing_name,
listing_url,
room_type,
minimum_nights,
host_id,
price as price_str,
created_at,
updated_at
from
raw_listings
), src_listings AS (
  SELECT
    *
  FROM __dbt__cte__src_listings
)
SELECT
  listing_id,
  listing_name,
  room_type,
  CASE
    WHEN minimum_nights = 0 THEN 1
    ELSE minimum_nights
  END AS minimum_nights,
  host_id,
  REPLACE(
    price_str,
    '$'
  ) :: NUMBER(
    10,
    2
  ) AS price,
  created_at,
  updated_at
FROM
  src_listings
  );

