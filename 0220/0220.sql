-- 자동 커밋 비활성화
SET autocommit = 0;

CREATE TABLE users (
	id INT AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    PRIMARY KEY (id)
);

START TRANSACTION;

INSERT INTO users(name)
VALUES ('harry'), ('test');

SELECT * FROM users;

-- 트랜잭션 시작 전으로 돌림
ROLLBACK;

-- 커밋 명령어
COMMIT;



-- 트리거 --------------------------------
-- 연습1
CREATE TABLE articles (
	id INT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    createAt DATETIME NOT NULL,
    updateAt DATETIME NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO articles (title, createAt, updateAt)
VALUES ('title1', current_time(), current_time());

SELECT * FROM articles;


-- 트리거 생성
-- 여기서부터 종료 조건은 이제 '//'
DELIMITER //
CREATE TRIGGER myTrigger
	BEFORE UPDATE
	ON articles FOR EACH ROW
BEGIN 
    SET NEW.updateAt = CURRENT_TIME();
END//
DELIMITER ;
-- BEGIN, END는 조건 여러 개일때 사용, 하나 일 때도 써 주는게 좋음
-- 여기서는 ;으로 변경
-- 주의) 트리거 구문안에 주석을 넣으면 트리거 생성이 안됨. 주석 처리할 게 있으면 밖에다 생성할 것


-- 트리거 리스트 보기
SHOW TRIGGERS;

-- 업데이트 후 필드 값 확인
UPDATE articles
SET title = 'new title'
WHERE id = 1;


-- 연습2 ---------------------------------
CREATE TABLE articleLogs (
	id INT AUTO_INCREMENT,
    description VARCHAR(100) NOT NULL,
    createAt DATETIME NOT NULL,
    PRIMARY KEY (id)
);


DELIMITER //
CREATE TRIGGER recordlogs
	AFTER INSERT
    ON articles FOR EACH ROW
BEGIN
	INSERT INTO articlelogs (description, createAt)
    VALUES ('글이 작성됐어요.', current_time());
END//
DELIMITER ;


SHOW TRIGGERS;


INSERT INTO articles (title, createAt, updateAt)
VALUES ('title2', current_time(), current_time());

SELECT * FROM articles;

SELECT * FROM articlelogs;


-- 연습2 심화 -----
DROP TRIGGER recordlogs;

DELIMITER //
CREATE TRIGGER recordlogs
	AFTER INSERT
    ON articles FOR EACH ROW
BEGIN
	INSERT INTO articlelogs (description, createAt)
    VALUES (CONCAT(NEW.id, '번 글이 작성됐어요.'), current_time());
END//
DELIMITER ;


INSERT INTO articles (title, createAt, updateAt)
VALUES ('title2', current_time(), current_time());

SELECT * FROM articles;

SELECT * FROM articlelogs;


-- 연습3 -----
CREATE TABLE backupArticles (
	id INT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    createAt DATETIME NOT NULL,
    updateAt DATETIME NOT NULL,
    PRIMARY KEY (id)
);

DELIMITER //
CREATE TRIGGER backuplogs
	AFTER DELETE
    ON articles FOR EACH ROW
BEGIN
	INSERT INTO backupArticles (title, createAt, updateAt)
    VALUES (OLD.title, OLD.createAt, OLD.updateAt);
END//
DELIMITER ;

SHOW TRIGGERS;

DELETE FROM articles
WHERE id = 1;

SELECT * FROM articles;
SELECT * FROM backupArticles;
