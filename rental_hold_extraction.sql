WITH hold_ledger AS (
  SELECT 
    customer_id, 
    rental_date, 
    return_date, 
    days_held(rental_date, return_date) AS days_held 
  FROM rental 
)
    
INSERT INTO rental_hold_detail
SELECT 
  c.customer_id, 
  c.first_name, 
  c.last_name, 
  c.email, 
  DATE(l.rental_date) AS date_rented, 
  l.days_held 
FROM customer AS c 
JOIN hold_ledger AS l ON c.customer_id = l.customer_id;
