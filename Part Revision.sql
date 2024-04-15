--PartRev
SELECT r.company,
       CONCAT('Prefix', r.partnum) AS 'PartNum',
       r.RevisionNum,
       r.RevShortDesc,
       r.RevDescription,
       r.Approved,
       r.ApprovedBy,
       r.DrawNum,
       r.ECO,
       r.Method,
       r.AutoRecOpr,
       r.FinalOpr,
       r.EffectiveDate,
       'Prefix' AS 'PartAudit#ChangeDescription'
FROM PartRev r
    INNER JOIN Part p
        ON r.company = p.company
           AND r.partnum = p.partnum
WHERE r.company = 'YourCompany' -- Selecting records with Company equal to 'YourCompany'   
      AND ISNUMERIC(p.partnum) = 1 -- Ensuring that PartNum is numeric   
      AND p.InActive = 0 -- Selecting active parts   
      AND p.classID != 'YourClass' -- Excluding records with ClassID equal to 'YourClass'   
      AND p.TrackSerialNum = 0 -- Selecting parts with TrackSerialNum equal to 0   
      AND prodcode in ('Your', 'Prod', 'Codes') -- Including specific ProdCode values  
      AND r.Approved = 1 -- Selecting approved revisions
ORDER BY 'PartNum'