-- useful sql 

SELECT UUID();

SELECT LEFT(UUID(), 8);

WITH recursive num AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM num WHERE n < 100 
)
SELECT n FROM num ;

select CONCAT(
substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand()*36+1, 1),
substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand()*36+1, 1),
substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand()*36+1, 1)
) as RANDOM_TEST ;

-- 현재 로그인 사용자 정보 조회 
SELECT user(), CURRENT_USER() FROM DUAL ;
SELECT CURRENT_USER ;

-- end of file