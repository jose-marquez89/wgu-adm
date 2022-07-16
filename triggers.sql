CREATE OR REPLACE FUNCTION public.update_hold_tables()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
	DELETE FROM rental_hold_detail;
	DELETE FROM rental_hold_summary;
	
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
	RETURN NULL;
END; $function$
;

-- Statement to create trigger
CREATE TRIGGER update_rental_on_return
AFTER UPDATE ON rental
FOR EACH STATEMENT
EXECUTE PROCEDURE update_hold_tables(); 
