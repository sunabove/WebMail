-- 웹 메일 제약 조건
-- DROP TABLE IF EXISTS student ;
 
-- ALTER TABLE t_mail DROP CONSTRAINT t_mail_fk ;

-- mail

ALTER TABLE t_mail ADD CONSTRAINT t_mail_fk
FOREIGN KEY (REGUSERID) REFERENCES t_user( userid ) ; 

-- mail box
ALTER TABLE t_mail_mailbox ADD CONSTRAINT t_mail_box_fk
FOREIGN KEY (userid) REFERENCES t_user( userid ) ;

-- 
