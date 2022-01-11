Section - 6
=============

1) clear the command :-
                         \! clear

2)Change the Database Directive :-
                                  \c <database_name>

3)Show available schemas :-
                            \dn

4)show available tables:-

                         \dt schema_name.


Section-7:-
===========

1) OrderBy :-

 -  SELECT DISTINCT country FROM suppliers ORDER BY country desc;
 -   SELECT productname,unitPrice FROM products ORDER BY unitPrice DESC, productname ASC;

2) MIN AND MAX:-

   - SELECT MIN(orderdate) FROM orders where shipcountry='italy';
   - SELECT MAX(shippeddate) FROM orders where shipcountry='canada';
   - SELECT MAX(shippeddate - orderdate) FROM orders where shipcountry='France';

3) AVG AND SUM :-
   
   - SELECT AVG(freight) FROM orders where shipcountry='Brazil';
   - SELECT SUM(quantity) from order_details WHERE productid = 14;
   - SELECT AVG(quantity) from order_details WHERE productid = 35;

4)Like and match pattern:-

    I) First Name start with D.
  
    - SELECT * FROM customers WHERE first_name LIKE 'D%';

   II) 'OR' ON second and third letter on company Name.
    
    - SELECT companyname FROM suppliers WHERE companyname LIKE '_OR%';

   III)Which Customer Name End With 'er';

    - SELECT companyname FROM customers WHERE companyname LIKE '%er';


5) Remaining Column with Alias :-

   - SELECT (unitprice * quantity) AS TotalPrice FROM order_details;


6)LIMIT:-

  - SELECT productid,unitprice * quantity AS TotalCost FROM order_details ORDER BY TotalCost DESC LIMIT 3;
  - SELECT productid , unitprice * unitinstock as TotalInventory FROM product ORDER BY TotalInventory ASC LIMIT 2;

7)NULL VALUES:-

   - SELECT COUNT(*) FROM customers where region IS NULL;
   - SELECT COUNT(*) FROM customers where region IS NOT NULL;

   I) HOW MANY ORDERS DID NoT HAVE A SHIP REGIONS?

   - SELECT COUNT(*) FROM orders WHERE shipregions IS NULL;


8) Practices :

1)Return the name, weight, and productnumber of  all the products  ordered by weight from lightest to heaviest.  (Remember to use schema to reach table.  It is in production schema.)

  - SELECT name,weight,productnumber FROM production.product ORDER BY weight ASC;


2)Return the records from productvendor for productid = 407 in order of averageleadtime from shortest to longest. (You'll have to figure out which schema this is in.)

  -SELECT * FROM purchasing.productvendor WHERE productid=407 ORDER BY averageleadtime ASC;

3)Find all the salesorderdetail records for productid 799 and order them by largest orderqty to smallest.

  -SELECT * FROM sales.salesorderdetail WHERE productid=799 ORDER BY orderqty DESC;

4)What is the largest  discount percentage offered in the specialoffer table.

  - SELECT MAX(discountpct) FROM sales.specialoffer;

5)Find the smallest number of sickleavehours for an employee.

  -SELECT MIN(sickleavehours) FROM humanresources.employee;

6)Find the largest rejected quantity in the purchaseorderdetail table.

  -SELECT MAX(rejectedqty) FROM purchasing.purchaseorderdetail;

7)Find the average rate from employeepayhistory table.

  - SELECT AVG(rate)FROM humanresources.employeepayhistory;

8)Find the average standardcost in the productcosthistory table for productid 738.

  - SELECT AVG(standardcost) FROM production.productcosthistory WHERE productid=738;

9)Find the sum of scrappedqty from the workorder table for productid 529.

 - SELECT SUM(scrappedqty)FROM production.workorder WHERE productid = 529;

10)Find all vendor names with a name that starts with letter G.

 - SELECT name FROM purchasing.vendor WHERE name LIKE 'G%';

11)Find all vendor names that have the word Bike in them.

  - SELECT name FROM purchasing.vendor WHERE name LIKE '%Bike%';

12)Search the person table for every firstname that has t as a second letter.

  - SELECT firstname FROM person.person WHERE firstname LIKE '_t%';

13)Return the first 20 records from emailaddress table.

 - SELECT * FROM person.emailaddress LIMIT 20;

14)Return the first 2 records from productcategory table.

 - SELECT * FROM production.productcategory LIMIT 2;

15)How many product records have a missing weight value.

  - SELECT COUNT(*) FROM production.product WHERE weight IS NULL;

16)How many person records have an additionalcontactinfo field that has a value.

  - SELECT COUNT(*) FROM person.person WHERE additionalcontactinfo IS NOT NULL;