This procedure intends to create new part numbers using as many part attributes from existing parts as possible. Changing part number is not practical or supported and most likely to result in a non functional system.
Original scope was numeric only non-serial tracked parts. This expanded to a few product groups of alphanumeric parts and some serial tracked children parts in Bill of Materials. 
I used SSMS to extract the data and DMT to load it back into Epicor.


DMT Load order:

PART
PART PLANT
PART WAREHOUSE
PART REVISION
PART COST
BILL OF OPERATIONS
BILL OF MATERIALS - Two Passes
	PARTMTL - CHILDREN (MtlPartNum)
	PARTMTL - PARENTS (PartNum)
QUANTITY ADJUSTMENT
	PARTBIN QTY IN
	PARTBIN QTY OUT


You might have other tables to consider, such as 
	CustXpart 
		DMT - Cust Part X Ref 
	PartXRefVend
		DMT - Supplier Part
	VendPBrk
		DMT -Supplier Price List
	PriceLstParts
		DMT -Price List Part
	PartSubs,
		DMT - Alternate Part
	UD Tables
		DMT - UD**
