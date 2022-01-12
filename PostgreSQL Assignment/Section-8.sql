Section-8
=========

1)Diagramming Table Relationship :-

2)Grabbing information From Two Tables

  I)returns customername , orderdate, shipdate details.
 
   - SELECT contactname , orderdate, shippeddate FROM orders JOIN customers ON customers.customerid = orders.customerid;
   
  II)connect employee to orders and pull firstname , lastname ,orderdate for all the orders.

  - SELECT firstname,lastname , orderdate FROM orders JOIN employees ON employees.employeeid = orders.employeeid;

  III)Connect products to suppliers and pull back companyname ,unitcost  and unit in stock.

  - SELECT companyname,unitprice , unitsinstock FROM products JOIN suppliers ON suppliers.supplierid = products.supplierid; 


3)Grabbing information from multiple tables.

  I)Bring Back  companyname, order date ,productid unitprice and quantity.

   - SELECT companyname,orderdate,productid,unitprice ,quantity FROM orders JOIN customers ON orders.customerid = customers.customerid
      JOIN order_details ON order_details.orderid= orders.orderid


  II)Connect product to the previous query add productname on field.

   - SELECT companyname ,productname,orderdate,order_details.unitprice ,quantity FROM orders
      JOIN order_details ON order_details.orderid = orders.orderid
      JOIN customers ON customers.customerid = orders.customerid
      JOIN products ON products.productid = order_details.productid

  III)Connect Categories to the previous query to add categoryname on field

    - SELECT companyname ,productname,categoryname,orderdate,order_details.unitprice ,quantity FROM orders
      JOIN order_details ON order_details.orderid = orders.orderid
      JOIN customers ON customers.customerid = orders.customerid
      JOIN products ON products.productid = order_details.productid
      JOIN categories ON categories.categoryid = products.categoryid

  IV)to take previous query and add a where clause that select category name of seafood and amount spent >=500
 

    - SELECT companyname ,productname,categoryname,orderdate,order_details.unitprice ,quantity FROM orders
       JOIN order_details ON order_details.orderid = orders.orderid
       JOIN customers ON customers.customerid = orders.customerid
       JOIN products ON products.productid = order_details.productid
       JOIN categories ON categories.categoryid = products.categoryid
       WHERE categoryname ='Seafood' AND order_details.unitprice * quantity >= 500


4)left Join:-it return all the non matching record of left table and matching row from right tables.

  I) Bring Back companyname and orderid
    
     - SELECT companyname , orderid FROM customers LEFT JOIN orders ON orders.customerid = customers.customerid 

  II) where orderid is null 

    - SELECT companyname , orderid FROM customers LEFT JOIN orders ON orders.customerid = customers.customerid 
      WHERE orderid IS NULL; 

  III) do left join between products and order_details.

    - SELECT productname , orderid FROM products LEFT JOIN order_details ON products.productid = order_details.productid;



5)right Join:-it return all the non matching record of right table and matching row from left tables.

  I) Bring Back companyname and orderid
    
     - SELECT companyname , orderid FROM customers RIGHT JOIN orders ON orders.customerid = customers.customerid 

  II) where orderid is null 

    -  SELECT companyname , orderid FROM orders  RIGHT JOIN customers ON customers.customerid = orders.customerid
       WHERE orderid IS NULL 

  III) do left join between products and order_details.

    - SELECT productname , orderid FROM order_details RIGHT JOIN products ON order_details.productid = products.productid;


6)Full Join :- it returns all matching and non matching row from both the tables.

   I) Bring Back companyname and orderid
    
     - SELECT companyname , orderid FROM customers FULL JOIN orders ON orders.customerid = customers.customerid 

  II) where orderid is null 

    -  SELECT companyname , orderid FROM orders  FULL JOIN customers ON customers.customerid = orders.customerid
       WHERE orderid IS NULL 

  III) do left join between products and Categories.

    - SELECT productname , categoryname FROM products FULL JOIN categories ON categories.categoryid = products.categoryid 


7) Self Join :- Join The Tables it self. 

   I)In customer who are same city and order by city.
    
    - SELECT c1.companyname AS customername1 , c2.companyname AS cutomername2 , c1.city FROM  customers AS c1
       JOIN customers AS c2 ON c1.city = c2.city ORDER BY c1.city 

    II)SELECT c1.companyname AS customername1 , c2.companyname AS cutomername2 , c1.city FROM  customers AS c1
       JOIN customers AS c2 ON c1.city = c2.city ORDER BY c1.city


8)Using Reduce Typeing :-


 I) SELECT * FROM orders JOIN order_details Using(orderid)

 II)add product to the order and order_details.
   
  - SELECT * FROM orders JOIN order_details Using(orderid)
     join products USING(productid)
 - 


9)Even Less typeing with Natural Join.

 - SELECT * FROM orders NATURAL JOIN order_details.

 - SELECT * FROM orders NATURAL JOIN order_details NATURAL JOIN customers

 - SELECT companyname,orderdate,orderid FROM orders NATURAL JOIN order_details NATURAL JOIN customers

 - SELECT count(*) FROM orders NATURAL JOIN order_details NATURAL JOIN customers



10)Practices:-


1) Join (with inner join) together person, personphone, businessentity and phonenumber type in the persons schema.  Return first name, middle name, last name, phone number and the name of the phone number type (home, office, etc.)  Order by business entity id descending.

   - SELECT firstname,middlename,lastname,phonenumber,name
      FROM person.personphone AS ph
      JOIN person.businessentity AS be ON be.businessentityid=ph.businessentityid
      JOIN person.person AS pe ON pe.businessentityid=be.businessentityid
      JOIN person.phonenumbertype AS pnt ON pnt.phonenumbertypeid=ph.phonenumbertypeid
      ORDER BY ph.businessentityid DESC; 

2)Join (Inner) productmodel, productmodelproductiondescriptionculture, productdescription and culture from the production schema.  Return the productmodel name, culture name, and productdescription description ordered by the product model name.

 - SELECT firstname,middlename,lastname,phonenumber,name
   FROM person.personphone AS ph
   JOIN person.businessentity USING (businessentityid)
    JOIN person.person USING (businessentityid)
    JOIN person.phonenumbertype USING (phonenumbertypeid)
    ORDER BY ph.businessentityid DESC;

3)Add a join to previous example to production.product and return the product name field in addition to other information.

 - SELECT pm.name,c.name,description
   FROM production.productdescription
   JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
   JOIN production.culture AS c USING (cultureid)
   JOIN production.productmodel AS pm USING (productmodelid)
   ORDER BY pm.name ASC;

4)Join product and productreview in the schema table.  Include every record from product and any reviews they have.  Return the product name, review rating and comments.  Order by rating in ascending order.

  - SELECT name, rating, comments
    FROM production.product
    LEFT JOIN production.productreview USING (productid)
    ORDER BY rating ASC;

5)Use a right join to combine workorder and product from production schema to bring back all products and any work orders they have.  Include the product name and workorder orderqty and scrappedqty fields.  Order by productid ascending.

  - SELECT p.name,orderqty,scrappedqty
    FROM production.workorder
    RIGHT JOIN production.product AS p USING (productid)
    ORDER BY p.productid ASC;

