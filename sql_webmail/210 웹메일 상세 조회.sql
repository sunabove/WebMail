
SELECT 
( FLOOR( ( ROW_NUMBER() OVER(ORDER BY tm.RCVDATE) )/10 ) + 1 ) AS pno ,
ROW_NUMBER() OVER(ORDER BY tm.RCVDATE) rno , 
tm.mailid AS mailid , 
LAG( tm.mailid  ) OVER( ORDER BY tm.rcvDate ) AS prev_mailid, 
LEAD( tm.mailid ) OVER( ORDER BY tm.rcvDate ) AS next_mailid, 
tu.userid, tu.name, tm.title ,tms.simplecontent AS content ,
tm.RCVUSERID, tm.RCVDATE, tmr.rcvtype , 
'' AS z
FROM t_user tu
LEFT JOIN t_mail tm ON ( tu.userid = tm.rcvUserId AND tu.name='admin' )
LEFT JOIN t_mail_rcvinfo tmr ON tm.MAILID = tmr.mailid
LEFT JOIN t_mail_simplecontent tms ON tm.MAILID = tms.mailid
WHERE 1 = 1 
AND tm.mailid IS NOT NULL 
AND ( LENGTH( '' ) = 0 OR SIGN( INSTR( tm.title, '' ) ) = 1 ) -- LIKE '%A%'  
ORDER BY tm.RCVDATE 
LIMIT 20, 10
; 
