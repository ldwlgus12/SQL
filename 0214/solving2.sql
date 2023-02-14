-- 문제1
CREATE TABLE users(
	userid INT auto_increment,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    birthday date NOT NULL,
    city VARCHAR(100) NULL,
    country VARCHAR(100) NULL,
    email VARCHAR(100) NULL,
    created_at datetime null DEFAULT current_timestamp,
    PRIMARY KEY(userid)
);


-- 문제2
INSERT INTO
	users (first_name, last_name, birthday, city, country, email)
VALUES
	('Beemo', 'Jeong', '1000-01-01', ' ', ' ', 'beemo@hphk.kr'),
    ('Jieun', 'Lee', '1993-05-16', 'Seoul', 'Korea',' '),
    ('Dami', 'Kim', '1995-04-09', 'Seoul', 'Korea',' '),
    ('Kwangsoo', 'Lee', '1985-07-14', 'Seoul', 'Korea',' ');


-- 문제3
INSERT INTO
	users (first_name, last_name, birthday, city, country, email)
VALUES
	('bee', 'Je', '1111-01-01', ' ', ' ', 'bee@hphk.kr'),
    ('eun', 'Kim', '1900-05-16', 'Seoul', 'Korea',' '),
    ('mi', 'Lee', '1988-04-09', 'Seoul', 'Korea',' '),
    ('soo', 'Kwang', '2000-07-14', 'Seoul', 'Korea',' '),
    ('salgoo', 'Park', '2121-07-14', 'Seoul', 'Korea',' ');


-- 문제4
UPDATE
	users
SET
	first_name = 'Jihyeon',
    last_name = 'Jeon',
    birthday = '2000-04-03'
WHERE
	userid = 2;
    
    
-- 문제5
UPDATE
	users
SET
	country = REPLACE(country, ' ', 'Korea');
-- SELECT IFNULL(country, 'Korea') FROM users ;


-- 문제6
DELETE FROM users
WHERE first_name = 'Beemo';


-- 문제7
DELETE FROM users
WHERE 
	first_name = 'Kwangsoo'
	or	last_name = 'Lee';


-- 문제8
DELETE FROM 
	users
ORDER BY
	created_at DESC
LIMIT 1;
    
    

SHOW columns FROM users;

select * FROM users;