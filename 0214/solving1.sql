-- 문제1
CREATE TABLE posts(
	postid INT AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
    content VARCHAR(200) NOT NULL,
    PRIMARY KEY(postid)
);


-- 문제2
ALTER table
	posts
ADD	writer VARCHAR(100) NULL DEFAULT'Anonymous',
ADD	created_at datetime NULL DEFAULT CURRENT_TIMESTAMP;


-- 문제3
ALTER TABLE
	posts
MODIFY
	content text NULL;
	

-- 문제4
ALTER TABLE
	posts
DROP COLUMN
	writer;
	

-- 문제5
DROP TABLE posts;


-- 문제6
CREATE TABLE posts(
 postid INT auto_increment,
 title VARCHAR(50) NOT NULL,
 content text NOT NULL,
 writer VARCHAR(20) NOT NULL,
 created_at datetime NULL DEFAULT current_timestamp,
 PRIMARY KEY (postid)
 );
 
-- 다른 풀이
 CREATE TABLE
IF NOT EXISTS posts (
    postId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(200) NOT NULL,
    writer VARCHAR(20) NOT null,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
 
 
-- 문제7
DROP TABLE posts;

DROP TABLE
IF EXISTS posts;

SHOW columns FROM posts;