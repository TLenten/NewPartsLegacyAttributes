This procedure intends to create new part numbers using as many part attributes from existing parts as possible as changing part number is not practical or supported and most likely to result in a non functional system.
I used SSMS to extract the data and DMT to load it back into Epicor.


Main tables to extract, you might have other tables such as 
	CustXpart, 
	PartXRefVend,
	VendPBrk,
	PriceLstParts,
	PartSubs,
	UD Tables

This is also the load order:

PART
PART PLANT
PART WAREHOUSE
PART REVISION
PART COST
PART OPERATION
PARTMTL - Two Passes
	PARTMTL - CHILDREN (MtlPartNum)
	PARTMTL - PARENTS (PartNum)
PARTBIN QTY IN
PARTBIN QTY OUT
