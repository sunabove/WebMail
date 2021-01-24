-- 웹 메일 제약 조건 

ALTER TABLE t_mail ADD CONSTRAINT t_mail_fk
FOREIGN KEY (REGUSERID) REFERENCES t_user( userid ) ; 

