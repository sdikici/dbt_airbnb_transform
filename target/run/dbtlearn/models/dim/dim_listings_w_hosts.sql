
  
    

        create or replace transient table AIRBNB.DEV.dim_listings_w_hosts
         as
        (with
l as (SELECT * FROM AIRBNB.DEV.dim_listings_cleansed),
h as (SELECT * FROM AIRBNB.DEV.dim_hosts_cleansed
)

SELECT
l.listing_id,
l.listing_name,
l.room_type,
l.minimum_nights,
l.price,
l.host_id,
h.host_name,
h.is_superhost as host_is_superhost,
l.created_at,
greatest(l.updated_at,h.updated_at) as updated_at
from L
left JOIN h on h.host_id = l.host_id
        );
      
  