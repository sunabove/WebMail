-- USER --
DROP TABLE if EXISTS t_mail CASCADE ;
DROP TABLE if EXISTS t_mail_sendinfo CASCADE; 
drop TABLE if exists t_mail_rcvlist_search CASCADE ;
DROP TABLE if EXISTS t_mail_pop3uid CASCADE ; 
DROP TABLE if EXISTS t_mail_boxlink CASCADE ; 
DROP TABLE IF EXISTS t_mail_status CASCADE ;
DROP TABLE if EXISTS t_mail_pop3smtp CASCADE ;
DROP TABLE IF EXISTS t_mail_rcvinfo CASCADE ;
DROP TABLE if EXISTS t_mail_simplecontent CASCADE ; 
DROP TABLE IF EXISTS t_mail_mailbox CASCADE ;
DROP TABLE IF EXISTS t_mail_rcvlist CASCADE ;
DROP TABLE if EXISTS t_mail_usesize CASCADE ;

DROP VIEW  if EXISTS user ;
DROP TABLE if EXISTS user CASCADE ; 
DROP TABLE if EXISTS t_USER CASCADE ; 

CREATE TABLE T_USER (
 id        VARCHAR(40)  PRIMARY KEY,
 name      VARCHAR(200) NOT NULL , 
 passwd    VARCHAR(200) ,
 phone_no  VARCHAR(200) ,
 
 UNIQUE KEY idx_user_name ( NAME )
);

CREATE VIEW USER AS SELECT * FROM t_user ;

INSERT INTO T_USER (id, name, passwd) VALUES 
( UUID(), 'admin', 'admin' ) ;

INSERT INTO T_USER (id, name, passwd) VALUES 
( UUID(), 'john', 'admin' ) ;

-- SYSTEM FILES --
-- 1 T_MAIL --

CREATE TABLE T_MAIL ( 
	MAILID          VARCHAR(40)    PRIMARY KEY COMMENT '메일아이디', 
	TITLE           VARCHAR(1000)  NOT NULL    COMMENT '제목', 
	CONTENTFILEID   VARCHAR(40)                COMMENT '본문파일아이디',
	UGTYN           CHAR(1)        DEFAULT 'N' COMMENT '긴급여부',      
	SECURITYYN      CHAR(1)        DEFAULT 'N' COMMENT '보안여부',     
	MAILSIZE        INTEGER(10)    NOT NULL COMMENT '메일사이즈',
	EMLHEADERID     VARCHAR(40)                COMMENT 'EML헤더아이디',
	EMLFILEID       VARCHAR(40)                COMMENT 'EML파일아이디',
	FILEATTACHYN    CHAR(1) DEFAULT 'N' COMMENT '파일첨부여부',
	IMGATTACHYN     CHAR(1) DEFAULT 'N' COMMENT '이미지첨부여부',
	ENCODING        VARCHAR(20) COMMENT '인코딩방식',
	DELYN           CHAR(1) DEFAULT 'N' COMMENT '삭제여부',
	MAKEDATE        DATETIME COMMENT '작성일시',
	SENDDATE        DATETIME COMMENT '발송일시',
	RCVDATE         DATETIME COMMENT '수신일시',
	RCVLISTINFO     VARCHAR(300) COMMENT '수신목록정보', 
	RCVUSERID       VARCHAR(200) COMMENT '수신자아이디', 
	RCVTOTCNT       INTEGER(6) DEFAULT 0 COMMENT '수신자열람건수', 
	RCVREADCNT      INTEGER(6) DEFAULT 0 COMMENT '수신자읽음건수',
	ETCPARAM1       VARCHAR(100) COMMENT '기타속성1',
	ETCPARAM2       VARCHAR(100) COMMENT '기타속성2',
	ETCPARAM3       VARCHAR(100) COMMENT '기타속성3',
	ETCPARAM4       VARCHAR(100) COMMENT '기타속성4',
	ETCPARAM5       VARCHAR(100) COMMENT '기타속성5',
	
	LARGEYN         CHAR(1) DEFAULT 'N' COMMENT '대용량메일여부',
	CONVERSIONYN    VARCHAR(10) DEFAULT 'N' COMMENT '컨버젼여부',
	SYSTEMMAILYN    CHAR(1) DEFAULT 'N' , 
	COMMENTCNT      INTEGER(5) DEFAULT 0 COMMENT '댓글개수' ,
	
	DEVICE          VARCHAR(20) DEFAULT 'PC' COMMENT '장치',
	REGUSERID       VARCHAR(40) COMMENT '등록자아이디',
	REGDATE         DATETIME COMMENT '등록일시', 
	CHGUSERID       VARCHAR(40) COMMENT '변경자아이디',
	CHGDATE         DATETIME COMMENT '변경일시' 
	
	, FOREIGN KEY (REGUSERID) REFERENCES t_user( id )
) COMMENT 'MAIL Master 정보' ; 

