-- A
use mdc_ch02;
select *
from customer;

select *
from invoice;

select *
from invoice_item;

-- B
select LastName, FirstName, Phone
from customer;

-- c
select LastName, FirstName, Phone
from customer
where FirstName like 'Nikki%';

-- D 
select  LastName, FirstName, Phone, DateOut
from customer
join invoice
where TotalAmount > '$100.00';

-- E 
select LastName, FirstName, phone
from customer
where FirstName like 'B%';

-- F 
select LastName, FirstName, phone
from customer
where LastName like '%cat';

-- G 
select LastName, FirstName, phone
from customer
where phone like '%23%';

-- H 
SELECT 
    MAX(TotalAmount) AS MaxTotalAmount,
    MIN(TotalAmount) AS MinTotalAmount
FROM Invoice;

-- I 
SELECT AVG(TotalAmount) AS AverageTotalAmount
FROM INVOICE;

-- J 
SELECT COUNT(*) AS NumberOfCustomers
FROM CUSTOMER;

-- K 
SELECT LastName, FirstName, COUNT(*) AS NumOfRecords
FROM CUSTOMER
GROUP BY LastName, FirstName
ORDER BY LastName, FirstName;

-- L 
SELECT LastName, FirstName, COUNT(*) AS CustomerCount
FROM CUSTOMER
GROUP BY LastName, FirstName
ORDER BY LastName, FirstName;

-- M 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID IN (
    SELECT CustomerID
    FROM INVOICE
    WHERE TotalAmount > 100
)
ORDER BY LastName ASC, FirstName DESC;

-- N 
SELECT C.LastName, C.FirstName, C.Phone
FROM CUSTOMER C, INVOICE I
WHERE C.CustomerID = I.CustomerID
  AND I.TotalAmount > 100
ORDER BY C.LastName ASC, C.FirstName DESC;

-- O 
SELECT C.LastName, C.FirstName, C.Phone
FROM CUSTOMER C
JOIN INVOICE I
    ON C.CustomerID = I.CustomerID
WHERE I.TotalAmount > 100
ORDER BY C.LastName ASC, C.FirstName DESC;

-- P 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID IN (
    SELECT CustomerID
    FROM INVOICE
    WHERE TotalAmount > 100
)
ORDER BY LastName ASC, FirstName DESC;

-- Q 
SELECT DISTINCT C.LastName, C.FirstName, C.Phone
FROM CUSTOMER C, INVOICE I
WHERE C.CustomerID = I.CustomerID
  AND I.TotalAmount > 100
ORDER BY C.LastName ASC, C.FirstName DESC;










