-- sample t_mail record insert

DROP TABLE if EXISTS n 
;
​
CREATE TABLE n AS (
WITH recursive num AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM num WHERE n < 1000000 
)
SELECT n AS no FROM num 
)
;
​
SELECT * FROM n WHERE no < 10 ;
​
-- random text function
DROP FUNCTION if EXISTS MYTEXT ;
​
DELIMITER //  
CREATE FUNCTION MYTEXT ( n INT )  
RETURNS VARCHAR(200) 
BEGIN  
   DECLARE t_all VARCHAR(200) ;
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
END; //  
DELIMITER ; 
​
SELECT mytext( 8 ) FROM DUAL ;
-- // random text function
​