-- T_MAIL_BOXLINK 김경현 

CREATE TABLE T_MAIL_BOXLINK (
 userid          VARCHAR(40) NOT NULL      COMMENT '사용자아이디',
 MAILBOXID       VARCHAR(40) NOT NULL      COMMENT '메일함아이디',
 MAILID          VARCHAR(40) NOT NULL      COMMENT '메일아이디',
 INOUTTYPE       VARCHAR(20)               COMMENT '수발신타입',
 EMLHEADERID     VARCHAR(40)               COMMENT '수발신타입',
 BOXLINKID       VARCHAR(80)               COMMENT '아이디',
 RCVSHARELINKYN  CHAR (1)    DEFAULT  'N'  COMMENT '공유되었는지 여부',
 ORGMAILBOXID    VARCHAR(40)               COMMENT '휴지통이동 등 시에 이전 함정보를 가지고 있음',
 OVERCAPYN       CHAR (1)    DEFAULT  'N'  COMMENT '용량초과로 보이지 않음여부디',
 
 RCVDATE         DATETIME                  COMMENT'수신일',
 
 DEVICE          VARCHAR(20) DEFAULT  'PC' COMMENT '장치',
 REGUSERID       VARCHAR(40)               COMMENT '등록자아이디',
 REGDATE         DATETIME                  COMMENT '등록일시',
 CHGUSERID       VARCHAR(40)               COMMENT'변경자아이디',
 CHGDATE         DATETIME                  COMMENT'변경일시',
 
 PRIMARY KEY (userid, MAILBOXID, MAILID)
) COMMENT 'MAIL 개인메일 함별 링크 정보' ;

-- 김연진 t_mail_mailbox

CREATE TABLE t_mail_mailbox (
  USERID       VARCHAR(40)     NOT NULL     COMMENT '사용자아이디',
  MAILBOXID    VARCHAR(40)     NOT NULL     COMMENT '메일함아이디',
  MAILBOXNAME  VARCHAR(200)    NOT NULL     COMMENT '메일함이름',
  TREEID       VARCHAR(1000)                COMMENT '트리아이디',
  UPTREEID     VARCHAR(1000)                COMMENT '상위트리아이디',
  DEPTH        INTEGER(5)      DEFAULT 0    COMMENT '레벨',
  SORTNO       INTEGER(5)      DEFAULT 0    COMMENT '순서',
  READCNT      INTEGER(10)     DEFAULT 0    COMMENT '열람건수',
  TOTCNT       INTEGER(10)     DEFAULT 0    COMMENT '전체건수',
  USECAP       INTEGER(11)     DEFAULT 0    COMMENT '사용용량',
  UPDYN        CHAR(1)         DEFAULT 'Y'  COMMENT '수정가능여부',
  
  IMAPBOXID    INTEGER         DEFAULT 0 ,
  IMAPBOXNAME  VARCHAR(500) ,
  NOINFERIORS    CHAR(1)       DEFAULT 'N' ,
  NOSELECT       CHAR(1)       DEFAULT 'N' ,
  READONLY       CHAR(1)       DEFAULT 'N' ,
  NEXTUID        INTEGER       DEFAULT 1 ,
  UIDVALIDITY    INTEGER ,
  BOOKMARKYN     CHAR(1)       DEFAULT 'Y' ,
  
  DEVICE       VARCHAR(20)     DEFAULT 'PC' COMMENT '장치',
  REGUSERID    VARCHAR(40)                  COMMENT '등록자아이디',
  REGDATE      DATETIME                     COMMENT '등록일시',
  CHGUSERID    VARCHAR(40)                  COMMENT '수정자아이디',
  CHGDATE      DATETIME                     COMMENT '수정일지',
    
  PRIMARY KEY (USERID, MAILBOXID)
) COMMENT 'MAIL 개인메일함' ;

