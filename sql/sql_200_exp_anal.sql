select * from t_user use index(primary) where name='aaa';

explain select * FROM t_user /*! use index(primary) */ where name='aaa';

SELECT * FROM t_mail, t_user WHERE rcvuserid = userid ;

SELECT * FROM
 t_mail 
 left join t_user ON ( rcvuserid = userid ) ;

SELECT * FROM
 t_mail 
 left outer join t_user ON( rcvuserid = userid ) ;

explain SELECT * FROM
 t_mail 
 left outer join t_user ON( rcvuserid = userid ) 
;

analyze SELECT * FROM t_mail, t_user WHERE rcvuserid =+ userid ;