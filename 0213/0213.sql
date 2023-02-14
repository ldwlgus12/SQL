-- 1
SELECT
	lastName, firstName, officeCode
FROM
	employees
where
	officeCode = 1;
    
-- 2    
SELECT 
	lastName,firstName,jobTitle
FROM 
	employees
where
	jobTitle != 'Sales Rep';

-- 3    
SELECT 
	lastName,firstName,officeCode,jobTitle
FROM 
	employees
where
	officeCode >= 3 
    AND jobTitle = 'Sales Rep';
    
-- 4
SELECT 
	lastName,firstName,officeCode,jobTitle
FROM 
	employees
where
	officeCode < 5 
    or jobTitle != 'Sales Rep';
    
-- 5
SELECT
	lastName,firstName,officeCode
FROM
	employees
WHERE
	officeCode >= 1
    AND officeCode <= 4;
    
SELECT
	lastName,firstName,officeCode
FROM
	employees
WHERE
	officeCode BETWEEN 1 AND 4;
    

-- 6
SELECT
	lastName,firstName,officeCode
FROM
	employees
WHERE
	officeCode BETWEEN 1 AND 4
ORDER BY
	officeCode ASC;
    
    
-- 7
SELECT
	lastName,firstName,officeCode
FROM
	employees
WHERE
	officeCode = 1 OR officeCode = 3 OR officeCode = 4;
    
    
SELECT
	lastName,firstName,officeCode
FROM
	employees
WHERE
	officeCode IN (1,3,4);
    
    
-- 8
SELECT
	lastName,firstName,officeCode
FROM
	employees
WHERE
	officeCode NOT IN (1,3,4);
    
    
-- 9
SELECT
	lastName,firstName
FROM
	employees
WHERE
	lastName LIKE '%son';
    
    
-- 10
SELECT
	lastName,firstName
FROM
	employees
WHERE
	firstName LIKE '___y';
    
    
-- limit 1
SELECT
	firstName, officeCode
FROM
	employees
ORDER BY
	officeCode DESC
    LIMIT 7;
    
-- 2
SELECT
	firstName, officeCode
FROM
	employees
ORDER BY
	officeCode DESC
    LIMIT 3,5;
    
    
-- group 1
SELECT
	country, AVG(creditLimit)
FROM
	customers
GROUP BY
	country
ORDER BY
	AVG(creditLimit) DESC;

SELECT
	country, AVG(creditLimit) AS avgOfCreditLimit
FROM
	customers
GROUP BY
	country
ORDER BY
	avgOfCreditLimit DESC;
    
    
-- 2
SELECT
	country, AVG(creditLimit)
FROM
	customers
GROUP BY
	country
HAVING
	AVG(creditLimit) > 80000;
    