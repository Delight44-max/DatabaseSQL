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
select SKU_Description, SKU
from INVENTORY WHERE QuantityOnHand BETWEEN 1 and 10;