-- 김현준T_MAIL_POP3SMTP

create table T_MAIL_POP3SMTP (
 USERID VARCHAR (40) not null comment '사용자아이디',
 EMAIL VARCHAR (200) not null comment '이메일',
 SENDERNAME VARCHAR (100) not null comment '보내는사람이름',
 POP3IMAPTYPE VARCHAR (10) not null comment 'POP3 or IMAP',
 POP3ID VARCHAR (60) not null comment 'POP3아이디',
 POP3PASSWD VARCHAR (100) not null comment 'POP3패스워드',
 POP3SERVER VARCHAR (60) not null comment 'POP3서버',
 POP3PORT INTEGER (4) not null default 0 comment 'POP3포트',
 POP3SSLYN CHAR (1) not null default 'N' comment 'POP3SSL여부',
 POP3SAMEUSEYN CHAR (18) not null default 'Y' comment 'POP3동일사용여부',
 SMTPID VARCHAR (2) comment 'SMTP아이디',
 SMTPPASSWD VARCHAR (100) comment 'SMTP패스워드',
 SMTPSERVER VARCHAR (60) comment 'SMTP서버',
 SMTPSCRTYYN CHAR (1) not null default 'Y' comment 'SMTP보안인증여부',
 SMTPPORT INTEGER (4) default 0 comment 'SMTP포트',
 SMTPCNNCTTYPE VARCHAR (20) default 'SSL' comment 'SMTP연결유형',
 MAILBOXID VARCHAR (40) not null comment '메일박스아이디',
 ORGMAILSAVEYN CHAR (1) not null default 'N' comment '원본보관여부',
 DELSYNCYN CHAR (1) not null default 'N' comment '디폴트메일여부',
 COMPANYMAILYN CHAR (1) not null default 'N' comment '회사메일여부',
 LASTACCESSTIME DATETIME comment '마지막접속일시',
 LASTFAILTIME DATETIME comment '마지막실패일시',
 RCVCNT INTEGER (10) not null default 0 comment '수신건수',
 DELCNT INTEGER (10) not null default 0 comment '삭제건수',
 FAILCNT INTEGER (10) not null default 0 comment '실패건수',
 ACCESSCNT INTEGER (10) not null default 0 comment '접속건수',
 TODAYRCVCNT INTEGER (10) not null default 0 comment '오늘수신건수',
 TODAYDELCNT INTEGER (10) not null default 0 comment '오늘삭제건수',
 TODAYFAILCNT INTEGER (10) not null default 0 comment '오늘실패건수',
 TODAYACCESSCNT INTEGER (10) not null default 0 comment '오늘접속건수',
 COMPANYID varchar(40) comment '회사아이디',
 
 DEVICE    VARCHAR (20) DEFAULT  'PC' COMMENT  '장치',
 REGUSERID VARCHAR (40)               COMMENT  '등록자아이디',
 REGDATE   DATETIME                   COMMENT  '등록일시',
 CHGUSERID VARCHAR (40)               COMMENT  '변경자아이디',
 CHGDATE   DATETIME                   COMMENT  '변경일시',
 
 PRIMARY KEY (USERID, EMAIL)
) COMMENT 'POP3와 SMTP 정보' ;

-- t_mail_pop3uid 

create table t_mail_pop3uid(
  mailid     VARCHAR (40) PRIMARY KEY  COMMENT '메일아이디',
  userid     VARCHAR (40)              COMMENT '사용자아이디',
  email      VARCHAR (200)             COMMENT '이메일' ,
  emailuid   VARCHAR (100) NOT NULL    COMMENT '이메일UID',
  delyn      CHAR (1)     DEFAULT 'N'  COMMENT '삭제여부',
  
  device     VARCHAR (20) DEFAULT 'PC' COMMENT '장치',
  reguserid  VARCHAR (40)              COMMENT '등록자아이디',
  regdate    DATETIME                  COMMENT '등록일시',
  chguserid  VARCHAR (40)              COMMENT '변경자아이디',
  chgdate    DATETIME                  COMMENT '변경일시'
) COMMENT 'MAIL POP3 수신메일 메타 정보' ;

