-- Question 1 - List all customers who live in Texas (use JOINs) 
select first_name, last_name, district
from customer 
full join address 
on customer.address_id = address.address_id
where district = 'Texas';

-- Question 2 - Get all payments above $6.99 with the customer's full name 
select first_name, last_name, amount
from customer 
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99
order by amount asc;

-- Question 3 - Show all customers names who have made payments over $175 (use subqueries)
select first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment 
	group by customer_id
	having SUM(amount) > 175
)

-- Question 4 - List all customers that live in Nepal
select first_name, last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id
where country = 'Nepal';

-- Question 5 - Which staff member had the most transactions?
select first_name, last_name, COUNT(payment_id)
from staff
full join payment
on staff.staff_id = payment.staff_id
group by first_name, last_name
order by COUNT(payment_id) desc;

-- Question 6 - How many movies of each rating are there?
select rating, COUNT(rating) from film
group by rating
order by COUNT(rating) desc; 

-- Question 7 - Show all customers who have made a single payment above $6.99 (Use subqueries)
select first_name, last_name 
from customer 
where customer_id in (
	select customer_id
	from payment 
	where amount > 6.99
	group by customer_id 
)

-- Question 8 - How many free rentals did our stores give away?
select COUNT(rental_id)
from rental 
where rental_id in (
	select rental_id 
	from payment
	where amount = 0.00
)