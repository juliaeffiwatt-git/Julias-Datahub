-- POSTGRESQL July Class

-- Starting with the SELECT statement

-- SELECT FROM STATEMENT
-- we use to select statement to fetch all the columns, multiple columns or a single from a table

-- ALL COLUMNS
-- We use '*' after the SELECT statement to fetch all the columns in a table

-- Let us explore the Actor Table
SELECT * 
FROM actor;

SELECT *
FROM film;

-- Challenge 1
-- fetch all the columns in the payment table 

SELECT *
FROM payment;

-- MULTIPLE COLUMNS
-- specify the column names after the select statement

-- for example;
SELECT customer_id, payment_id, amount
FROM payment;

SELECT first_name, last_name
FROM actor;

-- Challenge 2
-- use a select statement to fetch a firstname and last name of every customer and their email address. 
SELECT *
FROM customer;

SELECT first_name, last_name, email address
FROM customer;

-- SINGLE COLUMN 
-- Just specify the column name after the SELECT statement

-- for example;

SELECT title
FROM film;

SELECT actor_id
FROM actor;

-- REMOVING DUPLICATE
-- To remove dulicate, we use the 'DISTINCT' keyword after the SELECT statement

-- for example;

SELECT *
FROM film;

SELECT rating
FROM film;

SELECT DISTINCT rating
FROM film;

-- Challenge 3
-- what are the release years of movies in the film table? 

SELECT DISTINCT release_year
FROM film;


-- FILTERING RECORDS
-- We use the 'WHERE' keyword to filter records
-- we filter with : OPERATORS -- (>, <, =, !=, AND, OR)

-- for example;
-- fetch all info of customers whose first name is 'Jamie'

SELECT *
FROM customer;

SELECT *  
FROM customer
WHERE first_name = 'Jamie';

-- fetch all info of customers whose first name is 'Jamie' AND/OR last name is 'Rice'

SELECT *
FROM customer
WHERE first_name = 'Jamie' AND last_name = 'Rice';


SELECT *
FROM customer
WHERE first_name = 'Jamie' OR last_name = 'Rice';

-- fetch customers whose paid rental rate amount is greater than 10

SELECT *
FROM payment;

SELECT customer_id, amount
FROM payment
WHERE amount > 10;

-- Challenge 4
-- Select the phone column from the address and use the where clause to condition the known('259 Ipoh Drive')

SELECT Phone
FROM address
WHERE address = ('259 Ipoh Drive');


-- WORKING WITH PREDICATES
-- BETWEEN, NOT BETWEEN, IN
-- They are used to filter range of values. It is used to replace >=, AND, <=


-- for example;
-- We want the customerid and amount paid between $8 and $10

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 8 AND 10;

--NOT BETWEEN: it is a negation of BETWEEN

SELECT customer_id, amount
FROM payment
WHERE amount NOT BETWEEN 8 AND 10;


-- IN: it is used to replace mutiple = SIGN

--  for example;

-- Get all info of customers with id 361, 362 and 363

SELECT *
FROM customer
WHERE customer_id IN (361, 362, 363);

-- WITHOUT IN

SELECT *
FROM customer
WHERE customer_id =361 OR customer_id= 362 OR customer_id= 363;

-- NOT IN: it is a negation of IN

SELECT *
FROM customer
WHERE customer_id NOT IN (361, 362, 363) ;


-- LIKE: it is used to pattern filtering of records
-- it works with two symbols: % ===> wildcard(as many characters as possible), _ ===> Underscore(one character at a time)

-- for example;
--we want to fetch info of customer with first name starting with 'Jen'

SELECT *
FROM customer
WHERE first_name LIKE 'Jen%';

-- get the names of customers whoose names ends with 'is'

SELECT *
FROM customer
WHERE last_name LIKE '%is';

-- NOTE : LIKE is case sensitive, to remove the case SENsitivity, we use ILIKE

SELECT *
FROM customer
WHERE first_name ILIKE 'JEn%';

-- UNDERSCORE(_)
-- it is used to match any single character

-- for example;
-- find all records where the first name starts with 'Joh' and ends with any single character

SELECT *
FROM customer
WHERE first_name LIKE 'Joh_';

SELECT *
FROM film;

-- fetch all the films whose title starts with 'F' and is followed by any two characters.

SELECT *
FROM film
WHERE title ILIKE 'F__';

-- SORTING RECORDS
-- ORDER BY ===> it is used to sort/arrange records
-- We can sort by : ASCENDING ===> Lowest to highest, A - Z, 0 - 10 and DESCENDING ===> highest to lowest; Z-A, 10 - 0

-- ASC ===> used to sort in ascending order while DESC ===> used to sort in descending order

-- for example;

SELECT first_name, last_name
FROM customer
ORDER BY last_name ASC;

SELECT first_name, last_name
FROM customer
ORDER BY last_name DESC;

-- LIMITING RECORDS
-- LIMIT ===> used to limit record.

SELECT first_name, last_name
FROM customer
ORDER BY last_name ASC
LIMIT 5;


SELECT first_name, last_name
FROM customer
ORDER BY first_name DESC
LIMIT 100;

-- Challenge 5
-- get the customer id numbers from the top 10 highest amount

SELECT customer_id, amount
FROM payment
ORDER BY amount DESC
LIMIT 10;

-- ALIASESthese are used to rename a column or table
-- it uses the 'AS' keyword

SELECT first_name, last_name AS surname
FROM customer;

-- AGGREGATE
-- are used to perform simple, statitical operations. They operate on a column at a time.
-- they change column name to themselves
-- the column to be aggregated should be within a bracket ()
-- they are used after the SELECT statement
-- these aggregates are SUM, MAX, MIN, COUNT, AVG

