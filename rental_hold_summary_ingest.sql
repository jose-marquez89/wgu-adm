INSERT INTO rental_hold_summary
SELECT 
  customer_id, 
  first_name, 
  last_name, 
  email,
  AVG(days_held) as average_days_held 
FROM rental_hold_detail
WHERE days_held >= 0
GROUP BY customer_id, first_name, last_name, email;
