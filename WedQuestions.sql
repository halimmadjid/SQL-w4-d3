-- Week 5 - Wednesday Questions 
-- 1. List all customers who live in Texas (use 
-- JOINs) 
SELECT c.first_name, c.last_name, c.address_id, a.district
FROM customer as c
INNER JOIN address as a
on c.address_id = a.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name 

SELECT c.first_name, c.last_name, c.customer_id, p.amount
FROM customer as c
INNER JOIN payment as p
on c.customer_id = p.customer_id
WHERE amount > 6.99;
-- 3. Show all customers names who have made payments over $175(use subqueries) 
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);
-- 4. List all customers that live in Nepal (use the city 
-- table)

SELECT customer.first_name, customer.last_name, country.country
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

SELECT *
FROM country
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions? ???????
SELECT staff.first_name, staff.last_name, COUNT(payment.payment_id)
FROM staff
RIGHT JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY staff.first_name, staff.last_name;

-- 6. How many movies of each rating are there? 
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY rating;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer_id
FROM payment
WHERE amount > 6.99
GROUP By customer_id
ORDER BY customer_id;

-- 8. How many free rentals did our stores give away?

SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00
GROUP BY amount
ORDER BY amount;




