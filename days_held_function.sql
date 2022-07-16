CREATE FUNCTION public.days_held(start_date TIMESTAMP, end_date TIMESTAMP)
RETURNS INT AS $$
DECLARE held INT;
BEGIN
	SELECT COALESCE(DATE_PART('day', end_date - start_date), -1) INTO held;
	RETURN held;
END; $$
LANGUAGE plpgsql;
