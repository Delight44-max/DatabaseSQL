use cape_codd;

-- 2.17
select SKU, SKU_Description
from INVENTORY;

-- 2.18
select SKU_Description, SKU
from INVENTORY;

-- 2.19
select warehouseID
from INVENTORY;

-- 2.20
select DISTINCT warehouseID as ID
from INVENTORY;

-- 2.21
select  SKU_Description, SKU, warehouseID, QuantityOnHand, QuantityOnOrder
from INVENTORY;

-- 2.22
select *
from INVENTORY;

-- 2.23
select *
from INVENTORY WHERE QuantityOnHand > 0;

-- 2.24
select SKU, SKU_Description
from INVENTORY WHERE QuantityOnHand = 0; 

-- 2.25
select SKU, SKU_Description, warehouseID
from INVENTORY  WHERE  QuantityOnHand = 0
 ORDER BY warehouseID ASC;


-- 2.26
select SKU, SKU_Description, warehouseID
from INVENTORY WHERE QuantityOnHand > 0
ORDER BY  warehouseID DESC, SKU ASC;

-- 2.27
select SKU, SKU_Description, warehouseID
from INVENTORY WHERE QuantityOnHand = 0 and 
QuantityOnOrder > 0
ORDER BY warehouseID DESC, SKU ASC;

-- 2.28
select SKU, SKU_Description, warehouseID
from INVENTORY WHERE QuantityOnHand = 0 or
QuantityOnOrder = 0
ORDER BY warehouseID DESC, SKU ASC;

-- 2.29
select SKU, SKU_Description, warehouseID, QuantityOnHand
from INVENTORY WHERE QuantityOnHand > 1 and QuantityOnHand < 10;

-- 2.30
select SKU, SKU_Description, warehouseID, QuantityOnHand
from INVENTORY WHERE QuantityOnHand BETWEEN 1 and 10;

-- 2.31
select DISTINCT SKU, SKU_Description
 from SKU_DATA WHERE 
 SKU_Description LIKE '%Half-Dome%';
 
 -- 2.32
 select  DISTINCT SKU, SKU_DESCRIPTION
 from INVENTORY
 WHERE SKU_DESCRIPTION like '%CLIMB%';
 
 -- 2.33
 SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '__d%';


-- 2.34
SELECT 
    AVG(QuantityOnHand) AS Average_On_Hand,
    SUM(QuantityOnHand) AS Total_On_Hand,
    MIN(QuantityOnHand) AS Minimum_On_Hand,
    MAX(QuantityOnHand) AS Maximum_On_Hand,
    COUNT(QuantityOnHand) AS Count_Of_Records
FROM INVENTORY;


-- 2.35
-- COUNT counts the number of rows (or non-NULL values) in a column.
-- SUM adds up all the numeric values in a column.
-- If QuantityOnHand values are: 5, 10, 20 → SUM returns 35.

-- 2.37
SELECT 
    WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.38
SELECT 
    WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;

SELECT 
    WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(*) < 2
ORDER BY TotalItemsOnHandLT3 DESC;

-- 3.9
-- The WHERE clause removes rows where QuantityOnHand >= 3 before grouping.
-- WHERE QuantityOnHand < 3 → filter rows before grouping.
-- The WHERE clause is applied first.
-- why 
-- WHERE filters individual rows before grouping.
-- GROUP BY then groups the remaining rows.
-- HAVING applies conditions after the grouping has been created.

-- 2.40
SELECT 
    I.SKU,
    I.SKU_Description,
    I.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState
FROM INVENTORY I
JOIN WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE W.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.41
SELECT 
    I.SKU,
    I.SKU_Description,
    I.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState
FROM INVENTORY I
JOIN WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE W.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.42
SELECT 
    I.SKU,
    I.SKU_Description,
    I.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState
FROM INVENTORY I
JOIN WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE W.WarehouseCity <> 'Atlanta'
  AND W.WarehouseCity <> 'Bangor'
  AND W.WarehouseCity <> 'Chicago';

-- 2.43
SELECT 
    I.SKU,
    I.SKU_Description,
    I.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState
FROM INVENTORY I
JOIN WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE W.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.44

