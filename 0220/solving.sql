-- 없어진 기록 찾기
SELECT 
    ANIMAL_OUTS.ANIMAL_ID, ANIMAL_OUTS.NAME
FROM ANIMAL_INS
RIGHT JOIN ANIMAL_OUTS
    ON ANIMAL_INS.ANIMAL_ID = ANIMAL_OUTS.ANIMAL_ID
WHERE ANIMAL_INS.ANIMAL_ID IS NULL;


-- 있었는데요 없었습니다
SELECT 
    I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS AS I
LEFT JOIN ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.DATETIME > O.DATETIME
ORDER BY I.DATETIME;


-- 오랜 기간 보호한 동물(1)
SELECT 
    I.NAME, I.DATETIME
FROM ANIMAL_INS AS I
LEFT JOIN ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE O.ANIMAL_ID IS NULL
ORDER BY I.DATETIME
LIMIT 3;


-- 보호소에서 중성화한 동물
SELECT 
    I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME
FROM ANIMAL_INS AS I
LEFT JOIN ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE
    I.SEX_UPON_INTAKE LIKE ('Intact%') AND (O.SEX_UPON_OUTCOME LIKE ('Spayed%') OR O.SEX_UPON_OUTCOME LIKE ('Neutered%'))
ORDER BY I.ANIMAL_ID;


-- 오랜 기간 보호한 동물(2)
SELECT 
    I.ANIMAL_ID, I.NAME
FROM
    ANIMAL_INS AS I
LEFT JOIN ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE O.DATETIME - I.DATETIME
ORDER BY O.DATETIME - I.DATETIME DESC
LIMIT 2;


-- 입양 시각 구하기(2) -- 넘 어려웠다..
SET @HOUR = -1;
SELECT 
    (@HOUR := @HOUR +1) AS 'HOUR',
    (SELECT COUNT(HOUR(DATETIME))
    FROM ANIMAL_OUTS
    WHERE HOUR(DATETIME)=@HOUR) AS COUNT
    FROM ANIMAL_OUTS
WHERE @HOUR < 23;


-- 우유와 요거트가 담긴 장바구니
SELECT CART_ID
FROM CART_PRODUCTS
WHERE NAME IN ('Milk', 'Yogurt')
GROUP BY CART_ID
HAVING COUNT(DISTINCT NAME) = 2;


-- 헤비 유저가 소유한 장소
SELECT *
FROM PLACES
WHERE HOST_ID IN (
    SELECT HOST_ID
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(ID) >= 2)
ORDER BY ID;
