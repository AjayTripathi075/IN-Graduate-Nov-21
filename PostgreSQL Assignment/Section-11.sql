
1) SUBQUERY using exists:-
   ----------------------

  I)Find the customer with an order in april , 1997.

  -> SELECT companyname FROM customers
     WHERE 
     EXISTS (SELECT customerid FROM orders 
	     WHERE orders.customerid = customers.customerid AND 
	     orderdate BETWEEN '1997-04-01' AND '1997-04-30');

   II)FIND ALL THE SUPPLIERS WITH A PRODUCT THATS COSTS MORE THEN $2000.

    ->SELECT companyname FROM suppliers
      WHERE 
      EXISTS (SELECT productid FROM products 
      WHERE products.supplierid = suppliers.supplierid AND 
      unitprice > 200);

   III)FIND ALL THE SUPPLIERS THAT DOESNOT HAVE AN ORDERS IN DECEMBER 1996.
  
     ->SELECT companyname FROM suppliers
       WHERE 
       NOT EXISTS (SELECT products.productid FROM products
       JOIN order_details ON order_details.productid = products.productid	
       JOIN orders ON orders.orderid = order_details.orderid
       WHERE products.supplierid = suppliers.supplierid AND 
       orderdate BETWEEN '1996-10-01' AND '1996-10-31');


1) SUBQUERY using ANY and ALL:-
   ---------------------------

    1) ANY :-
      -----

   I)FIND THE CUSTOMERS WITH AN ORDERS DETAILS WITH MORE THEN 50 ITEMS IN A SINGLE PRODUCTS.

   -> SELECT companyname FROM Customers 
      WHERE customerid =
      ANY (SELECT customerid FROM orders
      JOIN order_details ON order_details.orderid = orders.orderid	
      WHERE quantity > 50);

   II)FIND ALL THE SUPPLIERS THAT HAVE HAD AN ORDERWITH 1 ITEMS.

    -> SELECT companyname FROM suppliers 
       WHERE supplierid =
       ANY (SELECT products.supplierid FROM order_details
       JOIN products ON order_details.productid = products.productid	
       WHERE quantity = 1);

    

    2) ALL :-
      -----
 
      I)we had order amounts that were higher then average of all the products.

      -> SELECT DISTINCT productname FROM products 
         join order_details ON products.productid =  order_details.productid
         WHERE order_details.unitprice*quantity > ALL (SELECT AVG(order_details.unitprice*quantity) FROM order_details
	 GROUP BY productid);

      II)FIND ALL THE CUSTOMER THAT ORDERED more in one item then the average order amount per item of all customers.
 
      ->SELECT DISTINCT companyname FROM customers 
         JOIN orders ON orders.customerid = customers.customerid
         JOIN order_details ON orders.orderid =  order_details.orderid
          WHERE order_details.unitprice*quantity >
          ALL (SELECT AVG(order_details.unitprice*quantity) FROM order_details
          JOIN orders ON orders.orderid = order_details.orderid
	  GROUP BY orders.customerid);


3)SUBQUERY :-
  ---------

     I) that are the same countries as the suppliers.
   
     -> SELECT companyname FROM customers WHERE country IN(SELECT country FROM suppliers);

    II)find all suppliers that are the same city as a customers.

     -> SELECT companyname FROM suppliers WHERE city IN(SELECT city FROM customers);