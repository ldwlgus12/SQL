-- 생성
CREATE TABLE examples (
	examId INT auto_increment,
	lastName VARCHAR(50) NOT NULL,
	firstName VARCHAR(50) NOT NULL,
    PRIMARY KEY (examId)
);


-- 삭제
DROP table examples;


-- 기존 테이블에 필드 추가
ALTER table
	examples
ADD
	country VARCHAR(100) NOT NULL;

ALTER table
	examples
ADD	age INT NOT NULL,
ADD	address VARCHAR(100) NOT NULL;


-- 필드 수정
ALTER TABLE
	examples
modify
	address varchar(50) NOT NULL;


ALTER TABLE
	examples
modify lastName varchar(10) NOT NULL,
modify firstName varchar(10) NOT NULL;

SHOW columns FROM examples;


-- 필드 이름 수정
ALTER TABLE
	examples
change column
	country state VARCHAR(100) NOT NULL;
    

-- 필드 삭제
ALTER TABLE
	examples
DROP column
	address;
    

ALTER TABLE
	examples
DROP column	state,
drop column age;




-- DML
CREATE TABLE articles (
 id INT auto_increment,
 title varchar(100) NOT NULL,
 content VARCHAR(200) NOT NULL,
 createAt DATE NOT NULL,
 primary key(id)
);

SHOW columns FROM articles;

SELECT * FROM articles;

-- 테이블 레코드 삽입
INSERT INTO 
	articles (title, content, createAt)
values 
	('hello', 'world', '2000-01-01'); 
    
    
INSERT INTO 
	articles (title, content, createAt)
values 
	('title1', 'content1', '1900-01-01'),
    ('title2', 'content2', '1800-01-01'),
    ('title3', 'content3', '1700-01-01');
    
 -- 현재 날짜 삽입   
INSERT INTO 
	articles (title, content, createAt)
values 
	('mytitle', 'mycontent', CURDATE()); 
    

-- 테이블 레코드 수정
UPDATE articles
SET title = 'newTitle'
WHERE
	id = 1; -- where 안쓰면 title 필드 전체가 변경됨
    

UPDATE articles
SET 
	title = 'haha',
	content = 'hoho'
WHERE
	id = 2;
    
    
-- mysql string function
-- 필드 값의 문자열 변경
UPDATE articles
SET 
	content = REPLACE(content, 'content', 'TEST');
    
-- 일시적인 안전모드 해제
SET SQL_SAFE_UPDATES = 0;
    
    
-- 테이블 레코드 삭제
DELETE FROM articles
WHERE
 id = 1;
 
 
SELECT * FROM articles
ORDER BY createAt DESC;


DELETE FROM 
	articles
ORDER BY
	createAt DESC
LIMIT 2;