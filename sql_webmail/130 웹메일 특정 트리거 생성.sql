﻿-- webmail common trigger

-- 0 t_user

-- 사용자를 생성하면 t_usesize에 레코드를 추가하여 , tocnt와 readcnt를 0 으로 설정함.
DROP TRIGGER t_user_trg_usesize_mailbox_ins ;

CREATE TRIGGER t_user_trg_usesize_mailbox_ins 
AFTER INSERT ON t_user FOR EACH ROW 
BEGIN 

  -- 개인별 사용량 추가 
  INSERT INTO t_mail_usesize 
         ( userid, totcnt, readcnt )
  SELECT NEW.userid, 0 AS totcnt, 0 AS readcnt
  FROM dual ;

  -- 개인 받는 메일함 추가
  INSERT INTO t_mail_mailbox
         ( userid, mailboxid , mailboxname , sortno )
  SELECT NEW.userid, UUID(), 'InBox', 0 
  FROM dual ; 

  -- 개인 보내는 메일함 추가
  INSERT INTO t_mail_mailbox
         ( userid, mailboxid , mailboxname , sortno )
  SELECT NEW.userid, UUID(), 'OutBox', 1 
  FROM dual ;
  
END ;

-- 1 mail

-- 2 simple content / 메일 본문 내용

-- 3 mail box

-- 4 box link 개인 메일함별 링크 

-- 5 pop3 smtp

-- 6 pop3udi / 수신메일 메타 정보

-- 7 rcvinfo / 받는사람 정보 특정 Trigger

DROP TRIGGER t_mail_rcvinfo_trg_usesize_mail_stats_rcvlist ;

CREATE TRIGGER t_mail_rcvinfo_trg_usesize_mail_stats_rcvlist
AFTER INSERT ON t_mail_rcvinfo FOR EACH ROW 
BEGIN 

  DECLARE t_rcvid varchar( 255 ) ;

  SELECT MIN( rcvUserId ) INTO t_rcvid FROM t_mail 
  WHERE mailid = NEW.mailid 
  GROUP BY rcvUserId 
  ;

  -- 개인별 사용량에 tocnt 증가 , readcnt 는 증가하지 않음. 
  UPDATE t_mail_usesize tmu
  SET 
    totcnt = totcnt + 1 
  WHERE tmu.userid = t_rcvid ;

  -- 받은 메일 상태 입력 , 메일 상태는 읽지 않음으로 설정. 
  INSERT INTO t_mail_status
          (mailid, userid, readyn )
  VALUES ( NEW.mailid,t_rcvid, 'N' );

  -- 받은 사람 메타 정보 추가 
  INSERT INTO t_mail_rcvlist
          (rcvlistid,  mailid,     rcvtype,     rcvidtype, rcvuserid,     rcvinfo, readdate )  
  VALUES ( UUID(), NEW.mailid, NEW.rcvType, NEW.rcvidtype,   t_rcvid, NEW.rcvName,  NULL );
  
END ;

-- 8 rcvlist / 받는 사람 메타 정보 

-- 9 rcvlist_search / 받는 사람 검색 정보 

-- 10 sendinfo / 보낸 사람 메터 장보 

-- DROP TRIGGER t_mail_sendinfo_trg_usesize ;

CREATE TRIGGER t_mail_sendinfo_trg_usesize 
AFTER INSERT ON t_mail_sendinfo FOR EACH ROW 
BEGIN 

  -- 개인별 사용량에 tocnt 증가 , readcnt 증가 
  UPDATE t_mail_usesize tmu
  SET 
    totcnt = totcnt + 1 ,
    readcnt = readcnt + 1 
  WHERE tmu.userid = NEW.senduserid ;

  -- 보낸 메일 상태 입력 
  INSERT INTO t_mail_status
          (mailid, userid, readyn )
  VALUES ( NEW.mailid, NEW.senduserid, 'Y' );

  -- 보낸 메일함 상태 변경 
  
END ;

-- 11 status / 사용자별 메일 상태 

-- 12 usesize / 개인별 사용량 

-- end of file