-- 문제1
SELECT
	employeeNumber, lastName, firstName, city
FROM
	employees
INNER JOIN offices
	ON employees.officeCode = offices.officeCode
ORDER BY
	employeeNumber;
    
    
-- 문제2
SELECT
	c1.customerNumber,
    o1.officeCode,
    c1.city,
    o1.city
FROM
	customers AS c1
LEFT JOIN offices AS o1
	ON c1.city = o1.city
ORDER BY
	customerNumber DESC;


-- 문제3
SELECT
	c1.customerNumber,
    o1.officeCode,
    c1.city,
    o1.city
FROM
	customers AS c1
RIGHT JOIN offices AS o1
	ON c1.city = o1.city
ORDER BY
	customerNumber DESC;


-- 문제4
SELECT
	c1.customerNumber,
    o1.officeCode,
    c1.city,
    o1.city
FROM
	customers AS c1
INNER JOIN offices AS o1
	ON c1.city = o1.city
ORDER BY
	customerNumber DESC;


-- 문제5
-- 문제2는 city를 기준으로 LEFT JOIN한 것으로, 오른쪽 테이블에 매치되는 레코드가 없으면 NULL로 표시되고, 
-- 문제3은 city를 기준으로 RIGHT JOIN한 것으로, 왼쪽 테이블에 매치되는 레코드가 없으면 NULL로 표시되고, 
-- 문제4는 city를 기준으로 INNER JOIN한 것으로 두 테이블에서 값이 일치하는 레코드에 대해서만 결과를 반환하기 때문에
-- 세 문제의 조회 결과가 다르게 나온다.


-- 문제6
SELECT
	customers.customerNumber,
    offices.officeCode,
    customers.city,
    offices.city
FROM
	customers 
LEFT JOIN offices 
	ON customers.city = offices.city
UNION
SELECT
	customers.customerNumber,
    offices.officeCode,
    customers.city,
    offices.city
FROM
	customers
RIGHT JOIN offices 
	ON customers.city = offices.city

ORDER BY
	customerNumber DESC;


-- 문제7
SELECT
	t1.orderNumber, orderDate
FROM
	orderdetails AS t1
INNER JOIN orders AS t2
 	ON t1.orderNumber = t2.orderNumber
ORDER BY
	orderNumber;


-- 문제8
SELECT
	o1.orderNumber, p1.productCode, p1.productName
FROM
	orderdetails AS o1
INNER JOIN products AS p1
 	ON o1.productCode = p1.productCode
ORDER BY
	orderNumber;


-- 문제9
SELECT
	o1.orderNumber, p1.productCode, o2.orderDate ,p1.productName
FROM
	orderdetails AS o1
INNER JOIN orders AS o2
	ON o1.orderNumber = o2.orderNumber
INNER JOIN products AS p1
 	ON o1.productCode = p1.productCode
ORDER BY
	orderNumber;
    
    