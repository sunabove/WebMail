SELECT *
FROM (SELECT 1) a, (SELECT 2) b
WHERE a.1 = b.2 ;

SELECT *
FROM (SELECT 1 AS c) a, (SELECT 1 AS c) b
WHERE a.c=b.c ;

CREATE TABLE a( a INT ) ;
INSERT INTO a VALUES ( 1 ), (2) ;

SELECT * FROM a AS a, a AS b 
WHERE a.a=b.a;

-- with example 01
DROP TABLE if EXISTS t1 ;
CREATE TABLE t1 (a int, b VARCHAR(200));

INSERT INTO t1 VALUES 
(1,'A'), (1, 'Z'), (2, 'C'), (3,'D'), (4,'A');

WITH t AS (SELECT a FROM t1 WHERE b >= 'c') 
SELECT * FROM t1, t WHERE t1.a = t.a ; 

SELECT * FROM 
t1 AS t1, 
(SELECT a FROM t1 WHERE b >= 'c') AS t
WHERE t1.a = t.a ; 
-- // with example 01

-- with example 02

DROP TABLE if EXISTS t1 ;
CREATE TABLE t1 (from_ int, to_ INT);
INSERT INTO t1 VALUES (1,2), (1,100), (2,3), (3,4), (4,1);

SELECT * FROM t1 ;

WITH RECURSIVE cte (depth, from_, to_) AS
( 
  SELECT 0, 1, 1 
  UNION 
  SELECT depth+1, t1.from_, t1.to_ 
  FROM t1, cte 
  WHERE t1.from_ = cte.to_ 
) 
CYCLE from_, to_ RESTRICT 
SELECT * FROM cte ;

-- // with example 02

-- window lag function example

DROP TABLE if EXISTS t1 ;

CREATE TABLE t1 (pk int primary key, a int, b int, c char(10), d decimal(10, 3), e real);

INSERT INTO t1 VALUES
 ( 1, 0, 1,    'one',    0.1,  0.001),
 ( 2, 0, 2,    'two',    0.2,  0.002),
 ( 3, 0, 3,    'three',  0.3,  0.003),
 ( 4, 1, 2,    'three',  0.4,  0.004),
 ( 5, 1, 1,    'two',    0.5,  0.005),
 ( 6, 1, 1,    'one',    0.6,  0.006),
 ( 7, 2, NULL, 'n_one',  0.5,  0.007),
 ( 8, 2, 1,    'n_two',  NULL, 0.008),
 ( 9, 2, 2,    NULL,     0.7,  0.009),
 (10, 2, 0,    'n_four', 0.8,  0.010),
 (11, 2, 10,   NULL,     0.9,  NULL)
 ;

SELECT pk, LAG(pk) over(ORDER by pk) as pk2 FROM t1 ;

SELECT pk, LAG(pk) OVER (ORDER BY pk) AS l,
  LAG(pk, 1) OVER (ORDER BY pk) AS l1,
  LAG(pk, 2) OVER (ORDER BY pk) AS l2,
  LAG(pk, 0) OVER (ORDER BY pk) AS l0,
  LAG(pk,-1) OVER (ORDER BY pk) AS lm1,
  LAG(pk,-2) OVER (ORDER BY pk) AS lm2 
FROM t1
;
-- // window lag function example

-- window lead function example

DROP TABLE if EXISTS t1 ;

CREATE TABLE t1 (pk int primary key, a int, b int, c char(10), d decimal(10, 3), e real);

INSERT INTO t1 VALUES
 ( 1, 0, 1,    'one',    0.1,  0.001),
 ( 2, 0, 2,    'two',    0.2,  0.002),
 ( 3, 0, 3,    'three',  0.3,  0.003),
 ( 4, 1, 2,    'three',  0.4,  0.004),
 ( 5, 1, 1,    'two',    0.5,  0.005),
 ( 6, 1, 1,    'one',    0.6,  0.006),
 ( 7, 2, NULL, 'n_one',  0.5,  0.007),
 ( 8, 2, 1,    'n_two',  NULL, 0.008),
 ( 9, 2, 2,    NULL,     0.7,  0.009),
 (10, 2, 0,    'n_four', 0.8,  0.010),
 (11, 2, 10,   NULL,     0.9,  NULL)
 ;

SELECT pk, LEAD(pk) OVER (ORDER BY pk) AS pk_3 FROM t1 ;

SELECT pk, LEAD(pk) OVER (ORDER BY pk) AS l,
  LEAD(pk, 1) OVER (ORDER BY pk) AS l1,
  LEAD(pk, 2) OVER (ORDER BY pk) AS l2,
  LEAD(pk, 0) OVER (ORDER BY pk) AS l0,
  LEAD(pk, -1) OVER (ORDER BY pk) AS lm1,
  LEAD(pk, -2) OVER (ORDER BY pk) AS lm2 
FROM t1
;

-- // window lead function example

-- window rank function example

CREATE TABLE student(course VARCHAR(10), mark int, name varchar(10)) ;

INSERT INTO student VALUES 
('Maths', 60, 'Thulile'),
('Maths', 60, 'Pritha'),
('Maths', 70, 'Voitto'),
('Maths', 55, 'Chun'),
('Biology', 60, 'Bilal'),
('Biology', 70, 'Roger')
;

SELECT 
	RANK() OVER (PARTITION BY course ORDER BY mark DESC) AS rank, 
	DENSE_RANK() OVER (PARTITION BY course ORDER BY mark DESC) AS dense_rank, 
	ROW_NUMBER() OVER (PARTITION BY course ORDER BY mark DESC) AS rno , 
	course, mark, name 
FROM student ORDER BY course, mark DESC
;

SELECT * FROM student ;
-- 과목 별 평균

SELECT course, AVG(mark)
FROM student
GROUP BY course ;

SELECT course, AVG(mark), NAME
FROM student
GROUP BY course ;

SELECT course, NAME, 
AVG(mark) OVER( PARTITION BY name ) as AVG 
FROM student 
ORDER BY course, NAME 
;

SELECT
  course, AVG(mark), group_concat(NAME)
  FROM student
GROUP BY course ;

-- // window rank function example

-- n record create 

WITH recursive num AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM num WHERE n < 100 
)
SELECT n FROM num ;

DROP TABLE if EXISTS test2 ;
DROP TABLE if EXISTS test3 ;

CREATE TABLE test2 AS (
	WITH RECURSIVE cte AS (
	    SELECT 1 AS num
	    UNION ALL
	    SELECT num + 1 FROM cte WHERE num < 10000
	)
	SELECT num FROM cte WHERE num != 9553 
);

CREATE TABLE test3 AS SELECT * FROM test2 ;

SELECT * FROM test2 ;

-- // n record create

-- foreign key / index example

DROP TABLE if EXISTS c ;
DROP TABLE if EXISTS c2 ;
DROP TABLE if EXISTS a ;

CREATE TABLE a( b INT PRIMARY KEY , c INT );

CREATE TABLE c( d INT PRIMARY KEY, FOREIGN KEY ( d ) REFERENCES a(b) ) ;

CREATE TABLE c2( e INT , FOREIGN KEY ( e ) REFERENCES a(b) ) ;

-- foreign key / index example

-- end of file