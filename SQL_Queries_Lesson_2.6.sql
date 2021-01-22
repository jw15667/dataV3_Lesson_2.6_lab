use sakila;
-- Get release years.alter
SELECT distinct release_year from film;

-- Get all films with ARMAGEDDON in the title.
SELECT * from film
where TITLE regexp 'ARMAGEDDON';
-- Get all films which title ends with APOLLO.
select * from film
where TITLE regexp 'APOLLO$';

-- Get 10 the longest films.
SELECT * from film
ORDER BY length desc
limit 10;

-- How many films include Behind the Scenes content?
SELECT * from film
WHERE SPECIAL_FEATURES LIKE '%Behind the Scenes%';

-- Drop column picture from staff.
ALTER TABLE Staff
DROP COLUMN picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer.
-- Update the database accordingly.
select * from staff;
insert into staff value
('3', 'TAMMY', 'SANDERS', '79', 'TAMMY.SANDERS@sakilacustomer.org', '2', '1', 'TAMMY', '', '2020-02-15 03:57:16');
-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select staff_id from staff
where first_name = 'MIKE' and last_name = 'Hillyer';

select film_id from film
where title = 'Academy Dinosaur';

select inventory_id from inventory
where film_id = '1'

insert into rental value
('16050', '2020-08-23 22:50:12', '1', '130', '2020-08-30 01:01:12', '1', '2020-02-15 21:30:53');

-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, 
-- email, and the date for the users that would be deleted. Follow these steps:
-- Check if there are any non-active users
select customer_id, email, last_update from customer
where active = 0;
-- Create a table backup table as suggested
CREATE TABLE deleted_users (
  customer_id int(11) UNIQUE,
  email varchar(50),
  date datetime
) ;
-- Insert the non active users in the table backup table
insert into deleted_users select customer_id, email, last_update as date from customer where active = 0;

-- Delete the non active users from the table customer
alter table payment add CONSTRAINT `f_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;

-- alter table rental add CONSTRAINT `f_rental_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;
DELETE FROM customer where active='0';
