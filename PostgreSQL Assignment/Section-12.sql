
create Tables:-
--------------
CREATE TABLE IF NOT EXISTS Employee 
(
  empid numeric CONSTRAINT pk_emp PRIMARY KEY ,
  empname varchar(50) not null,
  salary numeric(10,2) not null,
  deptid numeric not null,
  FOREIGN KEY (deptid) REFERENCES 	Department(deptid)
);

CREATE TABLE IF NOT EXISTS Department
(
  deptid numeric CONSTRAINT pk_dept PRIMARY KEY,
  deptname varchar(50) not null	
);

CREATE TABLE IF NOT EXISTS Emp1
(
  empid numeric CONSTRAINT pk_emp1 PRIMARY KEY ,
  empname varchar(50) not null,
  salary numeric(10,2) not null,
  deptid numeric not null
);



Insert :- put the values in to database.
--------

1)insert the values on Department Tables :-

     INSERT INTO Department(deptid,deptname)VALUES 
    (101,'HR'),
    (102,'DEVELOPMEMT'),
    (103,'MARKETING');

1)insert the values on Employees Tables :-

     INSERT INTO Employee(empid,empname,salary,deptid) VALUES
     (1,'Ajay',25000.00,102),
     (2,'jay',23000.00,101),
     (3,'Amar',24000.00,103);



Update :- Modifies the Employee Details.
--------

    UPDATE Employee SET empname='kowshik' WHERE empid=5;

DELETE : delete the employee details.
-------

   DELETE FROM Employee WHERE empid=2
   
TRUNCATE :-
---------
     TRUNCATE TABLE emp2   
   
   
SELECT INTO :- used to create new table or copy of that tables.
------------
       - SELECT * INTO Emp1 FROM Employee
	   - SELECT *  INTO
         order_1997
         FROM orders WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31';
		 
INSERT INTO SELECT :- COPY THE VALUES OF OTHER TABLES or insert the values into another table.
-------------------

   - INSERT  INTO  emp2 SELECT empid,deptid FROM Emp1 ;
   - INSERT INTO order_1997
     SELECT * FROM
     orders WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31'
	 
	 
	 
Returning Date FROM UPDATE , DELETE AND INSERT:-
---------------------------------------------	

    - INSERT :-
	--------
   - INSERT INTO Employee
    (empid,empname,salary,deptid)VALUES (6,'Ganesh',23000.00,103) RETURNING empid ;
	
	 - UPDATE :-
	  --------
	
	 -UPDATE Employee SET salary = 235000.00 WHERE empid = 6 RETURNING empid,salary AS new_salary;
	 
	  - DELETE :-
	  --------
	 
	  - DELETE FROM Employee WHERE empid=3 RETURNING empid;
		 
