
1)UNION :- Remove duplicate record and return different values

  I) find all the companyname of all customers and suppliers , with one records for each companies name 
  
  - SELECT companyname FROM customers  UNION SELECT companyname from suppliers

2)UNIONALL :- Return duplicate values 

  I) find all the cities of all customers and suppliers , with one records for each companies city.
  
   - SELECT city FROM customers UNION ALL SELECT city FROM suppliers;

  II) distinct Countries of all our customers and suppliers in alphabetical order.

   - SELECT country FROM customers UNION SELECT country FROM suppliers ORDER BY country ASC;

  III)all list of countries of our suppliers and customers with a record for each one.
  
   - SELECT country FROM customers UNION SELECT country FROM suppliers ORDER BY country DESC;


3)INTERSECT :-
    
    INTERSECT :-
   ------------

    I)FIND ALL countries that we have both customers and suppliers in.
    
    -> SELECT country FROM customers INTERSECT SELECT country FROM suppliers;


    INTERSECT ALL :-
   ---------------

    I)COUNT ALL countries that we have both customers and suppliers in.
    
    ->SELECT COUNT(*) FROM
     (SELECT country FROM customers INTERSECT ALL SELECT country FROM suppliers) AS Togather;

     Practices :-
   ---------------

     I) DISTINCT cities that we have a suppliers and customer located in.
      
     ->SELECT city FROM customers INTERSECT SELECT city FROM suppliers;

     II)the count the numbers of customers and suppliers pairs that are in the same city.
     
      -> SELECT COUNT(*) FROM
      (SELECT city FROM customers INTERSECT SELECT city FROM suppliers)AS same_city;


 3)Except:-

    I) SELECT country FROM customers EXCEPT SELECT country FROM suppliers;

    II) find the number of customer that are in country without suppliers.
    
     -> SELECT COUNT(*) FROM
        (SELECT country FROM customers EXCEPT ALL SELECT country FROM suppliers) AS lonly_customer;

   Practices :-


     I) cities we have a suppliers with no customers.

     -> SELECT city FROM suppliers
         EXCEPT 
        SELECT city FROM customers