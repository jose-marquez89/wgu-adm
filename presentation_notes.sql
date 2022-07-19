/* Video Notes */
-- 1. Tables
-- 2. Extraction Queries
-- 3. Transformation Function
-- 4. Trigger Function
-- 5. Stored Procedure
-- 6. BI Report

CALL update_revenue_tables(); 

INSERT INTO rental_hold_detail
VALUES
	(700, 'Jose', 'Marquez', 'jma2359@wgu.edu', DATE(NOW()), 4);

INSERT INTO rental_hold_detail
VALUES
	(700, 'Jose', 'Marquez', 'jma2359@wgu.edu', DATE(NOW()), 4),
    (700, 'Jose', 'Marquez', 'jma2359@wgu.edu', DATE(NOW()), -1),
    (700, 'Jose', 'Marquez', 'jma2359@wgu.edu', DATE(NOW()), 23),
    (700, 'Jose', 'Marquez', 'jma2359@wgu.edu', DATE(NOW()), 10),
   	(700, 'Jose', 'Marquez', 'jma2359@wgu.edu', DATE(NOW()), -1),
    (700, 'Jose', 'Marquez', 'jma2359@wgu.edu', DATE(NOW()), -1);
   
INSERT INTO rental_hold_summary
VALUES
	(700, 'Jose', 'Marquez', 'jma2359@wgu.edu', 1.12);

SELECT *
FROM rental_hold_detail
WHERE customer_id > 599;


SELECT *
FROM rental_hold_summary
WHERE customer_id > 599;

DELETE
FROM rental_hold_summary 
WHERE customer_id = 700;

DELETE 
FROM rental_hold_detail
WHERE customer_id = 700;
