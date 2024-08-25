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