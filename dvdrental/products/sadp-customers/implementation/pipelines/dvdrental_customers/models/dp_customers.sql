with customers as (

   SELECT cu.customer_id AS id,
    cu.first_name,
    cu.last_name,
    a.phone,
    a.address,
    a.postal_code AS zip_code,
    city.city,
    country.country,
        CASE
            WHEN cu.activebool THEN 'active'::text
            ELSE ''::text
        END AS notes,
    cu.store_id AS sid
   FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id

)

select * from customers