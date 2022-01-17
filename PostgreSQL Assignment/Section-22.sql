WINDOW FUNCTION :-
-----------------

DIFFERENT CATEGORIES OF WINDOW FUNCTION.

1) 	AGGREGATE FUNCTION :-
                          AVG,SUM,COUNT,MIN,MAX.
						  
2)  RANKING FUNCTION :-
                       	 RANK , DENSE_RANK,ROW_NUMBER.

3)  ANALYTIC FUNCTION :-
                     
                        LEAD,LAG,FIRST_VALUE,LAST_VALUE ETC.

OVER CLAUSE DEFINE THW PARTITIONING AND ORDERING OF ROWS (I.A) FOR ABOVE THE FUNCTION TO OPERATE ON THESE FUNTCION CALLED WINDOW FUNCTION .

   - ORDERBY :- DEFINES THE LOGICAL ORDER OF THE ROWS.
   - PARTITION BY : DIVIDES THE QUERY RESULT SET INTO PARTITIONS. THE WINDOW FUNCTION APPLIED TO EACH PARTITION SEPARATELY.
   - ROWS or RANGE : FUTURE LIMIT ROWS WITH IN THE PARTITION BY SPECIFYING START AND END POINT WITH IN PARTITION.
   - FIRST_VALUE AND LAST_VALUE :-
                                  - The FIRST_VALUE() function returns a value evaluated against the first row within its partition,
								  - the LAST_VALUE() function returns a value evaluated against the last row in its partition.
   - The LAG and LEAD functions :- The LAG() function has the ability to access data from the previous row, while the LEAD() function can access data from the next row.							  
   
   Example :-
   
  1)  SELECT
	product_name,
	price,
	group_name,
	AVG (price) OVER (
	   PARTITION BY group_name
	)
    FROM
	products
	INNER JOIN 
		product_groups USING (group_id);
		
		
	- the following query returns the product name, the price, product group name, along with the average prices of each product group.
	
	2) SELECT
	  product_name,
	  group_name,
	  price,
	  ROW_NUMBER () OVER (
		PARTITION BY group_name
		ORDER BY
			price
	  )
     FROM
	products
    INNER JOIN product_groups USING (group_id);
	
	-The ROW_NUMBER() function assigns a sequential number to each row in each partition.
	
	3)SELECT
	product_name,
	group_name,
    price,
	RANK () OVER (
		PARTITION BY group_name
		ORDER BY
			price
 	 )
    FROM
	products
    INNER JOIN product_groups USING (group_id);
	
	- The RANK() function assigns ranking within an ordered partition.
    - If rows have the same values, the  RANK() function assigns the same rank, with the next ranking(s) skipped.	


   4)SELECT
	product_name,
	group_name,
	price,
	DENSE_RANK () OVER (
		PARTITION BY group_name
		ORDER BY
			price
	 )
    FROM
	products
    INNER JOIN product_groups USING (group_id);	
	
	- the DENSE_RANK() function assigns a rank to each row within an ordered partition, but the ranks have no gap. 
	- In other words, the same ranks are assigned to multiple rows and no ranks are skipped.
	
	
	5)SELECT
	product_name,
	group_name,
	price,
	FIRST_VALUE (price) OVER (
		PARTITION BY group_name
		ORDER BY
			price
	) AS lowest_price_per_group
    FROM
	products
    INNER JOIN product_groups USING (group_id);
	
	- The FIRST_VALUE() function returns a value evaluated against the first row within its partition,
	
	
	6) SELECT
	product_name,
	group_name,
	price,
	LAST_VALUE (price) OVER (
		PARTITION BY group_name
		ORDER BY
			price RANGE BETWEEN UNBOUNDED PRECEDING
		AND UNBOUNDED FOLLOWING
	) AS highest_price_per_group
    FROM
	products
    INNER JOIN product_groups USING (group_id);
	
	-  the LAST_VALUE() function returns a value evaluated against the last row in its partition.