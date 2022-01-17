DATETIME :-
----------

1) DATE TIME  INPUT AND OUTPUT :-

   I)TIMESTAMP :- RETURN BOTH  DATE AND TIME ;
   II)DATE :- RETURN ONLY DATE;
   III) TIME :- RETURN ONLY TIME;
   
   I) TIMESTAMP :-
   
     - SUPPORT WHICH TYPE OF STYLE TO DISPLAY DATE .
	    - SHOW DATESTYLE;
		  -> ISO,MDY OUTPUT;

     - SET THE DATE STYLE 
       - SET DATESTYLE -'ISO,DMY'	;
	   
	   
	 - create table

     CREATE TABLE test_time 
      (
	    startdate DATE,
	    starttamp TIMESTAMP,
	    starttime TIME
      )
	 
	 
	 - VIEW AVAILABLE TIMEZONES NAME;
	 
	 - SELECT * FROM pg_timezone_names;
	     