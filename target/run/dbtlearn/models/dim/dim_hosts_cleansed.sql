
  create or replace   view AIRBNB.DEV.dim_hosts_cleansed
  
   as (
    

with  __dbt__cte__src_hosts as (
with raw_hosts as (
select * from AIRBNB.raw.raw_hosts
)

select
id as host_id,
name as host_name,
is_superhost,
created_at,
updated_at
from raw_hosts
), src_hosts AS (SELECT * FROM __dbt__cte__src_hosts)

SELECT
host_id,
nvl(host_name,'Anonymous') as host_name,
is_superhost,
created_at,
updated_at
FROM src_hosts
  );

