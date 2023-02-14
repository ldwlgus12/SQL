-- 문제1
SELECT DISTINCT
	country
FROM
	customers
ORDER BY
	country;
    

-- 문제2
SELECT DISTINCT
	state
FROM
	customers
ORDER BY
	state DESC;


-- 문제3
SELECT
	customerNumber, customerName, country
FROM
	customers
WHERE
	country != 'USA'
ORDER BY
	customerNumber DESC;
    

-- 문제4
SELECT
	*
FROM
	offices
WHERE
	city = 'Paris';
    

-- 문제5
SELECT
	customerNumber, customerName, country, state
FROM
	customers
WHERE
	country = 'USA'
    AND state = 'CA'
ORDER BY
	customerName DESC;
    

-- 문제6
SELECT
	customerNumber, customerName, country, state
FROM
	customers
WHERE
	country = 'USA'
    AND state = 'CA'
    OR state = 'NY'
ORDER BY
	customerNumber DESC;
    
    
-- 문제7
SELECT
	customerNumber, customerName, state
FROM
	customers
WHERE
    state IN ('CA', 'NY', 'CT', 'PA')
ORDER BY
	customerNumber DESC;
    
    
-- 문제8
SELECT
	productCode, productName, quantityInStock
FROM
	products
WHERE
	quantityInStock < 1000
ORDER BY
	quantityInStock;
    
    
-- 문제9
SELECT
	productCode, productName, quantityInStock
FROM
	products
WHERE
	quantityInStock BETWEEN 2000 AND 3000
ORDER BY
	quantityInStock DESC;
    
    
-- 문제10
SELECT
	customerNumber, customerName, phone
FROM
	customers
WHERE
	phone LIKE '%_%555'
ORDER BY
	customerName DESC;
    
    
-- 문제11
SELECT
	productCode, quantityInStock
FROM
	products
ORDER BY
	quantityInStock DESC
LIMIT 5;


-- 문제12
SELECT
	jobTitle, COUNT(*) AS count_job
FROM
	employees
GROUP BY
	jobTitle
ORDER BY
	count_job DESC, jobTitle DESC;
    
    
-- 문제13
SELECT
	country, COUNT(*) AS count_country
FROM
	customers
GROUP BY
	country
ORDER BY
	count_country DESC, country DESC;
    
    
-- 문제14
SELECT
	orderNumber, SUM(quantityOrdered * priceEach) AS total
FROM
	orderdetails
GROUP BY
	orderNumber
ORDER BY
	total DESC;
    

-- 문제15
SELECT 
	EXTRACT(year FROM orderdate) AS year, COUNT(orderNumber)
FROM
	orders
GROUP BY
	year;
    

-- 문제16
SELECT
	productLine, MAX(quantityInStock) AS max_stock
FROM
	products
GROUP BY
	productLine
HAVING
	max_stock < 9000;
    
    
-- 문제17
SELECT
	orderNumber, 
    SUM(quantityOrdered) AS itemCount, 
    SUM(priceEach * quantityOrdered) AS total
FROM
	orderdetails
GROUP BY
	orderNumber
HAVING
	itemCount >= 500 AND total >= 50000;
	
	