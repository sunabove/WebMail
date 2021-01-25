
-- t_mail_simplecontent ют╥б 
SELECT * FROM t_mail_simplecontent ;

DELETE FROM  t_mail_simplecontent WHERE 1 = 1 ;

INSERT INTO t_mail_simplecontent
( mailId , simplecontent, searchcontent ) 
SELECT mailId, simplecontent, simplecontent AS searchconent
FROM (  
  SELECT mailId, my_text( 100 ) AS simplecontent
  FROM t_mail 
) as a ;

SELECT * FROM t_mail_simplecontent ;
-- end file