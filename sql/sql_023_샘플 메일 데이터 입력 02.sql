-- sample t_mail record insert

DROP TABLE if EXISTS n ;
​
CREATE TABLE n AS (
	WITH recursive num AS (
	    SELECT 1 AS n
	    UNION ALL
	    SELECT n + 1 FROM num WHERE n < 1000000 
	)
	SELECT n AS no FROM num 
) ;
​
SELECT * FROM n WHERE no < 10 ;
​
-- random text function
DROP FUNCTION if EXISTS MY_TEXT ;
​
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
​
SELECT my_text( 8 ) FROM DUAL ;
-- // random text function
​
-- sample user insert
DELETE FROM user WHERE 1 = 1 ;
​
INSERT INTO USER (id, name, passwd) VALUES 
( UUID(), 'admin', 'admin' ) ,
( UUID(), 'john', 'admin' ) 
;
​
INSERT INTO user(id, name, passwd) 
SELECT UUID(), MY_TEXT(8), MY_TEXT(8) FROM n WHERE no < 100 
;
​
SELECT * FROM user ; 
​
-- sample mail insert
DROP TABLE IF EXISTS T_MAIL ;

CREATE TABLE T_MAIL ( 
MAILID	VARCHAR(40)	PRIMARY KEY NOT NULL COMMENT '메일아이디', 
TITLE	VARCHAR(1000)		NOT NULL COMMENT '제목', 
CONTENTFILEID	VARCHAR(40) COMMENT '본문파일아이디',
UGTYN	CHAR(1) DEFAULT 'N'	COMMENT '긴급여부', 					
SECURITYYN	CHAR(1) DEFAULT 'N'	COMMENT '보안여부',					
MAILSIZE	INTEGER(10) NOT NULL COMMENT '메일사이즈',
EMLHEADERID	VARCHAR(40) COMMENT 'EML헤더아이디',
EMLFILEID	VARCHAR(40) COMMENT 'EML파일아이디',
FILEATTACHYN	CHAR(1) DEFAULT 'N'	COMMENT '파일첨부여부',
IMGATTACHYN	CHAR(1) DEFAULT 'N'	COMMENT '이미지첨부여부',
ENCODING	VARCHAR(20) COMMENT '인코딩방식',
DELYN	CHAR(1) DEFAULT 'N' COMMENT '삭제여부',
MAKEDATE	DATE COMMENT '작성일시',
SENDDATE	DATE COMMENT '발송일시',
RCVDATE	DATE COMMENT '수신일시',
RCVLISTINFO	VARCHAR(300) COMMENT '수신목록정보', 
RCVUSERID	VARCHAR(200) COMMENT '수신자아이디', 
RCVTOTCNT	INTEGER(6) DEFAULT 0	COMMENT '수신자열람건수', 
RCVREADCNT	INTEGER(6) default 0	COMMENT '수신자읽음건수',
ETCPARAM1	VARCHAR(100) COMMENT '기타속성1',
ETCPARAM2	VARCHAR(100) COMMENT '기타속성2',
ETCPARAM3	VARCHAR(100) COMMENT '기타속성3',
ETCPARAM4	VARCHAR(100) COMMENT '기타속성4',
ETCPARAM5	VARCHAR(100) COMMENT '기타속성5',
DEVICE	VARCHAR(20) DEFAULT 'PC'	COMMENT '장치',
REGUSERID	VARCHAR(40) COMMENT '등록자아이디',
REGDATE	DATE COMMENT '등록일시', 
CHGUSERID	VARCHAR(40) COMMENT '변경자아이디',
CHGDATE	DATE COMMENT '변경일시',
LARGEYN	CHAR(1) DEFAULT 'N'	COMMENT '대용량메일여부',
CONVERSIONYN	VARCHAR(10) DEFAULT 'N' COMMENT '컨버젼여부',
SYSTEMMAILYN	CHAR(1) DEFAULT 'N' , 
COMMENTCNT	INTEGER(5) DEFAULT 0	COMMENT '댓글개수'  
) ; 
​
SELECT COUNT(*) FROM t_mail ;
DELETE FROM t_mail WHERE 1 = 1 ;
SELECT * FROM t_mail ;

INSERT INTO t_mail( mailid , title, mailsize, regUserId, rcvDate, regDate ) 
SELECT mailid, title, LENGTH(title), userId, rcvDate, regDate
FROM ( 
	SELECT no, UUID() AS mailid, MY_TEXT( 25 ) title, userid,
	( NOW() - INTERVAL FLOOR(RAND() * 200) DAY ) AS rcvDate,
	( NOW() - INTERVAL FLOOR(RAND() * 200) DAY ) AS regDate,
	'' AS z
	FROM n , 
	( SELECT ROW_NUMBER() over(ORDER BY id) AS userNo, id as userId FROM user ) as user
	WHERE NO < 10000 AND MOD( NO, 100 ) = userNo 
) AS a ;

-- end file