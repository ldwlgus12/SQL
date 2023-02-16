-- nested
SELECT * FROM payments;

-- 예제1
SELECT MAX(amount)
FROM payments;

SELECT customerNumber, amount
FROM payments
WHERE amount = (
	SELECT MAX(amount)
	FROM payments
);


-- 예제2
SELECT * FROM employees;
SELECT * FROM offices;

SELECT officeCode
FROM offices
WHERE country = 'USA';

SELECT lastName, firstName
FROM employees
WHERE officeCode IN (
	SELECT officeCode
	FROM offices
	WHERE country = 'USA'
);


-- 예제3
SELECT * FROM customers;
SELECT * FROM orders;

SELECT customerNumber
FROM orders;

SELECT customerName
FROM customers
WHERE customerNumber NOT IN (
	SELECT customerNumber
	FROM orders
);


-- 심화1
SELECT MAX(amount)
FROM payments;

SELECT customerNumber, amount, contactFirstName
FROM (
	SELECT *
    FROM payments
    INNER JOIN customers USING (customerNumber)
) AS mysub
WHERE amount = (
	SELECT MAX(amount)
	FROM payments
);



-- EXISTS
-- 예제1
SELECT customerNumber, customerName
FROM customers
WHERE EXISTS (
	SELECT *
    FROM orders
    WHERE customers.customerNumber = orders.customerNumber
);

-- 예제2
SELECT employeeNumber ,firstName, lastName
FROM employees
WHERE officeCode IN (
	SELECT officeCode
	FROM offices
	WHERE city = 'Paris'
);


SELECT employeeNumber ,firstName, lastName
FROM employees
WHERE EXISTS (
	SELECT *
    FROM offices
    WHERE
		city = 'Paris' AND
        offices.officeCode = employees.officeCode
);



-- CASE
-- 1
SELECT contactFirstName, creditLimit, 
	CASE -- 케이스 문으로 grade 하나 만든거
		WHEN creditLimit > 100000 THEN 'VIP'
        WHEN creditLimit > 70000 THEN 'pla'
        ELSE 'bronze'
    END AS grade
FROM customers;

-- 2
SELECT orderNumber, status, 
	CASE 
		WHEN status = 'In Process' THEN '주문중'
        WHEN status = 'Shipped' THEN '발주완료'
        WHEN status = 'Cancelled' THEN '주문취소'
        ELSE '기타사유'
    END AS details
FROM orders;