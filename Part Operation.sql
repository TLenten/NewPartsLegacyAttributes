--PartOpr     
SELECT o.Company,
       'MfgSys' AS 'Plant',
       concat('Prefix', o.PartNum) AS 'PartNum',
       'partchange' AS 'ECOGroupID',
       o.RevisionNum,
       o.OpCode,
       o.OprSeq,
       o.EstSetHours,
       o.EstProdHours,
       o.ProdStandard,
       o.StdFormat,
       o.StdBasis,
       o.OpsPerPart,
       o.QtyPer,
       o.Machines,
       o.SetUpCrewSize,
       o.ProdCrewSize,
       o.EstScrap,
       o.EstScrapType,
       o.SubContract,
       o.IUM,
       o.EstUnitCost,
       o.DaysOut,
       o.SubPartNum,
       o.VendorNum,
       o.CommentText,
       o.SchedRelation,
       left(o.RunQty, 4) AS 'RunQty',
       o.LaborEntryMethod,
       o.OpDesc,
       o.WeightUOM
FROM PartOpr o
    INNER JOIN partrev r
        ON o.Company = r.Company
           AND o.PartNum = r.PartNum
           AND o.RevisionNum = r.RevisionNum
           AND o.AltMethod = r.AltMethod
    INNER JOIN part p
        ON p.company = o.company
           AND p.partnum = o.partnum
WHERE 
    o.company = 'YourCompany' -- Filter by company 'YourCompany'
    AND ISNUMERIC(p.partnum) = 1 -- Check if partnum is numeric
    AND classID != 'YourClass' -- Exclude specific classID
    AND TrackSerialNum = 0 -- TrackSerialNum should be 0
    AND prodcode IN ('Your', 'Prod', 'Codes') -- Filter by specific prodcode values
    AND r.Approved = 1 -- Filter for approved part revisions
ORDER BY o.partnum
