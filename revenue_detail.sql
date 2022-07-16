SELECT 
  s.store_id, 
  ct.name AS category, 
  date(p.payment_date) AS date_paid, 
  p.amount 
FROM 
  payment AS p 
  JOIN customer AS con p.customer_id = c.customer_id 
  JOIN store AS s on c.store_id = s.store_id 
  JOIN rental AS r on p.rental_id = r.rental_id 
  JOIN inventory AS i on r.inventory_id = i.inventory_id 
  JOIN film_category AS fc on i.film_id - fc.film_id 
  JOIN category AS ct on fc.category_id = ct.category_id;
