-- webmail common trigger

-- 0 t_user

-- 사용자를 생성하면 t_usesize에 레코드를 추가하여 , tocnt와 readcnt를 0 으로 설정함.
DROP TRIGGER t_user_01_ins ;

CREATE TRIGGER t_user_01_ins 
AFTER INSERT ON t_user FOR EACH ROW 
BEGIN 
  -- 개인별 사용량 추가 
  INSERT INTO t_mail_usesize 
         ( userid, totcnt, readcnt )
  SELECT NEW.userid, 0 AS totcnt, 0 AS readcnt
  FROM dual ;

  -- 개인 메일함 추가
  INSERT INTO t_mail_mailbox
         ( userid, mailboxid , mailboxname , sortno )
  SELECT NEW.userid, UUID(), 'InBox', 0 
  FROM dual ;  
  
END ;

-- 1 mail


-- 2 simple content / 메일 본문 내용

-- 3 mail box

-- 4 box link 개인 메일함별 링크 

-- 5 pop3 smtp

-- 6 pop3udi / 수신메일 메타 정보

-- 7 rcvinfo / 받는사람 정보

-- 8 rcvlist / 받는 사람 메타 정보 

-- 9 rcvlist_search / 받는 사람 검색 정보 

-- 10 sendinfo / 보낸 사람 메터 장보 

-- 11 status / 사용자별 메일 상태 

-- 12 usesize / 개인별 사용량 

-- end of file