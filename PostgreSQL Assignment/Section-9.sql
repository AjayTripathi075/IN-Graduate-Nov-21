Section : 09
============

1)Group By :- used to groupping the column values

  1) Do we have in each Country

  - SELECT country , COUNT(*) FROM customers GROUP BY country ORDER BY country

  2)what is the number of product in each category.

  - SELECT categoryname FROM  categories NATURAL JOIN products GROUP BY categoryname ORDER BY categoryname

  3) what is the average number of items ordered of products ordered by the average amount.

  - SELECT productname ,AVG(quantity) from products join order_details USING(productid)
     GROUP BY productname 
     ORDER BY AVG(quantity) DESC

  4) How many suppliers in each country.

   - SELECT country , COUNT(*) FROM suppliers GROUP BY country ORDER  BY COUNT(*) DESC;

   5) total value of each product sold for year of 1997.

    - SELECT productname,SUM(order_details.unitprice * quantity) FROM products 
      JOIN order_details ON products.productid = order_details.productid 
      JOIN orders ON orders.orderid = order_details.orderid
      WHERE orderdate between '1997-01-01' AND '1997-12-31'
      GROUP BY productname ORDER  BY SUM(order_details.unitprice * quantity) DESC

2)Using Having to filter Groups

  I)Fing The product that sold less then $2000.

  - SELECT productname, SUM(order_details.unitprice * quantity) as AmountBought
     FROM products JOIN order_details USING (productid)
     GROUP BY productname 
     HAVING SUM(order_details.unitprice * quantity) < 2000
     ORDER BY productname DESC ;

   II) Customer that have bought more then $5000 of products.

    - SELECT companyname, SUM(order_details.unitprice * quantity) as AmountBought
      FROM customers 
      NATURAL JOIN orders
      NATURAL JOIN order_details
      GROUP BY companyname 
      HAVING SUM(order_details.unitprice * quantity) > 5000
      ORDER BY companyname DESC;

   III)customer that brought more then $5000 of products with orderdate in first six months of the year of 1997.
 
    - SELECT companyname, SUM(order_details.unitprice * quantity) as AmountBought
      FROM customers 
      NATURAL JOIN orders
      NATURAL JOIN order_details
      WHERE orderdate BETWEEN '1997-01-01' AND '1997-06-30'
      GROUP BY companyname 
      HAVING SUM(order_details.unitprice * quantity) > 5000
      ORDER BY companyname DESC;


3)GROUPPING SETs :-

  - SELECT categoryname,productname, SUM(od.unitprice * quantity) as AmountBought
    FROM categories 
     NATURAL JOIN products 
     NATURAL JOIN order_details AS od 
    GROUP BY GROUPING SETS ((categoryname),(categoryname,productname)) 
    HAVING SUM(od.unitprice * quantity) > 5000
    ORDER BY categoryname ,productname;

4)Rollup :- Rollup same as Grouping sets

   I)ROLL up category , products,customer
     
     - 
        SELECT C.companyname,categoryname,productname, SUM(od.unitprice * quantity) as AmountBought
        FROM customers AS C 
        NATURAL JOIN orders 
        NATURAL JOIN order_details AS od 
        JOIN products USING(productid)
        JOIN categories Using(categoryid)
        GROUP BY ROLLUP (companyname,categoryname,productname) 
        ORDER BY companyname,categoryname ,productname;


5)CUBE :- SAME AS ROLLUP

   I)CUBE category , products,customer
    -
       SELECT C.companyname,categoryname,productname, SUM(od.unitprice * quantity) as AmountBought
       FROM customers AS C 
       NATURAL JOIN orders 
       NATURAL JOIN order_details AS od 
       JOIN products USING(productid)
       JOIN categories Using(categoryid)
       GROUP BY CUBE (companyname,categoryname,productname) 
       ORDER BY companyname,categoryname ,productname;