FUNCTION AND PRODEDURE :-
-----------------------

1) CREATE FIRST FUNCTION :-

   i) write a function called fix_homepage that updates all suppliers with in homepage field to null.
   ->
       CREATE  OR REPLACE FUNCTION fix_homepage() RETURNS void AS $$
	UPDATE suppliers
	SET homepage='N/A'
	WHERE homepage IS NULL;
        $$ LANGUAGE SQL;

   ii) create a function called set_employee_default_photo to update any missing phptopath to a default 'http://accweb/emmployees/default.bmp' and run.
   -> 
     CREATE OR REPLACE FUNCTION set_employee_default_photo() RETURNS void AS $$
	UPDATE employees
	SET photopath='http://accweb/emmployees/default.bmp'
	WHERE photopath IS NULL;
       $$ LANGUAGE SQL;


     SELECT set_employee_default_photo();


2)write a function that returns a single value :-

   i)find the maximum price of any product.
    -> 
       CREATE OR REPLACE FUNCTION max_price() RETURNS INTEGER AS $$
       SELECT MAX(unitprice) FROM products
       $$ LANGUAGE SQL;

      SELECT max_price()

  ii) write a function biggest_order that returns order in terms of total money spent.

    -> CREATE OR REPLACE FUNCTION biggest_order() RETURNS DOUBLE PRECISION AS $$
   
       SELECT MAX(amount) FROM
      (SELECT SUM(unitprice * quantity) AS amount , orderid FROM order_details
      GROUP BY orderid)as total

      $$ LANGUAGE SQL;

     SELECT biggest_order();


3)FUNCTION WITH PARAMETER :-

  I)find the largest amount given a specified customer.
  -> 
     CREATE OR REPLACE FUNCTION customer_largest_order(cid bpchar) RETURNS double precision AS $$
	SELECT MAX(order_total) FROM
	(SELECT SUM(quantity*unitprice) as order_total,orderid
	FROM order_details
	NATURAL JOIN orders
	WHERE customerid=cid
	GROUP BY orderid) as order_total;
    $$ LANGUAGE SQL;

   SELECT customer_largest_order('ANATR');

  II)Find the most ordered product of a particular customer by number of items ordered. call funtcion most_ordered_product.

   -> CREATE OR REPLACE FUNCTION most_ordered_product(customerid bpchar) RETURNS VARCHAR(50) AS $$

    SELECT productname
	FROM products
	WHERE productid IN
	(SELECT productid FROM
	(SELECT SUM(quantity) as total_ordered, productid
	FROM order_details
	NATURAL JOIN orders
	WHERE customerid= $1
	GROUP BY productid
	ORDER BY total_ordered DESC
	LIMIT 1) as ordered_products);
   
    $$ LANGUAGE SQL;

   SELECT most_ordered_product('ANATR');

4) function with output parameter.
->
   - using IN,OUT,INOUT(BOTH INPUT AND OUTPUT) AND VARIADIC(covered with arrays).

  syntax ;-
   
   CREATE FUNTCION FUNTCION_NAME (IN X INT , IN Y INT,OUT SUM INT)

 I) create a function to both add and multiply two number.
  ->
     CREATE FUNCTION sum_n_products( x int, y int,OUT sum int,OUT product int)AS $$
     SELECT x + y , x*y
     $$ LANGUAGE SQL;

    SELECT sum_n_products(5,6);

  II)create function that take a single number and return the square and cube of the number using OUT parameters. call it square_n_cube.
   
  -> CREATE FUNCTION square_n_cube( x int,OUT square int,OUT cube int)AS $$
     SELECT x*x , x*x*x
     $$ LANGUAGE SQL;

     SELECT square_n_cube(2)
 
- creating type to return funtcion.
  - CREATE TYPE sum_prod AS (sum int,product int)
  - CREATE FUNCTION sum_n_products(X INT,Y INT) RETURNS sum_prod ;


5)Function with Default values:-

  syntax :-

        CREATE FUNTCION FUNCTION_NAME(a int,b int DEFAULT 2,C DEFAULT 7);

   I) redo new_price funtcion with a default of 5 % price increase.
   ->
      CREATE FUNCTION new_price(products,increase_percent NUMERIC DEFAULT 165) RETURNS DOUBLE PRECISION AS $$
      SELECT $1.unitprice * increase_percent / 100;
      $$ LANGUAGE SQL;

     SELECT productname,unitprice,new_price(products.*) FROM products

  II) redo square_n_cube create a function that takes a single number and returns the square and cube 
      of the number using OUT parameter . GIVES THE DEFAULT VALUE 10.
  
   ->CREATE FUNCTION square_n_cube(x int DEFAULT 10,OUT square int,OUT cube int)AS $$
     SELECT x*x , x*x*x
     $$ LANGUAGE SQL;
	 
     SELECT square_n_cube();


6)Function that return more then one rows:-

 I) return all the products that have total sales greater then some input values.
 ->
   CREATE OR REPLACE FUNCTION sold_more_than(total_sales real)
   RETURNS SETOF products AS $$
   SELECT * FROM products
   WHERE productid IN (
	 SELECT productid FROM
 	 (SELECT SUM(quantity*unitprice),productid
	 FROM order_details
	 GROUP BY productid
	 HAVING SUM(quantity*unitprice) > total_sales) as qualified_products
    )
  $$ LANGUAGE SQL;

  SELECT productname, productid, supplierid
  FROM sold_more_than(25000);

 II)create a funtcion that all the suppliers that have the products that need to be ordered (unitson hand 
    units ordered is less then orders level ) USE SETOF SYNTAX.

 -> 
    CREATE OR REPLACE FUNCTION suppliers_to_reorder_from()
    RETURNS SETOF suppliers AS $$
    SELECT * FROM suppliers
    WHERE supplierid IN (
	 SELECT supplierid FROM products
	  WHERE unitsinstock + unitsonorder < reorderlevel
    )
    $$ LANGUAGE SQL;

   SELECT * FROM suppliers_to_reorder_from()
	 

7) PROCEDURE :-

   - syntax :-
   
      create or replace procedure procedre_name(parameter list) AS $$
         STATEMENT;
      $$ LANGUAGE SQL;

   I)CREATE A SIMPLE add_em() add two integer.
   -> CREATE OR REPLACE PROCEDURE add_em( x int, y int , z int) AS $$
      SELECT  x + y + z;
      $$ LANGUAGE SQL

      call add_em(5,6,7); 


   II) CREATE A PROCEDURE change_suppliers_price that takes the supplierid and amount and inceases all the units prices in products tables for that suppliers.

    -> 
        CREATE OR REPLACE PROCEDURE change_suppliers_price (supplierid numeric,amount numeric) AS $$

        UPDATE products SET 
        unitprice = unitprice + amount
        WHERE supplierid = $1; 

        $$ LANGUAGE SQL

       CALL change_suppliers_price(20,0.50);


 

 