VIEWS :-
-------

 - VIEW NOTHING MORE THEN SAVE SQL QUERY.
 - VIEW CAN  BE CONSIDER AS VIRTUAL TABLE.
 - It is a virtual table, which is created according to the result set of an SQL query. 
 
 SYNTAX :-
 
  CREATE VIEW VIEW_NAME AS
  SQL DEFINATION
  
EXAMPLE :-

1) HOW TO CREATE VIEW :- 
----------------------

1) REATE VIEW CALLED customer_order_details that links customers, orders and order_details

 - 
    CREATE VIEW customer_order_details
    AS
    SELECT companyname , orders.customerid,employeeid,requireddate,shippeddate
    FROM customers
    NATURAL JOIN orders
    NATURAL JOIN order_details
	
2)CREATE VIEW CALLED suppliers_order_details that link suppliers,orders,ordersdetails.

 - Create VIEW suppliers_order_details
    AS
   SELECT companyname , suppliers.supplierid,products.productid,order_details.unitprice,quantity,orders.*
   FROM suppliers
   NATURAL JOIN products
   NATURAL JOIN order_details
   NATURAL JOIN orders	
   
   

2)HOW TO MODIFY VIEW :-
--------------------

  1) ADD CONTACT DETAILS ON customer_order_details
  
   -> CREATE OR REPLACE VIEW public.customer_order_details
      AS
     SELECT customers.companyname,
    orders.customerid,
    orders.employeeid,
    orders.requireddate,
    orders.shippeddate,
	customers.contactname
   FROM customers
     JOIN orders USING (customerid)
     JOIN order_details USING (orderid);
	 
  2)ADD PHONE TO suppliers_order_details VIEW YOU TO CREATE IN LAST EXCERCISE.
  
  -> CREATE OR REPLACE VIEW public.suppliers_order_details
     AS
    SELECT suppliers.companyname,
    suppliers.supplierid,
    products.productid,
    order_details.unitprice,
    order_details.quantity,
    orders.orderid,
    orders.customerid,
    orders.employeeid,
    orders.orderdate,
    orders.requireddate,
    orders.shippeddate,
    orders.shipvia,
    orders.freight,
    orders.shipname,
    orders.shipaddress,
    orders.shipcity,
    orders.shipregion,
    orders.shippostalcode,
    orders.shipcountry,
	suppliers.phone
    FROM suppliers
     JOIN products USING (supplierid)
     JOIN order_details USING (productid, unitprice)
     JOIN orders USING (orderid); 
	 
	 
- MODIFY THE VIEW NAME :-
    
      ALTER VIEW customer_order_details RENAME TO 	customer_orders_details


3) CREATING UPDATABLE VIEW :-
---------------------------

     - UPDATE north_america_customers SET
       companyname ='MLTD' WHERE customerid = 'SAVEA'
	   
4) WITH CHECK OPTION :-
---------------------
     - change  north_america_customers to check that the country is correct and test.
	 
     -> CREATE OR REPLACE VIEW north_america_customers AS
       SELECT * FROM customers WHERE country IN('USA','CANADA') WITH LOCAL CHECK OPTION;
	   
	   
5) DELETE VIEW :-
----------------	   
	   
	   -> DROP VIEW north_america_customers;