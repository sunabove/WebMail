-- trigger test 
SELECT * FROM t_user ;

INSERT INTO t_user (userid, name, passwd)
SELECT 'admin', 'admin', 'admin' FROM dual 
WHERE ( SELECT COUNT(*) FROM t_user WHERE name='admin' ) < 1
;

INSERT INTO t_user (userid, name, passwd)
SELECT 'john', 'john', 'john' FROM dual 
WHERE ( SELECT COUNT(*) FROM t_user WHERE name='john' ) < 1
;

SELECT * FROM t_user ;

SELECT * FROM t_mail_usesize ;

SELECT * FROM t_mail_mailbox ;

-- UPDATE t_mail_mailbox SET mailboxname = 'OutBox' WHERE MAILBOXNAME = 'SendBox' ;

-- 메일 마스트 추가 
SELECT * FROM t_mail ;

INSERT INTO t_mail( mailId , title, mailsize, rcvUserId, rcvDate )
VALUES ( UUID(), 'defghi', 100, 'john', NOW() ) ;

SELECT mailId , title, mailsize, rcvUserId, rcvDate, REGUSERID, REGDATE, CHGUSERID, CHGDATE FROM t_mail ;

UPDATE t_mail SET title = 'abcdef' WHERE mailid = (SELECT mailid FROM t_mail WHERE rcvUserid ='john' LIMIT 1 ) ;

SELECT mailId , title, mailsize, rcvUserId, rcvDate, REGUSERID, REGDATE, CHGUSERID, CHGDATE FROM t_mail ;

-- 메일 전송 정보 추가 

SELECT * from t_mail_usesize ; 
SELECT * from t_mail_status ; 

INSERT INTO t_mail_sendinfo
      ( sendinfoid, mailid, senduserid, sender )
SELECT UUID(), mailid, 'admin', 'admin' FROM t_mail WHERE rcvUserId = 'john'
;

SELECT * from t_mail_usesize ; 
SELECT * from t_mail_status ; 

SELECT * FROM t_mail ;


DELETE FROM t_mail_rcvinfo WHERE 1 = 1 ;
DELETE FROM t_mail_rcvlist WHERE 1 = 1 ;

INSERT INTO t_mail( mailId , title, mailsize, rcvUserId, rcvDate )
VALUES ( UUID(), 'ddirdir', 100, 'john', NOW() ) ;

INSERT INTO t_mail_rcvinfo
       ( rcvinfoid, mailid, rcvtype, rcvidtype, rcvname ) 
SELECT      UUID(), mailid,    'RCV', 'EMAIL', 'john' 
FROM t_mail WHERE rcvUserId = 'john' LIMIT 1 
 ;

SELECT * FROM t_mail_rcvinfo ;

SELECT * FROM t_mail_rcvlist ;

COMMIT ;
