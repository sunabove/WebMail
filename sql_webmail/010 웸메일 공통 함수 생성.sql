-- sample t_mail record insert ; 

DROP TABLE if EXISTS n ;

CREATE TABLE n AS (
	WITH recursive num AS (
	    SELECT 1 AS no
	    UNION ALL
	    SELECT NO + 1 AS no FROM num WHERE no < 1000000 
	)
	SELECT no FROM num 
) ;

SELECT * FROM n WHERE no < 10 ;

-- random text function ; 
DROP FUNCTION if EXISTS MY_TEXT ;

CREATE FUNCTION MY_TEXT ( n INT )  
RETURNS VARCHAR(200) 
BEGIN  
  DECLARE t_all VARCHAR(255) ;
	DECLARE idx INT ; 
	DECLARE c VARCHAR(1) ;
	DECLARE alpha VARCHAR( 255 ) ;
	
	SET alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789' ; 
	
	SET idx = 0 ; 
   SET t_all = '' ; 
   
   WHILE idx < n DO  
   	SET c = SUBSTRING( alpha, rand()*LENGTH(alpha)+1, 1) ; 
   	SET t_all = CONCAT( t_all, c ) ;
   	SET idx = idx + 1 ; 
   END WHILE ;  
   
   RETURN t_all ;  
END;  

SELECT my_text( 8 ) FROM DUAL ;

-- random integer function ; 

DROP FUNCTION if EXISTS RANDINT ;

CREATE FUNCTION RANDINT ( n INT )  
RETURNS INT 
BEGIN  
  DECLARE t INT ; 
  SET t = FLOOR( RAND( )*n ) ; 
  RETURN t ;
END;

SELECT RANDINT( 100 ) FROM DUAL ;

-- // random integer ; 

-- end of file ; 
