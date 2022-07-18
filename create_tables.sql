CREATE TABLE revenue_detail (
  store_id INT, 
  category VARCHAR(25), 
  date_paid DATE, 
  amount NUMERIC(5, 2)
);

CREATE TABLE revenue_summary (
  store_id INT, 
  category VARCHAR(25), 
  business_date DATE, 
  revenue NUMERIC(8, 2)
);

CREATE TABLE rental_hold_detail (
  customer_id INT, 
  first_name VARCHAR(45), 
  last_name VARCHAR(45), 
  email VARCHAR(50), 
  date_rented DATE, 
  days_held INT 
 );

CREATE TABLE rental_hold_summary (
  customer_id INT, 
  first_name VARCHAR(45), 
  last_name VARCHAR(45), 
  email VARCHAR(50), 
  average_days_held REAL
);
