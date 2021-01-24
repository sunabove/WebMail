-- 웹 메일 제약 조건
-- DROP TABLE IF EXISTS student ; 
-- ALTER TABLE t_mail DROP CONSTRAINT t_mail_fk_01_userid ;

-- 1 mail
ALTER TABLE t_mail ADD CONSTRAINT t_mail_fk_01_userid
FOREIGN KEY (rcvUserId) REFERENCES t_user( userid ) ; 

-- 2 simple content / 메일 본문 내용
ALTER TABLE t_mail_simplecontent ADD CONSTRAINT t_mail_simcon_fk_01_mailid
FOREIGN KEY (mailid) REFERENCES t_mail(mailid) ;

-- 3 mail box
ALTER TABLE t_mail_mailbox ADD CONSTRAINT t_mail_box_fk_01_userid
FOREIGN KEY (userid) REFERENCES t_user( userid ) ;

-- 4 box link 개인 메일함별 링크 
ALTER TABLE t_mail_boxlink ADD CONSTRAINT t_mail_boxlink_fk_01_userid_boxid
FOREIGN KEY (userid, MAILBOXID) REFERENCES t_mail_mailbox (USERID, MAILBOXID) ;

ALTER TABLE t_mail_boxlink ADD CONSTRAINT t_mail_boxlink_fk_02_mailid
FOREIGN KEY (mailid) REFERENCES t_mail( mailid ) ;

-- 5 pop3 smtp
ALTER TABLE t_mail_pop3smtp ADD CONSTRAINT t_mail_pop3smtp_fk_01_userid_boxid
FOREIGN KEY (userid, mailboxid) REFERENCES t_mail_mailbox(userid, mailboxid) ;

-- 6 pop3udi / 수신메일 메타 정보
ALTER TABLE t_mail_pop3uid ADD CONSTRAINT t_mail_pop3uid_fk_01_mailid
FOREIGN KEY (mailid) REFERENCES t_mail( mailid ) ; 

ALTER TABLE t_mail_pop3uid ADD CONSTRAINT t_mail_pop3uid_fk_02_userid
FOREIGN KEY (userid) REFERENCES t_user( userid ) ; 

-- 7 rcvinfo / 받는사람 정보
ALTER TABLE t_mail_rcvinfo ADD CONSTRAINT t_mail_rcvinfo_fk_01_mailid
FOREIGN KEY (mailid) REFERENCES t_mail( mailid ) ;

-- 8 rcvlist / 받는 사람 메타 정보 
ALTER TABLE t_mail_rcvlist ADD CONSTRAINT t_mail_rcvlist_fk_01_mailid
FOREIGN KEY (mailid) REFERENCES t_mail( mailid ) ;

-- 9 rcvlist_search / 받는 사람 검색 정보 
ALTER TABLE t_mail_rcvlist_search ADD CONSTRAINT t_mail_rcvlist_search_fk_01_mailid
FOREIGN KEY (mailid) REFERENCES t_mail( mailid ) ;

-- 10 sendinfo / 보낸 사람 메터 장보 
ALTER TABLE t_mail_sendinfo ADD CONSTRAINT t_mail_sendinfo_fk_01_mailid
FOREIGN KEY (mailid) REFERENCES t_mail( mailid ) ;

ALTER TABLE t_mail_sendinfo ADD CONSTRAINT t_mail_sendinfo_fk_02_senduserid
FOREIGN KEY (senduserid) REFERENCES t_user( userid ) ;

-- 11 status / 사용자별 메일 상태 
ALTER TABLE t_mail_status ADD CONSTRAINT t_mail_status_fk_01_mailid
FOREIGN KEY (mailid) REFERENCES t_mail( mailid ) ;

ALTER TABLE t_mail_status ADD CONSTRAINT t_mail_status_fk_02_userid
FOREIGN KEY (userid) REFERENCES t_user( userid ) ;

-- 12 usesize / 개인별 사용량 
ALTER TABLE t_mail_usesize ADD CONSTRAINT t_mail_usesize_fk_01_userid
FOREIGN KEY (userid) REFERENCES t_user( userid ) ;

-- end of file 