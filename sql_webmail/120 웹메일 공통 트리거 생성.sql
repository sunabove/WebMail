-- webmail common trigger

-- 0 user

CREATE TRIGGER t_user_trg_01_ins 
BEFORE INSERT ON t_user FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_user_trg_02_upd 
BEFORE UPDATE ON t_user FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 1 mail

CREATE TRIGGER t_mail_trg_01_ins 
BEFORE INSERT ON t_mail FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_trg_02_upd 
BEFORE UPDATE ON t_mail FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 2 simple content / 메일 본문 내용

CREATE TRIGGER t_mail_simplecontent_trg_01_ins 
BEFORE INSERT ON t_mail_simplecontent FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_simplecontent_trg_02_upd 
BEFORE UPDATE ON t_mail_simplecontent FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 3 mail box

CREATE TRIGGER t_mailbox_trg_01_ins 
BEFORE INSERT ON t_mail_mailbox FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mailbox_trg_02_upd 
BEFORE UPDATE ON t_mail_mailbox FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 4 box link 개인 메일함별 링크 

CREATE TRIGGER t_mailboxlink_trg_01_ins 
BEFORE INSERT ON t_mail_boxlink FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mailboxlink_trg_02_upd 
BEFORE UPDATE ON t_mail_boxlink FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 5 pop3 smtp

CREATE TRIGGER t_mail_pop3smtp_trg_01_ins 
BEFORE INSERT ON t_mail_pop3smtp FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_pop3smtp_trg_02_upd 
BEFORE UPDATE ON t_mail_pop3smtp FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 6 pop3udi / 수신메일 메타 정보

CREATE TRIGGER t_mail_pop3uid_trg_01_ins 
BEFORE INSERT ON t_mail_pop3uid FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_pop3uid_trg_02_upd 
BEFORE UPDATE ON t_mail_pop3uid FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 7 rcvinfo / 받는사람 정보

CREATE TRIGGER t_mail_rcvinfo_trg_01_ins 
BEFORE INSERT ON t_mail_rcvinfo FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_rcvinfo_trg_02_upd 
BEFORE UPDATE ON t_mail_rcvinfo FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 8 rcvlist / 받는 사람 메타 정보 

CREATE TRIGGER t_mail_rcvlist_trg_01_ins 
BEFORE INSERT ON t_mail_rcvlist FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_rcvlist_trg_02_upd 
BEFORE UPDATE ON t_mail_rcvlist FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 9 rcvlist_search / 받는 사람 검색 정보 

CREATE TRIGGER t_mail_rcvlist_search_trg_01_ins 
BEFORE INSERT ON t_mail_rcvlist_search FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_rcvlist_search_trg_02_upd 
BEFORE UPDATE ON t_mail_rcvlist_search FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 10 sendinfo / 보낸 사람 메터 장보 

CREATE TRIGGER t_mail_sendinfo_trg_01_ins 
BEFORE INSERT ON t_mail_sendinfo FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_sendinfo_trg_02_upd 
BEFORE UPDATE ON t_mail_sendinfo FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 11 status / 사용자별 메일 상태 

CREATE TRIGGER t_mail_status_trg_01_ins 
BEFORE INSERT ON t_mail_status FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_status_trg_02_upd 
BEFORE UPDATE ON t_mail_status FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- 12 usesize / 개인별 사용량 

CREATE TRIGGER t_mail_usesize_01_ins 
BEFORE INSERT ON t_mail_usesize FOR EACH ROW 
BEGIN 
  SET NEW.regUserId = CURRENT_USER() ;
  SET NEW.regDate = CURRENT_TIMESTAMP() ; 
END ;

CREATE TRIGGER t_mail_usesize_02_upd 
BEFORE UPDATE ON t_mail_usesize FOR EACH ROW 
BEGIN 
  SET NEW.chgUserId = CURRENT_USER() ;
  SET NEW.chgDate = CURRENT_TIMESTAMP() ; 
END ;

-- end of file