--PartBin Adjust Legacy Out    watch for leading zero in PartNum.  format adjustqty to numeric   

SELECT b.company,
       (CASE
            WHEN WarehouseCode IN ( 'second', 'site', 'warehouses' ) THEN
                'Site2'
            ELSE
                'MfgSys'
        END
       ) AS 'Plant',
       b.PartNum,
       CASE
           WHEN OnhandQty <= 0 THEN
               0
           ELSE
       (OnhandQty * -1)
       END AS 'AdjustQuantity',
       WarehouseCode AS 'WareHseCode',
       BinNum,
       'Misc' AS 'ReasonCode',
       'prefix qty out' AS 'Reference'

FROM erp.partbin b
    INNER JOIN part p
        ON p.company = b.company
           AND p.partnum = b.partnum

WHERE p.company = 'YourCompany'
      AND ISNUMERIC(p.partnum) = 1 -- Checking if 'partnum' is numeric          
      AND p.InActive = 0 -- Filtering out InActive Parts        
      AND p.classID != 'YourClass' -- Checking if 'classID' is not 'YourClass'         
      AND p.TrackSerialNum = 0 -- Filtering out serial tracked parts         
      and p.prodcode in ( 'Your', 'Prod', 'Codes') -- Including specific ProdCode values        
      and p.QtyBearing = 1
      and p.OnHold = 0 --Filtering out On Hold Parts

ORDER BY AdjustQuantity DESC