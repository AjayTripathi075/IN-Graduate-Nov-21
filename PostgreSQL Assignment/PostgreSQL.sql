1) Select all fields, and all records from actor table

-select * from actor

2) Select all fields and records from film table

-select * from film

3) Select all fields and records from the staff table

-select * from staff

4) Select address and district columns from address table

-select address,district from address

5) Select title and description from film table

-select address,district from address

6) Select city and country_id from city table

-select city,country_id from city

Select all the distinct last names from customer table

-select distinct last_name from customer

Select all the distinct first names from the actor table

--select distinct first_name from actor

7) Select all the distinct inventory_id values from rental table

-select distinct inventory_id from rental

8) Find the number of films ( COUNT ).

-select count(*) from film

9) Find the number of categories.

-select count(*) from categories

10) Find the number of distinct first names in actor table

-select distinct first_name from actor

11) Select rental_id and the difference between return_date and rental_date in rental table

-SELECT rental_id,return_date-rental_date FROM rental;




section - 4


1) Select all records from data_src which came from the journal named 'Food Chemistry'.

-select count(*) from data_src where journal = 'Food Chemistry'

2) Select record from nutr_def where nutrdesc is Retinol.

-select * from nutr_def where nutrdesc ='Retinol'

3) Find all the food descriptions (food_des) records for manufacturer Kellogg, Co. (must include punctuation for exact match).

-SELECT * FROM food_des WHERE manufacname = 'Kellogg, Co.';

4) Find the number of records in data sources (data_src) that were published after year 2000 (it is numeric field).

-select * from data_src where year >=2000

Find the number of records in food description that have a fat_factor < 4.

- select count(*) from food_des where fat_factor < 4

Select all records from weight table that have gm_weight of 190.

-select * from weight  where gm_weight = 190

5) Find the number of records in food description table that have pro_factor greater than 1.5 and fat_factor less than 5.


-select count(*) FROM food_des WHERE pro_factor > 1.5 AND fat_factor < 5;


6) Find the record in data source table that is from year 1990 and the journal Cereal Foods World.

- select * from data_src where year = 190 and journal='Cereal Foods World'

Select count of weights where gm_wgt is greater than 150 and less than 200.

- select count(*) from weights where gm_wgt > 150 and gm_wgt < 200

Select the records in nutr_def table (nutrition definitions) that have units of kj or kcal.

-select * from nutr_def where units ='kg' or units ='kcal';

7) Select all records from data source table (data_src) that where from the year 2000 or the journal Food Chemistry.

-SELECT * FROM data_src WHERE year=2000 OR journal='Food Chemistry';


8) How many records in food_des are not about food group Breakfast Cereals.  The field fdgrp_cd is an id field and you will have to find it in fd_group for fddrp_desc = ' Breakfast Cereals'.

9) Find all the records in data sources that where between 1990 and 2000 and either 'J. Food Protection' or 'Food Chemistry'.

-SELECT * FROM data_src WHERE (year >= 1990 AND year <=2000) AND (journal = 'J. Food Protection' OR Journal='Food Chemistry');


10) Use BETWEEN syntax to find number of weight records that weight between 50 and 75 grams (gm_wgt).

-SELECT COUNT(*) FROM weight WHERE gm_wgt BETWEEN 50 AND 75;

11) Select all records from the data source table that were published in years 1960,1970,1980,1990, and 2000.  Use the IN syntax.

-SELECT * FROM data_src WHERE year IN (1960,1970,1980,1990,2000);
