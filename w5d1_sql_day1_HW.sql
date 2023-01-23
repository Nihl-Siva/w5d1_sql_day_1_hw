
-- 1. How many actors are there with the last name ‘Wahlberg’?
-- 		ANSWER: 2

SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
-- 		ANSWER: 5607

SELECT COUNT(payment_id)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;


-- 3. What film does the store have the most of? (search in inventory)
-- 		ANSWER: Multiple films have 8 copies

SELECT film_id, COUNT(film_id) as copies
FROM inventory
GROUP BY film_id
ORDER BY copies DESC;


-- 4. How many customers have the last name ‘William’?
-- 		ANSWER: 0, But there is one named "Linda WilliamS" if this was a typo

SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';

-- SELECT first_name, last_name
-- FROM customer
-- WHERE last_name = 'Williams';

-- 5. What store employee (get the id) sold the most rentals?
-- 		ANSWER: Employee with staff_id = 1 sold the most with 8040 rentals

SELECT staff_id, COUNT(staff_id) as rentals
FROM rental
GROUP BY staff_id
ORDER BY rentals DESC
LIMIT 1;


-- 6. How many different district names are there?
-- 		ANSWER: 378 Districts

SELECT COUNT(DISTINCT district)
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- 		ANSWER: film_id = 508 has the most actors in it at 15

SELECT COUNT(actor_id) as actor_num, film_id
FROM film_actor
GROUP BY film_id
ORDER BY actor_num DESC
LIMIT 1;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 		ANSWER: 13 Customers

SELECT COUNT(last_name) as customer_count
FROM customer
WHERE last_name LIKE '%es' and store_id = 1
GROUP BY store_id;


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 		ANSWER: 3. $2.99, $4.99, and $0.99.

SELECT amount, COUNT(rental_id) as rentals
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(rental_id)>250;


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
-- 		ANSWER: 5 Categories. PG-13 has the most movies with 223 titles.

SELECT COUNT(DISTINCT rating)
FROM film;

SELECT rating, COUNT(film_id) as movies
FROM film
GROUP BY rating
ORDER BY movies DESC;

-- SELECT DISTINCT rating, COUNT(rating)
-- FROM film
-- GROUP BY rating
-- ORDER BY COUNT(rating) DESC;
