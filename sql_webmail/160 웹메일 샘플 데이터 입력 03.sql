
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

SELECT * FROM t_mail_rcvinfo ;

DELETE FROM t_mail_status WHERE 1 = 1 ;

INSERT INTO t_mail_rcvinfo
                ( rcvinfoid, mailid, rcvtype, rcvidtype, rcvname ) 
SELECT  UUID() AS rcvinfoid, mailid,    'RCV',  'EMAIL', t_user.name
FROM t_mail , t_user
WHERE rcvUserId = userid
 ;

SELECT * FROM t_mail_rcvinfo ;

SELECT * FROM t_mail_rcvlist ;

SELECT * FROM t_mail_status ;

SELECT COUNT(*) FROM t_mail_status ;
SELECT COUNT(*) FROM t_mail_rcvlist ;


-- end file