SELECT 
    CONCAT(SKU_Description, ' is located in ', WarehouseCity) AS ItemLocation
FROM INVENTORY I
JOIN WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID;

-- 2.45
SELECT 
    SKU, 
    SKU_Description, 
    WarehouseID
FROM INVENTORY
WHERE WarehouseID IN (
    SELECT WarehouseID 
    FROM WAREHOUSE
    WHERE ManagerName = 'Lucille Smith'
);

-- 2.46
SELECT 
    I.SKU,
    I.SKU_Description,
    I.WarehouseID
FROM INVENTORY I, WAREHOUSE W
WHERE I.WarehouseID = W.WarehouseID
  AND W.ManagerName = 'Lucille Smith';

-- 2.47
SELECT 
    I.SKU,
    I.SKU_Description,
    I.WarehouseID
FROM INVENTORY I
JOIN WAREHOUSE W 
    ON I.WarehouseID = W.WarehouseID
WHERE W.ManagerName = 'Lucille Smith';

-- 2.48
SELECT 
    WarehouseID,
    AVG(QuantityOnHand) AS AvgQty
FROM INVENTORY
WHERE WarehouseID IN (
    SELECT WarehouseID
    FROM WAREHOUSE
    WHERE ManagerName = 'Lucille Smith'
)
GROUP BY WarehouseID;

-- 2.49
SELECT 
    I.WarehouseID,
    AVG(I.QuantityOnHand) AS AvgQty
FROM INVENTORY I, WAREHOUSE W
WHERE I.WarehouseID = W.WarehouseID
  AND W.ManagerName = 'Lucille Smith'
GROUP BY I.WarehouseID;

-- 2.50
SELECT 
    I.WarehouseID,
    AVG(I.QuantityOnHand) AS AvgQty
FROM INVENTORY I
JOIN WAREHOUSE W
    ON I.WarehouseID = W.WarehouseID
WHERE W.ManagerName = 'Lucille Smith'
GROUP BY I.WarehouseID; 

-- 2.51
SELECT 
    W.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState,
    I.SKU,
    I.MANAGER,
    I.SKU_Description
FROM WAREHOUSE W
JOIN  SKU_DATA I
    ON W.WarehouseID = I.WarehouseID
WHERE MANAGER = 'Lucille Smith';

-- 2.52
SELECT 
    WarehouseID,
    QuantityOnOrder,
    SUM(QuantityOnOrder) AS TotalItemsOnOrder,
    SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID, QuantityOnOrder;

-- 2.53
-- You cannot use a subquery because:

-- The question requires grouping (using GROUP BY)

-- A subquery returns a single value or a column, not grouped summaries
-- You need aggregates (SUM) grouped by multiple columns directly in the main query
-- A subquery cannot replace the GROUP BY requirement here

-- 2.54
-- JOIN Combines two tables side-by-side
-- SUBQUERY Return a query inside another query

-- 2.55
SELECT 
    W.WarehouseID,
    W.WarehouseCity,
    W.WarehouseState,
    I.SKU,
    I.SKU_Description,
    I.QuantityOnHand,
    I.QuantityOnOrder
FROM WAREHOUSE W
LEFT JOIN INVENTORY I
    ON W.WarehouseID = I.WarehouseID;
    
    
    -- 2.56
    
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2016

UNION

SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017;

-- 2.57
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2016
WHERE CatalogPage = 'Yes'

UNION

SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017
WHERE CatalogPage  = 'Yes';

-- 2.58
SELECT 
    C16.SKU,
    C16.SKU_Description,
    C16.Department
FROM CATALOG_SKU_2016 C16
INNER JOIN CATALOG_SKU_2017 C17
    ON C16.SKU = C17.SKU;
    
    -- 2.59
    
    SELECT 
    C16.SKU,
    C16.SKU_Description,
    C16.Department
FROM CATALOG_SKU_2016 C16
JOIN CATALOG_SKU_2017 C17
    ON C16.SKU = C17.SKU
WHERE C16.CatalogPage = 'Yes'
  AND C17.CatalogPage = 'Yes';
  
  -- 2.60
  SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2016
WHERE SKU NOT IN (
    SELECT SKU FROM CATALOG_SKU_2017
);


    
    




    



 










    
  





