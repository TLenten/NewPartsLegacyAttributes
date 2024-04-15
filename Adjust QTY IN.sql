--PartBin Adjust New Parts In   watch for leading zero in PartNum.  format adjustqty to numeric  

SELECT b.company,
       (CASE
            WHEN WarehouseCode IN ( 'second', 'site', 'warehouses') THEN
                'Site2'
            ELSE
                'MfgSys'
        END
       ) AS 'Plant',
       CONCAT('Prefix', b.partnum) AS PartNum,
       CASE
           WHEN OnhandQty >= 0 THEN
               OnhandQty
           ELSE
               0
       END AS 'AdjustQuantity',
       WarehouseCode AS 'WareHseCode',
       BinNum,
       'Misc' AS 'ReasonCode',
       'prefix qty in' AS 'Reference'
FROM erp.partbin b
    INNER JOIN part p
        ON p.company = b.company
           AND p.partnum = b.partnum

WHERE p.company = 'YourCompany'
      AND ISNUMERIC(p.partnum) = 1 -- Checking if 'partnum' is numeric      
      AND p.InActive = 0 -- Filtering out InActive Parts      
      AND p.classID != 'YourClass' -- Checking if 'classID' is not 'YourClass'      
      AND p.TrackSerialNum = 0 -- Filtering out serial tracked parts     
      AND p.prodcode in ( 'Your', 'Prod', 'Codes') -- Including specific ProdCode values     
      AND p.QtyBearing = 1
      AND p.OnHold = 0 --Filtering out Parts On Hold