TABLE CONSTRAINT 
----------------

1)NOT NULL CONSTRAINT :-

    - FIELD MUST HAVE A VALUE.
    - ensures that values in a column cannot be NULL.
	
	CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (
	  subid numeric ,
	  first_name varchar(50) NOT NULL,
	  last_name varchar(50)NOT NULL
	 )
	 
  I)ALTER TABLE ADD :-
  
   - SYNTAX:-
     ALTER TABLE TABLE_NAME 
	 ALTER COLUMN COLUMN_NAME SET NOT NULL
	 
   - ALTER TABLE SUBSCRIBERS ALTER subid SET NOT NULL;
   
  
2)UNIQUE CONSTRAINT :-

   - UNIQUE CONSTRAINT ENFORCE UNIQUENESS OF COLUMN I.E. THE COLUMN SHOULD NOT ALLOW ANY DUPLICATE VALUES.
   - the values in a column unique across the rows within the same table.
   
    CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (
	  subid numeric ,
	  first_name varchar(50) NOT NULL,
	  last_name varchar(50)UNIQUE NOT NULL
	 )
	 
  I) MODIFY TABLE TO ADD UNIQUE CONSTRAINT.
  
  - ALTER TABLE TABLE_NAME ADD CONSTRAINT CONSTRAINT_NAME UNIQUE(COLUMN_NAME);
  
    - ALTER TABLE SUBSCRIBERS ADD CONSTRAINT uk_firstname UNIQUE(firstname);
	
  
3) PRIMARY KEY CONSTRAINT :-

   -  primary key column uniquely identify rows in a table. A table can have one and only one primary key. 
   -  The primary key constraint allows you to define the primary key of a table.
   
    CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (
	  subid numeric CONSTRAINT pk_sub PRIMARY KEY ,
	  first_name varchar(50) NOT NULL,
	  last_name varchar(50)UNIQUE NOT NULL
	 )
	 
	I) MODIFY TABLE TO ADD PRIMARY KEY CONSTRAINT. 
	
	- ALTER TABLE SUBSCRIBERS ADD CONSTRAINT Pk_subid PRIMARY KEY(subid);
	
	
4) FOREIGN KEY CONSTRAINT :-

    - A FOREIGN KEY IN ONE TABLE TABLE POINT TO A PRIMARY KEY IN ANOTHER TABLE.
	- FOREIGN KEY IS USED TO ENFORCE DATABASE INTEGRITY.
	
	 CREATE TABLE IF NOT EXISTS EMPLOYEE
    (
	  empid numeric CONSTRAINT pk_empid PRIMARY KEY ,
	  empname varchar(50) NOT NULL,
	  salary numeric(15,2) NOT NULL,
	  deptno numeric(5),
	  FOREIGN KEY (deptno) REFERENCES DEPARTMENT(deptno)
	 )
	
	 CREATE TABLE IF NOT EXISTS DEPARTMENT
    (
	  deptid numeric CONSTRAINT pk_deptid PRIMARY KEY ,
	  deptnamename varchar(50) NOT NULL
	 )
	 
	 
    I) ALTERING THROUGH ADD THE FOREIGN KEY.

     - ALTER TABLE EMPLOYEE ADD CONSTRAINT fk_deptno_dept FOREIGN KEY (deptno) REFERENCES DEPAREMENT(deptno);
	 
	 
5)CKECK CONSTRAINT :-

     - CHECK CONSTRAINT IS USED TO LIMIT RANGE OF VALUES THAT CAN BE ENTERED FOR A COLUMN.

       CREATE TABLE IF NOT EXISTS EMPLOYEE
    (
	  empid numeric CONSTRAINT pk_empid PRIMARY KEY ,
	  empname varchar(50) NOT NULL,
	  salary numeric(15,2) NOT NULL,
	  Age numeric,
	  deptno numeric(5),
	  FOREIGN KEY (deptno) REFERENCES DEPARTMENT(deptno),
	  CHECK(Age > 18)
	 )	 
   
   I) ALTERING THROUGH ADD THE CHECK KEY.
   
   - ALTER TABLE EMPLOYEE ADD CONSTRAINT ck_Age_emp CHECK(Age > 18);
   
   
6)DEFAULT CONSTRAINT ;-

   - The DEFAULT constraint is used to set a default value for a column.
   - A COLUMN DEFAULT CAB BE SPECIFIED USING DEFAULT CONSTRAINT.
   - DEFAULT CONSTRAINT IS USED TO INSERT A DEFAULT VALUE INTO A COLUMN.
   - THE DEFAULT VALUES WILL BE ADDED TO NEW RECORD IF NO VALUES SPECIFIED , INCLUDING NULL.

    CREATE TABLE Persons (
    ID int CONSTRAINT pk_id PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'MUMBAI'
    );
 
   I) ALTERING THROUGH ADD THE DEFAULT KEY. 
   
    -ALTER TABLE Persons ALTER COLUMN City SET DEFAULT 'MUMBAI';
	


7)ADDING AND REMOVING CONSTRAINT :-

  - ALTER TABLE TABLE_NAME ADD CONSTRAINT CONSTRAINT_NAME  CHECK(COLUMN);
  
  - DROP CONSTRAINT FOR SPECIFIC COLUMN. 
  - DROP CONSTRAINT CONSTRAINT_NAME;
             OR
	ALTER TABLE TABLE_NAME DROP CONSTRAINT CONSTRAINT_NAME;
	

