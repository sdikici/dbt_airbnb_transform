SELECT * FROM
AIRBNB.DEV.fct_reviews as fct
JOIN AIRBNB.DEV.dim_listings_cleansed as cl 
ON fct.LISTING_ID = cl.LISTING_ID
WHERE fct.REVIEW_DATE < cl.created_at
LIMIT 10