-- 박승균 t_mail_rcvinfo

create table t_mail_rcvinfo (
 rcvinfoid VARCHAR(40) PRIMARY KEY  COMMENT '수신목록아이디',
 mailid    VARCHAR(40)              COMMENT '메일아이디',
 rcvtype   VARCHAR(20)              COMMENT '수신자타입',
 rcvidtype VARCHAR(20)              COMMENT '수신자아이디타입',
 rcvid     VARCHAR(200)             COMMENT '수신자아이디',
 rcvname   VARCHAR(200)             COMMENT '수신자명',
 
 device    VARCHAR(20) DEFAULT 'PC' COMMENT '장치',
 reguserid VARCHAR(40)              COMMENT '등록자아이디',
 regdate   DATETIME                 COMMENT '등록일시',
 chguserid VARCHAR(40)              COMMENT '변경자아이디',
 chgdate    DATETIME                COMMENT '변경일시'
) COMMENT 'MAIL 받는사람 정보' ;

-- T_MAIL_RCVLIST 석건원

CREATE TABLE T_MAIL_RCVLIST (
 RCVLISTID  VARCHAR(40) PRIMARY KEY      COMMENT '수신목록아이디',
 MAILID     VARCHAR(40) NOT NULL         COMMENT '메일아이디',
 RCVTYPE    VARCHAR(20) NOT NULL         COMMENT '수신타입(수신,참조,숨은참조)',
 RCVIDTYPE  VARCHAR(20) NOT NULL         COMMENT '수신자아이디타입(EMAIL/USERID)',
 RCVUSERID  VARCHAR(200) NOT NULL        COMMENT '수신자아이디',
 RCVINFO    VARCHAR(300) NOT NULL        COMMENT '수신자정보부',
 OVERCAPYN  CHAR(1) NOT NULL DEFAULT 'N' COMMENT '용량초과여부',
 READDATE   DATETIME                     COMMENT '열람일시',
 DEVICE     VARCHAR(20) DEFAULT 'PC'     COMMENT '장치',
 SENDFAILYN CHAR(1),
 
 REGUSERID VARCHAR(40)          COMMENT '등록자아이디',
 REGDATE   DATETIME             COMMENT '등록일시',
 CHGUSERID VARCHAR(40)          COMMENT '변경자아이디',
 CHGDATE   DATETIME             COMMENT '변경일시' 
) COMMENT 'MAIL 받는사람 메타정보' ;

-- T_MAIL_RCVLIST_SEARCH

CREATE TABLE T_MAIL_RCVLIST_SEARCH(
 MAILID        VARCHAR(40) PRIMARY KEY  COMMENT '메일아이디',
 SEARCHCONTENT LONGTEXT                 COMMENT '받는사람 검색정보',
 
 DEVICE        VARCHAR(20) DEFAULT 'PC' COMMENT '장치', 
 REGUSERID     VARCHAR(40)              COMMENT '등록자아이디',
 REGDATE       DATETIME                 COMMENT '등록일시',
 CHGUSERID     VARCHAR(40)              COMMENT '변경자아이디',
 CHGDATE       DATETIME                 COMMENT '변경일시'
) COMMENT 'MAIL 받는사람 검색정보' ;

