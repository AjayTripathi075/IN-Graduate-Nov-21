                                        -INDEXEXS-
	--------------------------------------------------------------------------------------------------									

1)WHAT IS INDEXES :-

  - INDEXES are used by queries to find the data from table quickly.
  - Indexes help the database server find specific rows much faster .	


2) CREATE INDEXS:-

    SYNTAX:-

      CREATE INDEX index_name ON table_name [USING method]
      ( 
        column_name [ASC | DESC] [NULLS {FIRST | LAST }],
   
      );	
										
										
										
    - CREATE INDEX idx_employee_empid ON Employee(empid);
	
	-CREATE INDEX idx_orders_customerid_orderid ON 
     orders (customerid,orderid)
	 
	 
3) DROP INDEXES :-

     SYNTAX:-
	 
      DROP INDEXES Index_name;
	
	- DROP INDEX idx_orders_customerid_orderid;
	
4)HOW TO KILL RUNWAY QUERIES :-

  
 CREATE TABLE performance_test
 (
	 id serial,
	 location text
 )
 INSERT INTO performance_test(location)
 SELECT 'katmandu,nepal' FROM generate_series(1,500000000);



SELECT * FROM pg_stat_activity WHERE state='active';

--polite way to stop

SELECT pg_Cancel_backend(pid);
SELECT pg_Cancel_backend(3048);

-- stop all costs -- can lead to full database restart

SELECT pg_terminate_backend(pid);
SELECT pg_terminate_backend(3048);



5) USING SEE THE QUERY PLAN :-

  DROP TABLE IF EXISTS performance_test
  CREATE TABLE performance_test
  (
	 id serial,
	 location text
  )
  
  INSERT INTO performance_test(location)
  SELECT md5(random():: text) FROM generate_series(1,100000000)
  
  
   SELECT COUNT(*) FROM performance_test
 
   SELECT * FROM performance_test WHERE id=2000000;
 
   EXPLAIN SELECT COUNT(*) FROM performance_test
 
   EXPLAIN SELECT * FROM performance_test WHERE id=2000000;
   
   
 6) USE ANALYSIS TO UPDATE DATA :-

    DROP TABLE IF EXISTS performance_test
    CREATE TABLE performance_test
    (
	 id serial,
	 location text
    )
	 INSERT INTO performance_test(location)
     SELECT md5(random():: text) FROM generate_series(1,100000000)
	
	 EXPLAIN ANALYZE SELECT * FROM performance_test WHERE id=2000000;
 
     ANALYZE performance_test
	 
	 
8)USING INDEXES ON MORE THEN ONE FIELD :-

10) Types of INDEXES :-

 1)B-Tree : B-tree is a self-balancing tree that maintains sorted data and allows searches, insertions, deletions, and sequential access in logarithmic time.
            B-tree index whenever index columns are involved in a comparison that uses one of the following operators:
            CREATE INDEX statement without specifying the index type

  1) <
  2) <=
  3) =
  4) >=
  5) BETWEEN
  6) IN
  7) IS NULL
  8) IS NOT NULL    	
  9) LIKE
  10) ~(TILD)
  
 2)HASH :- only handle equal operator;
           Hash indexes can handle only simple equality comparison (=).
		   It means that whenever an indexed column is involved in a comparison using the equal(=)
		   operator, the query planner will consider using a hash index.
		   To create a hash index, you use the CREATE INDEX statement with the HASH index type in the USING clause as follows:

            CREATE INDEX index_name 
            ON table_name USING HASH (indexed_column);
			
 3)GIN ( Generalized Inverted Indexes):-GIN indexes are most useful when you have multiple values stored in a single column, 

        - hstore(key , value pair), 
		- array, 
		- jsonb
		- range types.
 
 4)GIST( Generalized Search Tree) :-GiST stands for Generalized Search Tree. GiST indexes allow a building of general tree structures.
                                   - GiST indexes are useful in indexing geometric data types and full-text search.
								   - Useful when you have data that overlap with the value of that column - like geometric full search.
								   
 
 5)BRIN (Block Range Indexes):- Best use of large datasets that have some natural ordering - like time series or zip codes .
                              - the more squential the ordering the better.
 
 6)SP-GIST (Space-partitioned -Generalized Inverted Indexes  ):-SP-GiST stands for space-partitioned GiST. SP-GiST supports partitioned search trees that facilitate the development of a wide range of 
                                                                different non-balanced data structures.
															

11) SPEEDING UP TEXT MATCHING :-

    - 															
																
																
	 