--PartCost    

SELECT c.Company,
       'MfgSys' AS 'Plant',
       concat('Prefix', c.PartNum) AS 'PartNum', -- Creating a new 'PartNum' by concatenating 'Prefix' with the original 'PartNum'                       
       AvgLaborCost AS 'AvgLbrUnitCost',
       AvgBurdenCost AS 'AvgBurUnitCost',
       AvgMaterialCost AS 'AvgMtlUnitCost',
       AvgSubContCost AS 'AvgSubUnitCost',
       AvgMtlBurCost AS 'AvgMatBurUnitCost',
       StdLaborCost AS 'StdLbrUnitCost',
       StdBurdenCost AS 'StdBurUnitCost',
       StdMaterialCost AS 'StdMtlUnitCost',
       StdSubContCost AS 'StdSubUnitCost',
       StdMtlBurCost AS 'StdMatBurUnitCost',
       LastLaborCost AS 'LastLbrUnitCost',
       LastBurdenCost AS 'LastBurUnitCost',
       LastMaterialCost AS 'LastMtlUnitCost',
       LastSubContCost AS 'LastSubUnitCost',
       LastMtlBurCost AS 'LastMatBurUnitCost',
       'Misc' AS 'ReasonCode',               -- Hardcoding values for 'ReasonCode', and 'Reference' columns       
       'prefix cost load' AS 'Reference'  -- Joining the 'partcost' table with the 'part' table based on company and partnum       

FROM partcost c
    INNER JOIN part p
        ON c.company = p.company
           AND c.partnum = p.partnum
           
WHERE p.company = 'YourCompany' -- Selecting records with Company equal to 'YourCompany' 
      AND ISNUMERIC(p.partnum) = 1 -- Checking if 'partnum' is numeric           
      AND classID != 'YourClass' -- Checking if 'classID' is not 'YourClass'       
      AND TrackSerialNum = 0 -- Checking if 'TrackSerialNum' is 0       
      AND prodcode in ( 'Your', 'Prod', 'Codes') -- Including specific ProdCode values    
      AND (
              AvgLaborCost != 0
              OR AvgBurdenCost != 0
              OR AvgMaterialCost != 0
              OR AvgSubContCost != 0
              OR AvgMtlBurCost != 0
              OR StdLaborCost != 0
              OR StdBurdenCost != 0
              OR StdMaterialCost != 0
              OR StdSubContCost != 0
              OR StdMtlBurCost != 0
              OR LastLaborCost != 0
              OR LastBurdenCost != 0
              OR LastMaterialCost != 0
              OR LastSubContCost != 0
              OR LastMtlBurCost != 0
          )
