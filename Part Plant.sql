--PartPlant    

select pp.company,
       pp.plant,
       primwhse,
       concat('Prefix', pp.partnum) as PartNum,
       minimumqty,
       maximumqty,
       pp.safetyqty,
       minorderqty,
       leadtime,
       VendorNum,
       backflush,
       mfglotsize,
       MinMfgLotSize,
       MaxMfgLotSize,
       mfglotmultiple,
       DaysOfSupply,
       ReOrderLevel,
       MRPRecalcNeeded,
       ProcessMRP,
       GenerateSugg,
       TransferPlant,
       SourceType,
       TransferLeadTime,
       pp.BuyerID,
       ReceiveTime,
       PlanTimeFence,
       ReschedOutDelta,
       ReschedInDelta,
       PersonID,
       pp.CostMethod
from PartPlant pp
    inner join part p
        on pp.company = p.company
           and pp.partnum = p.partnum
WHERE pp.company = 'YourCompany' -- Selecting records with Company equal to 'YourCompany'      
      and isnumeric(p.partnum) = 1 -- Ensuring that PartNum is numeric           
      and p.InActive = 0 -- Selecting active parts      
      and classID != 'YourClass' -- Excluding records with ClassID equal to 'YourClass'     
      and TrackSerialNum = 0 -- Selecting parts with TrackSerialNum equal to 0      
      and prodcode in ( 'Your', 'Prod', 'Codes' ) -- Including specific ProdCode values    