SELECT amount
FROM payment;


-- MIN: this returns the minimum value in a column

SELECT MIN (amount) AS min_amount
FROM payment;


-- MAX: this returns the maximum value in a column

SELECT MAX (amount) AS max_amount
FROM payment;

--AVG: this returns the average/mean of values in a column

SELECT AVG(amount) AS avg_amount
FROM payment;

-- SUM: this sums up all the values in a column

SELECT SUM (amount) AS sum_amount
FROM payment;

-- COUNT: this returns the frequency of values in a column

SELECT DISTINCT COUNT (amount) AS count_amount
FROM payment;

-- note: count(column name) doesnt count null values
-- to count null values, we use count(*)

-- GROUPING RECORDS
-- we use GROUP BY function to group records. it woeks well with aggregate functions.

-- for example:
-- what is the total amount spent by each customer?

SELECT customer_id, SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id;

-- How mny transaction were performedby esch cutomer?

SELECT customer_id, COUNT(amount) AS count_trans
FROM payment
GROUP BY customer_id;

-- Challenge 6
-- find the total amount of films we have for each rating.

SELECT rating, COUNT(film_id) as count_rating
FROM film
GROUP BY rating;

-- FILTERING GROUP RECORDS
-- HAVING ===> it is used to filter grouped records, it is very similar to WHERE clause.
-- It can do everything the WHERE clause does, and you can use it with operators and predicates

-- Difference between HAVING and WHERE clause: 
-- Having is used to filter grouped records while WHERE is used to filter ungrouped records

-- for example;

-- How much has the customers who spent above $200 spent exactly?

SELECT customer_id, SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;


-- JOINS
-- Joins are usd to merge two or more tables together
-- The tables are joined based on the Primary-foreign key relationship.


-- Types of Joins
-- INNER, LEFT, RIGHT and FULL

-- STEPS FOR JOINING TABLES
--1. Identify the tables to join
--2. Take note of the relationship keys
--3. Take note of the columns needed and table each columns belong
--4. Put all the columns in a single SELECT statement
--5. Add the first table after the FROM statement
--6. State the join type
--7. Add the second table
--8. Introduce the joining condition based on the relationship

-- To prevent ambigous columns:
-- we ALIAS our table names
-- we use table.columnname syntax on the ambigous columns, this specify the tables where the columns are present.

-- INNER: this gives what is common to both tables

-- for example;
-- we want to know the names of the customers that patronise us

-- tables to join ===> customer, payment
-- columns from the customer: customer_id, first_name, last_name 
-- columns from payment: customer_id, payment_id, amount

-- 	Relationship Key ===> customer_id

SELECT C.customer_id, first_name, last_name, P.customer_id, payment_id, amount
FROM customer AS C
INNER JOIN payment AS P
ON C.customer_id = P.customer_id;


-- LEFT JOIN
-- this preserves the record on the columns of the table in the left side
-- and only the matching record of the right side is shown
-- the unmatching rows would be represented be NULL values

-- for example;

-- Get the names of the films and confirm if they are in the inventory table or not.

-- Table ===> film, inventory

-- columns in film table : film_id, title
-- columns in inventory table : film_id, inventory_id

-- Relationship Key: film_id

SELECT F.film_id, title, I.film_id, inventory_id
FROM film AS F
LEFT JOIN inventory AS I
ON F.film_id = I.film_id;


-- DATA DEFINITION LANGUAGES
-- These are used to define database objects
-- OBJECTS ===> Database, Schema, Tables

-- CREATE
-- this is used to create an Object(database or table)

-- To create a database

CREATE DATABASE PostGreSQL_Class_2023;

-- To create TABLES

-- Steps to  creating TABLES
--1. we use the syntax ===> CREATE TABLE TABLENAME()
--2. we add the column names with the brackets
--3. we add the datatypes to each column
--4. we specify the relationship (PRIMARY or FOREIGN)
--5.we add constraint(unique, not null, autoincrement)

-- PRIMARY KEY ===> UNIQUE and NOT NULL

-- Let create a table for our class:





-- ASSIGNMENT

-- 1. How many payment transactions were greater than $5.00?

SELECT *
FROM payment;

SELECT amount, COUNT(amount) 
FROM payment AS P
WHERE amount >5
GROUP BY P.amount
HAVING COUNT(amount) >5
ORDER BY COUNT(amount) desc;


-- 2. How many Actors have a first name that starts with he letter P?

SELECT first_name, COUNT(first_name)
FROM actor
WHERE first_name ='P'
GROUP BY first_name;



--3. How many unique districts are our customers from?

SELECT DISTINCT district, COUNT (district)
FROM address
GROUP BY district;


--4. Retrieve the list of names for those distinct districts from the previous question.

SELECT *
FROM address

SELECT DISTINCT district
FROM address;



--5. How many Films have the word Truman somwhere in the title?

SELECT *
FROM film

SELECT title
FROM film
WHERE title ILIKE '%Truman%';



-- 6. Create a table to organize our potential leads! We will have the following
-- A customer's first name, last name, email, sign-up date, and number of minutes spent on the dvdrental site.
-- You should also have some sort of id tracker fr them. You have free reign on how you want to create this table.


CREATE TABLE Potential_leads_22 (tracker_id INT PRIMARY KEY,
								first_name VARCHAR(50),
								last_name VARCHAR (50),
								email VARCHAR (50),
								sign_up_date date NOT NULL,
								sign_in timestamp NOT NULL,
								sign_out timestamp NOT NULL);


SELECT *
FROM potential_leads_22;





























