
SELECT 
	  ( FLOOR( rno/row_cnt ) + 1) AS pno,
	  a.*
	FROM ( 
	  SELECT 
	  ROW_NUMBER() OVER(ORDER BY INSTR( tm.title, srch_keyword ), tm.RCVDATE ) rno , 
	  tm.mailid AS mailid , 
	  tu.userid, tu.name, tm.title ,tms.simplecontent AS content ,
	  tm.RCVUSERID, tm.RCVDATE, tmr.rcvtype , 
	  row_cnt 
	  FROM 
	  ( SELECT 10 AS row_cnt, '' AS srch_keyword FROM dual ) AS param , 
	  t_user tu
	  LEFT JOIN t_mail tm ON ( tu.userid = tm.rcvUserId AND tu.name='admin' )
	  LEFT JOIN t_mail_rcvinfo tmr ON tm.MAILID = tmr.mailid
	  LEFT JOIN t_mail_simplecontent tms ON tm.MAILID = tms.mailid
	  WHERE 1 = 1 
	  AND tm.mailid IS NOT NULL 
	  AND ( LENGTH( srch_keyword ) = 0 OR SIGN( INSTR( tm.title, srch_keyword ) ) = 1 )
	  ORDER BY INSTR( tm.title, srch_keyword ), tm.RCVDATE 
	  LIMIT 0, 10
	) AS a
	ORDER BY rno 
