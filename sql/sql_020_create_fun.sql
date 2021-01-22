DROP FUNCTION if EXISTS MY_TEXT ;

DELIMITER //  
CREATE FUNCTION MY_TEXT ( n INT )  
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

SELECT my_text( 8 ) FROM DUAL ;

 
 

