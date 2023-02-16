SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM orders;

-- 문제1
SELECT productCode, productName, MSRP
FROM products
WHERE MSRP > (
	SELECT AVG(MSRP)
    FROM products
)
ORDER BY MSRP;


-- 문제2
SELECT customerNumber, customerName
FROM customers
WHERE customerNumber IN
    (
        SELECT customerNumber
        FROM orders
        WHERE orderDate BETWEEN '2003-01-06' AND '2003-03-26'
    )
ORDER BY customerNumber;
	

-- 문제3
SELECT productCode, productName, productLine, MSRP
FROM products
WHERE
	MSRP IN (
		SELECT MAX(MSRP)
        FROM products
        WHERE productLine = 'Classic Cars'
);
    

-- 문제4
SELECT customerNumber, customerName, country
FROM customers
WHERE country = (
	SELECT country
    FROM customers
    GROUP BY country
    ORDER BY COUNT(country) DESC
    LIMIT 1
)
ORDER BY customerNumber;


-- 문제5
SELECT customers.customerNumber, customerName, order_count
FROM customers
INNER JOIN (
	SELECT customerNumber, COUNT(customerNumber) AS order_count
    FROM orders
    GROUP BY customerNumber) AS o1
ON customers.customerNumber = o1.customerNumber
ORDER BY order_count DESC
LIMIT 1;


-- 문제6
SELECT productCode, productName
FROM products
WHERE productCode IN (
	SELECT productCode
    FROM orderdetails
    WHERE orderNumber IN (
		SELECT orderNumber
        FROM orders
        WHERE orderDate LIKE '2004%'
        )
	)
ORDER BY productCode DESC;
