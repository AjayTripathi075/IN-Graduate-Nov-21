CTE(COMMON TABLE EXPRESSION) :-
------------------------------

- WHY USED CTE IN POSTGRESSQL.
   -> we will use sub-queries to join the records or filter the records from a sub-query. Whenever we refer the same data or join the same set of records using a sub-query, the code maintainability will be difficult.
   -  A CTE makes improved readability and maintenance easier.
   - Like database views and derived tables, CTEs can make it easier to write and manage complex queries by making them more readable and simple. 
   - We can accomplish this characteristic by breaking down the complex queries into simple blocks that can reuse in rewriting the query.   
   
- WHAT IS CTE.
 
  - CTE(COMMON TABLE EXPRESION)is a one-time result set that only exists for the duration of the query. 
  - It allows us to refer to data within a single SELECT, INSERT, UPDATE, DELETE, CREATE VIEW, or MERGE statement's execution scope.
  - It is temporary because its result cannot be stored anywhere and will be lost as soon as a query's execution is completed.
  
-SYNTAX :-
    
	WITH CTE_name [ ( column_name [,...n] ) ]    
    AS    
   (    
      query_definition    
   )    
   select * from CTE_name;  
   
-Advantages of CTE
 - CTE improves the code readability.
 - CTE provides recursive programming.
 - CTE makes code maintainability easier.
 - Though it provides similar functionality as a view, it will not store the definition in metadata.
 
 
 1)WITH QUERIES :-
 
 - we want to find out the number of units records and amount of sales for all the products from the top three category by total sales.
  
   -> WITH TOP_CATEGORY_NAME 
      AS
     (
      SELECT categoryname , SUM(od.unitprice * quantity) AS sales
      FROM categories AS C
      JOIN products USING(categoryid)
      JOIN order_details AS od USING(productid)
      GROUP BY categoryname
      ORDER BY sales DESC
      LIMIT 3	
     )
     SELECT * FROM TOP_CATEGORY_NAME
	 
	 
	 
  -
    WITH cte_rental 
	AS 
	(
     SELECT staff_id,
        COUNT(rental_id) rental_count
     FROM   rental
     GROUP  BY staff_id
    )
    SELECT s.staff_id,
    first_name,
    last_name,
    rental_count
    FROM staff s
    INNER JOIN cte_rental USING (staff_id);  
	
	

3) CTE Recursive :-

 -  Recursive call itself called recursive.
 
 SYNTAX:-
 
 WITH RECURSIVE cte_name
 AS
 (
    CTE_query_definition -- non-recursive term
    UNION [ALL]
    CTE_query definion  -- recursive term
  )
 SELECT * FROM cte_name;
 
 
 --
   WITH RECURSIVE subordinates 
   AS 
   (
	SELECT employee_id,manager_id,full_name FROM employees
	WHERE
		employee_id = 2
	UNION
		SELECT
			e.employee_id,
			e.manager_id,
			e.full_name
		FROM
			employees e
		INNER JOIN subordinates s ON s.employee_id = e.manager_id
    ) 
    SELECT * FROM subordinates;
 
 