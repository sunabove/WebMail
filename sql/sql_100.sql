CREATE TABLE employee ( 
	id int PRIMARY KEY AUTO_INCREMENT ,
	first_name VARCHAR(200) ,
	last_name VARCHAR(200) ,
	phone_no VARCHAR(200)
) ; 



INSERT INTO employee( first_name, last_name, phone_no )
VALUES( 'ghi', 'jkl', '234-5467' ) ;

SELECT * FROM employee ; 

SELECT * FROM employee WHERE id = 1 ;

COMMIT ;

