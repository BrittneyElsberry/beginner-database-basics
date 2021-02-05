/* TABLE PERSON ******************************


#1 */


CREATE TABLE person 
(
 person_id SERIAL PRIMARY KEY,
 name VARCHAR(40), 
 age INT , 
 height INT, 
 city VARCHAR(40), 
 favorite_color VARCHAR(40)

);



/* #2 */

INSERT INTO person 

(favorite_color, 
 city,
 height,
 age,
 name
)

VALUES
('blue', 'midvale', '66', '27', 'Justin Hunter'),
('blue', 'sandy', '68', '31', 'Josh Kump'),
('blue', 'salt lake city', '67', '36', 'Sterling Bitsue'),
('blue', 'denver', '55', '29', 'Kelsi Gamble'),
('blue', 'boulder', '55', '28', 'Kelsey White');


/* #3*/

SELECT * FROM person ORDER BY height DESC;


/* #4*/

SELECT * FROM person ORDER BY height ASC;


/* #5*/

SELECT * FROM person ORDER BY age DESC;

/* #6  */
SELECT * FROM person ORDER BY age > 20;


/* # 7 */
SELECT * FROM person WHERE age = 18;

/* #8 */

SELECT * FROM person WHERE age > 30 OR age < 20;

/* #9 */

SELECT * FROM person WHERE age != 27 ;


/* #10  */

SELECT * FROM person WHERE favorite_color != 'red';

/* #11 */
SELECT * FROM person WHERE favorite_color != 'blue' OR favorite_color != 'red';


/* #12*/

SELECT * FROM person WHERE favorite_color = 'orange' OR favorite_color = 'green';


/* #13*/

SELECT * FROM person WHERE favorite_color IN ('orange','green','blue');

/* #14*/

SELECT * FROM person WHERE favorite_color IN ('yellow','purple');



/* TABLE ORDERS   *******************/
/* #1  ****************************/
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY, 
  person_id INT, 
  product_name VARCHAR(40), 
  product_price INT, 
  quantity INT);



/* #2  ****************************/
INSERT INTO orders (quantity, product_price, product_name, person_id)

VALUES 

(25, 5, 'earrings', 123),
(3, 100, 'dresses', 123),
(2, 500, 'shoes', 234),
(1, 13, 'bracelet', 234),
(10, 150, 'shoes, dresses, earrings', 567);

SELECT * FROM orders;


/* #3  ****************************/

SELECT * FROM orders;


/* #4  ****************************/

SELECT sum(quantity) FROM orders;

/* #5  ****************************/
SELECT sum(product_price) FROM orders;


/* #6  ****************************/
SELECT sum(product_price) FROM orders WHERE person_id = 123;



/*     TABLE ARTIST       *********************/

/*  1. Add 3 new artists to the artist table. ( It's already created )*/

INSERT INTO artist 

(name)

VALUES 
('Rufus Du Sol'),
('Opiuo'),
('Zhu');

/*2. Select 10 artists in reverse alphabetical order.*/

SELECT * FROM artist ORDER BY name DESC LIMIT 10;


/*3. Select 5 artists in alphabetical order.*/

SELECT * FROM artist ORDER BY name LIMIT 5;


/*4. Select all artists that start with the word 'Black'.*/

SELECT * FROM artist WHERE name LIKE 'Black%';

/*5. Select all artists that contain the word 'Black'.        */

SELECT * FROM artist WHERE name LIKE '%Black%';


/*** Table - employee
List all employee first and last names only that live in Calgary.
Find the birthdate for the youngest employee.
Find the birthdate for the oldest employee.
Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
You will need to query the employee table to find the Id for Nancy Edwards
Count how many people live in Lethbridge.**/


/*1*/
SELECT first_name, last_name FROM employee WHERE city = 'Calgary'; 

/*2*/
SELECT * FROM employee ORDER BY birth_date DESC LIMIT 1;

/*3*/

SELECT * FROM employee ORDER BY birth_date LIMIT 1;

/*4*/

SELECT * FROM employee WHERE reports_to = 1;

/*5*/ 
SELECT count(*) FROM employee WHERE city = 'Lethbridge';




/** Table - invoice
Count how many orders were made from the USA. */

SELECT count(*) FROM invoice WHERE billing_country = 'USA';

/*Find the largest order total amount.*/ 

SELECT * FROM invoice ORDER BY total DESC LIMIT 1;


/*Find the smallest order total amount.*/

SELECT * FROM invoice ORDER BY total ASC LIMIT 1;

/*Find all orders bigger than $5. */

SELECT * FROM invoice WHERE total > 5;

/*
Count how many orders were smaller than $5.
*/

SELECT count(*) FROM invoice WHERE total < 5;

/*
Count how many orders were in CA, TX, or AZ (use IN).*/

SELECT count(*) FROM invoice WHERE billing_state IN('CA', 'TX', 'AZ');

/*
Get the average total of the orders.
*/

SELECT avg(total) FROM invoice;

/*
Get the total sum of the orders.

*/

SELECT sum(total) FROM invoice;