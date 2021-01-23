-- sample t_mail record insert

SELECT * FROM n WHERE no < 10 ;

SELECT my_text( 8 ) FROM dual ;

DELETE FROM t_mail WHERE 1 = 1 ; 
DELETE FROM user WHERE 1 = 1 ;

SELECT * FROM user ;
INSERT INTO t_user (id, name, passwd)
VALUES
( UUID(), 'admin', 'admin' );

INSERT INTO t_user (id, name, passwd)
VALUES
( UUID(), 'john', 'admin' ) ;

INSERT INTO t_user(id, name, passwd) 
SELECT UUID(), MY_TEXT(8), MY_TEXT(8) FROM n WHERE no < 100 ;

SELECT * FROM t_user ;

-- sample mail insert
SELECT COUNT(*) FROM t_mail ;
DELETE FROM t_mail WHERE 1 = 1 ;
SELECT * FROM t_mail ;

INSERT INTO t_mail( mailId , title,      mailsize, regUserId, rcvDate, regDate ) 
SELECT               mailId, title, LENGTH(title),    userId, rcvDate, regDate
FROM ( 
	SELECT no, UUID() AS mailId, MY_TEXT( 25 ) title, userId,
	( FROM_UNIXTIME(UNIX_TIMESTAMP(now()) - FLOOR(0 + (RAND() * 2592000))) ) AS rcvDate,
	NOW() AS regDate,
	'' AS z
	FROM n , 
	( SELECT ( ROW_NUMBER() OVER(ORDER BY id) ) AS userNo, id as userId FROM t_user 
	) AS t_user
	WHERE 1 = 1  
	AND NO < 10000 
	AND MOD( NO, 100 ) = userNo 
) AS a 
ORDER BY NO ;

-- end file