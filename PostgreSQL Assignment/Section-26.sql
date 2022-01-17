ARRAY DATATYPE :-
----------------


1) Declaring Array :-
-------------------

   1) 
    - CREATE TABLE friends
     (
      name full_name,
      address address,
      specialdates date_to_remember,
      children varchar(50) ARRAY
     );
	 
	- CREATE TABLE salary_employees
      (
       name text,
	   pay_by_quarter int[4],
	   schedule text[][]
      )
	  
	
	
2) Inputting Arrays Values  ;-

-> 
   1)-> insert value on friends tables:-

   - INSERT INTO friends (name,address,specialdates,children) VALUES(ROW('ajay','R','Tri')
													 ,ROW('77777','','BOIS','Idaho','USA','999999'),
													  ROW('1998-07-01',49,'2021-01-7'),'{"Austin","Ana Grace"}');
													  
													  or
													  
   - INSERT INTO friends (name,address,specialdates,children) VALUES(ROW('ajay','R','Tri')
													 ,ROW('77777','','BOIS','Idaho','USA','999999'),
													  ROW('1998-07-01',49,'2021-01-7'),ARRAY['Austin','Ana Grace']);													  
		

   2) ADD RECORD  ON salary_employees TABLE.

    -    INSERT INTO salary_employees (name,pay_by_quarter,schedule)
         VALUES('bill',
	     ARRAY[2000,2000,2000,2000],
	     ARRAY[['meeting','training'],['lunch','sales call']]
	     )
		 
	3)ACCESSING ARRAYS :-
    --------------------

     I) Grab Second Child of All the Friend.

     -> SELECT children[2] FROM friends;	 
	 
	 II) Grab the 2 and 3 element of pay_by_quater using range  from salary_employee tables.
	 
	 ->  SELECT pay_by_quarter[2:3] FROM salary_employees;
	 
	 
-> How to find dimensions of arrays:-
-----------------------------------	 
				- function array_dims();

->HOW TO FIND LENGTH :-
---------------------
                -  array_length(field,dimension);

-> find the dimension and length of salary_employee.

 - SELECT array_dims(schedule), array_length(schedule,1),array_length(schedule,2)FROM salary_employees;




3) MODIFYING ARRAY VALUES ;-
------------------------- 

 I)Replace the children of Boyd in friend tables;
 -> UPDATE friends SET children=ARRAY['Maddie','Timmy','Chery'] WHERE (name).first_name='ajay';
 
 II) Replace BILLS pay_by_quater with values 22000,25000,270000,220000.
 -> UPDATE salary_employees SET pay_by_quarter=ARRAY[22000,25000,270000,220000] WHERE name='bill';
 
 III) UPDATE Bills 4th pay_by_quarter to 26000.
 ->  UPDATE salary_employees SET pay_by_quarter[4]=26000 WHERE name='bill'
 
 IV) update bills 2nd and 3rd quater to 24000 and 25000.
 ->  UPDATE salary_employees SET pay_by_quarter[2:3]=ARRAY[24000,25000] WHERE name='bill'
 
 
 
 4) SEARCHING ARRAY :-
 --------------------
 
 I)DOES ANY OF MY FRIEND HAVE A CHILD NAME chery.
 ->SELECT * FROM friends WHERE children[0]='Chery' OR children[1]='Chery'OR children[3]='Chery' 
 
 -By using ANY CLAUSE:-
 ---------------------
 
 - SELECT * FROM friends WHERE 'Chery' = ANY(children) ;
 
 -> By using ALL OPERATOR ;-
 --------------------------
 
  - SELECT * FROM friends WHERE 'Chery' = ANY(children) 
  

5) ARRAY OPERATOR :-
 ------------------
  
  I) EQUALITY TYPE OPERATOR :-
  
    = , <> , < , > , <= , >=
	
	Example :-
	
	 SELECT ARRAY[1,2,3] = ARRAY[1,2,3]; // TRUE
	 
   II)CONTAINMENT :-

   - @>-CONTAINS,
   - <@-IS CONTAIN BY  

  1) @> = SELECT ARRAY[1,2,3] @> ARRAY[2,3];    //  THE MATCHING VALUES OF FIRST ARRAY  THEN RETURN TURE OTHER WISE RETURN FALSE.
  2) <@ = SELECT ARRAY[1,2,3,5] <@ ARRAY[1,2,3,4,5,6];  //  THE MATCHING VALUES OF SECOND ARRAY  THEN RETURN TURE OTHER WISE RETURN FALSE.
  
  
  III) OVER LAPS :-
  
  - && - HAVE ELEMENT IN COMMON
  - SELECT ARRAY[1,2,3,5] && ARRAY[1,2];
  
  IV) 
  