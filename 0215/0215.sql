-- 시작 전 데이터 준비
CREATE TABLE  users(
	id INT auto_increment,
    name varchar(50) NOT NULL,
    primary key (id)
);

CREATE TABLE articles (
	id INT auto_increment,
    title varchar(50) NOT NULL,
    content varchar(100) NOT NULL,
    userId INT NOT NULL,
    primary key (id)
);

INSERT INTO
	users (name)
values
	('권미자'),
    ('류준하'),
    ('정영식');

INSERT INTO
	articles (title, content, userId)
VALUES
	('제목1', '내용1', 1),
    ('제목2', '내용2', 2),
    ('제목3', '내용3', 4);

SELECT * FROM users;    
SELECT * FROM articles;



-- inner join
SELECT
	*
FROM
	articles
INNER JOIN users
	ON articles.userId = users.id;

-- 실습
SELECT
	productCode,
    productName,
    textDescription
FROM
	products
INNER JOIN productlines
	ON products.productLine = productlines.productline;
    
SELECT
	t1.orderNumber,
    t1.status,
    t2.priceEach
FROM
	orders AS t1
INNER JOIN orderdetails AS t2
	ON t1.orderNumber = t2.orderNumber;

SELECT
	t1.orderNumber,
    SUM(t2.priceEach * t2.quantityOrdered) AS totalSales
FROM
	orders AS t1
INNER JOIN orderdetails AS t2
	ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;


-- LEFT JOIN
SELECT
	*
FROM
	articles
LEFT JOIN users
	ON articles.userId = users.id;
    
-- 실습
SELECT
	contactFirstName, orderNumber, status
FROM
	customers
LEFT JOIN orders
	ON customers.customerNumber = orders.customerNumber;
    
SELECT
	contactFirstName, orderNumber, status
FROM
	customers
LEFT JOIN orders
	ON customers.customerNumber = orders.customerNumber
WHERE
	orders.orderNumber IS NULL;
    
    
-- right join
SELECT
	*
FROM
	articles
RIGHT JOIN users
	ON articles.userId = users.id;
    
-- 실습
SELECT
	employeeNumber, firstName, customerNumber, contactFirstName
FROM
	customers
RIGHT JOIN employees
	ON salesRepEmployeeNumber = employeeNumber;
    
    
SELECT
	employeeNumber, firstName, customerNumber, contactFirstName
FROM
	customers
RIGHT JOIN employees
	ON salesRepEmployeeNumber = employeeNumber
WHERE
	salesRepEmployeeNumber IS NULL
    
    