create table t_mail_sendinfo (
 sendinfoid       VARCHAR(40)  PRIMARY KEY  COMMENT '발송정보아이디',
 mailid           VARCHAR(40)               COMMENT '메일아이디',
 senduserid       VARCHAR(40)               COMMENT '발송자아이디',
 sender           VARCHAR(300)              COMMENT '발송자',
 replyto          VARCHAR(200)              COMMENT '답장주소',
 outboxsaveyn     CHAR(1)      DEFAULT 'Y'  COMMENT '보낸편지함저장여부',
 individualsendyn CHAR (1)     DEFAULT 'N'  COMMENT '개별전송여부',
 bookyn           CHAR (1)     DEFAULT 'N'  COMMENT '예약여부',
 bookfileid       VARCHAR (40)              COMMENT '예약파일아이디',
 timezone         VARCHAR (20)              COMMENT '타임존',
 timezonedate     DATETIME                  COMMENT '타임존일시',
 bookdate         DATETIME                  COMMENT '예약일시',
 bookstatus       VARCHAR (20)              COMMENT '예약상태',
 
 device           VARCHAR (20) DEFAULT 'PC' COMMENT '장치',
 reguserid        VARCHAR (40)              COMMENT '등록자아이디',
 regdate          DATETIME                  COMMENT  '등록일시',
 chguserid        VARCHAR(40)               COMMENT '변경자아이디',
 chgdate          DATETIME                  COMMENT  '변경일시'
) COMMENT 'MAIL 보낸사람 메타정보' ;

-- t_mail_simplecontent

create table t_mail_simplecontent (
 mailid        VARCHAR (40)  PRIMARY KEY COMMENT '메일아이디',
 simplecontent VARCHAR (400)             COMMENT '간단내용',
 searchcontent LONGTEXT                  COMMENT '검색내용',
 
 device        VARCHAR (20) DEFAULT 'PC' COMMENT '장치',
 reguserid     VARCHAR (40)              COMMENT '등록자아이디',
 regdate       DATETIME                  COMMENT '등록일시',
 chguserid     VARCHAR (40)              COMMENT '변경자아이디',
 chgdate       DATETIME                  COMMENT '변경일시' 
) COMMENT '메일 본문 내용' ;

-- T_MAIL_STATUS

CREATE TABLE t_mail_status (
 MAILID            VARCHAR(40) NOT NULL    COMMENT '메일아이디',
 USERID            VARCHAR(40) NOT NULL    COMMENT '사용자아이디',
 READYN            CHAR(1)     DEFAULT 'N' COMMENT '열람여부',
 IMPTYN            CHAR(1)     DEFAULT 'N' COMMENT '중요메일여부',
 REPLYYN           CHAR(1)     DEFAULT 'N' COMMENT '답변여부',
 DELIVERYYN        CHAR(1)     DEFAULT 'N' COMMENT '전달여부',
 SHAREYN           CHAR(1)     DEFAULT 'N' COMMENT '공유여부',
 DEVICE            VARCHAR(20) DEFAULT 'PC' COMMENT '장치',
 SHAREBOXLINKID    VARCHAR(80) COMMENT '공유함링크정보',
 
 REGUSERID         VARCHAR(40) COMMENT '등록자아이디',
 REGDATE           DATETIME    COMMENT '등록일시',
 CHGUSERID         VARCHAR(40) COMMENT '변경자아이디',
 CHGDATE           DATETIME    COMMENT '변경일시'
 , PRIMARY KEY( mailid , userid )
) COMMENT 'MAIL 사용자별 메일상태' ; 

-- 성병문 T_MAIL_USESIZE

CREATE TABLE T_MAIL_USESIZE ( 
 USERID     VARCHAR(40)  PRIMARY KEY  COMMENT'사용자아이디', 
 TOTCAP     DOUBLE(11,1) DEFAULT 0    COMMENT '총용량', 
 USECAP     DOUBLE(11,1) DEFAULT 0    COMMENT '사용용량', 
 TOTCNT     INTEGER(10)  DEFAULT 0    COMMENT '전체건수', 
 READCNT    INTEGER(10)  DEFAULT 0    COMMENT '열람건수', 
 OVERCNT    INTEGER(10)  DEFAULT 0    COMMENT '용량초과건수',
  
 IMPORTUNREADCNT INTEGER(10) DEFAULT 0 , 
 IMPORTCNT       INTEGER(10) DEFAULT 0 ,
 
 DEVICE     VARCHAR(20)  DEFAULT 'PC' COMMENT '장치', 
 REGUSERID  VARCHAR(40)               COMMENT '등록자아이디',
 REGDATE    DATETIME                  COMMENT '등록일시', 
 CHGUSERID  VARCHAR(40)               COMMENT '변경자아이디',
 CHGDATE    DATETIME                  COMMENT '변경일시' 
) COMMENT 'MAIL 개인별 사용량' ; 

-- END
