--Partmtl Parents     

SELECT m.company,
       'MfgSys' AS 'Plant',
       CASE
           WHEN p.TrackSerialNum <> 1 THEN
               CONCAT('Prefix', m.partnum)
           ELSE
               m.partnum
       END AS 'PartNum',
       m.revisionnum,
       'Prefix' AS 'ECOGroupID',
       m.MtlSeq,
       CASE
           WHEN ISNUMERIC(m.MtlPartNum) = 1 THEN
               CONCAT('Prefix', m.mtlpartnum)
           ELSE
               m.mtlpartnum
       END AS 'MtlPartNum',
       m.QtyPer,
       --, m.FixedQty      
       --, m.RelatedOperation       
       --, m.EstScrap      
       --, m.EstScrapType      
       m.PullAsAsm,
       m.ViewAsAsm,
       --, m.PlanAsASM      
       'Prefix' AS 'AuditText'

FROM PartMtl m
    INNER JOIN Part p
        ON p.company = m.company
           AND p.partnum = m.partnum --Parent parts     
    INNER JOIN Part p2
        ON p2.company = m.company
           AND p2.partnum = m.mtlpartnum --Child parts    
    INNER JOIN partrev r
        ON m.company = r.company
           AND m.PartNum = r.PartNum
           AND m.RevisionNum = r.RevisionNum
           AND m.AltMethod = r.AltMethod
WHERE m.company = 'YourCompany'
      AND TRY_CAST(m.partnum AS INT) IS NOT NULL --Filtering for numeric parent    
      AND p.InActive = 0 --Active Parent    
      AND p2.InActive = 0 --Active Child   
      AND p.classID != 'YourClass'
      AND p.TrackSerialNum = 0
      AND p.prodcode IN ( 'Your', 'Prod', 'Codes') -- Including specific ProdCode values          
      AND r.Approved = 1 --Filtering for approved parent       
ORDER BY p.trackserialnum,
         Partnum,
         RevisionNum