--Part Warehouse     

SELECT w.Company,
       CONCAT('Prefix', p.PartNum) as 'PartNum',
       (CASE
            WHEN WarehouseCode IN ( 'Specific', 'Warehouse' ) THEN
                'Site2'
            ELSE
                'MfgSys'
        END
       ) AS 'Plant',
       UPPER(w.WarehouseCode) AS 'WarehouseCode'
FROM erp.partwhse w
    INNER JOIN part p
        ON w.company = p.company
           AND w.partnum = p.partnum

WHERE w.company = 'YourCompany' -- Selecting records with Company equal to 'YourCompany'       
      AND isnumeric(p.partnum) = 1 -- Ensuring that PartNum is numeric          
      AND InActive = 0 -- Selecting active parts       
      AND classID != 'YourClass' -- Excluding records with ClassID equal to 'YourClass'       
      AND TrackSerialNum = 0 -- Selecting parts with TrackSerialNum equal to 0       
      AND prodcode IN ( 'Your', 'Prod', 'Codes' ) -- Including specific ProdCode values    

ORDER BY p.partnum