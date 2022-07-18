CREATE OR REPLACE FUNCTION update_hold_summary()
 RETURNS trigger
 LANGUAGE plpgsql
AS $$
DECLARE new_average REAL;
DECLARE summary_customer_id INT;
BEGIN
	
	SELECT customer_id
	INTO summary_customer_id
	FROM rental_hold_summary
	WHERE customer_id = NEW.customer_id;

	IF summary_customer_id IS NULL THEN
		INSERT INTO rental_hold_summary
			(customer_id, first_name, last_name, email, average_days_held)
		VALUES 
			(NEW.customer_id, NEW.first_name, NEW.last_name, NEW.email, NEW.days_held);
	ELSE
		SELECT AVG(days_held)
		INTO new_average
		FROM rental_hold_detail
		WHERE customer_id = NEW.customer_id
			AND days_held >= 0;
		
		UPDATE rental_hold_summary
		SET average_days_held = new_average
		WHERE customer_id = NEW.customer_id;
	END IF;
	RETURN NULL;
END; $$;

-- Statement to create trigger
CREATE TRIGGER hold_summary_update
AFTER INSERT ON rental_hold_detail
FOR EACH ROW
EXECUTE PROCEDURE update_hold_summary();
