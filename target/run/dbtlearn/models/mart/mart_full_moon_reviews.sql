
  
    

        create or replace transient table AIRBNB.DEV.mart_full_moon_reviews
         as
        (

with fct_reviews as (SELECT * FROM AIRBNB.DEV.fct_reviews),
full_moon_dates as (SELECT * FROM AIRBNB.DEV.seed_full_moon_dates)

SELECT
r.*,
CASE 
    WHEN fm.full_moon_date is NULL THEN 'not full moon' 
    ELSE  'full moon'
END as is_full_moon
FROM
fct_reviews r 
LEFT JOIN full_moon_dates fm 
on (to_date(r.review_date) = DATEADD(day,1,fm.full_moon_date) )
        );
      
  