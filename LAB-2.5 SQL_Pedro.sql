USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’. --
SELECT * from actor where first_name='Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented? --
SELECT count(distinct(film_id)) from inventory; -- Avalaible films for rent --
SELECT count(*) from film  where rental_duration > 0; -- Rented films --

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration. --
SELECT max(length) as max_duration from film; 
SELECT min(length) as min_duration from film;
SELECT TITLE,length from film where (length = 185); -- movies with the longest duration --
SELECT TITLE,length from film where (length = 46); -- movies with the shortest duration --

-- 4. What's the average movie duration expressed in format (hours, minutes)? --???
SELECT convert(avg(length),time) as average_movie_duration from film; 
/*-- Not correct, this function doesn't convert units; 
Didn't find,form research any that does it --*/

-- 5. How many distinct (different) actors' last names are there? --
SELECT count(distinct(last_name)) from actor;

 -- 6. Since how many days has the company been operating (check DATEDIFF() function) --
SELECT max(rental_date),min(rental_date) from rental; -- To confirm the result --
SELECT DATEDIFF(max(rental_date), min(rental_date)) as days_since_company_operating from rental; -- I can only get the result in days; It's not possible to have it on years or months?

-- 7. Show rental info with additional columns month and weekday. Get 20 results --
SELECT *, DAYNAME(rental_date) AS weekday, MONTHNAME(rental_date) AS month from  rental limit 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week --
SELECT *, WEEKDAY(rental_date) AS weekday_id,
CASE  
WHEN WEEKDAY(rental_date) = 5 then 'weekend'
WHEN WEEKDAY(rental_date) = 6 then 'weekend'
ELSE 'workday'
END AS day_type
from rental;

 -- 9. Get release years. --
SELECT distinct (release_year) from film;

-- 10. Get all films with ARMAGEDDON in the title. --
SELECT * FROM film where title like '%ARMAGEDDON' or title like 'ARMAGEDDON%'; 

-- 11. Get all films which title ends with APOLLO --
SELECT * FROM film where title like '%APOLLO'; 

-- 12. Get 10 the longest films. --
SELECT * from film order by length desc limit 10;

-- 13. How many films include Behind the Scenes content--

SELECT * from film where (special_features IN ('Behind the Scenes')); 
/*-- This is not 100% correct because in this way i can't get all the films that 
have "Behind Scenes. The films that have other special_features including Behing Scenes doesn't appear --
*/

