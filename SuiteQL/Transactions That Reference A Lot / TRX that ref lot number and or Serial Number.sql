SELECT
	InventoryNumber.Item,
	BUILTIN.DF( InventoryNumber.Item ) AS ItemID,
	InventoryNumber.InventoryNumber,
	Transaction.ID AS Transaction,
	Transaction.Type AS TransactionType,
	Transaction.TranID AS TransactionID,
	Transaction.TranDate AS TransactionDate,
	BUILTIN.DF( Transaction.Entity ) AS TransactionEntity,
	Transaction.OtherRefNum,
	InventoryAssignment.Quantity
FROM
	InventoryNumber
	INNER JOIN InventoryAssignment ON
		( InventoryAssignment.InventoryNumber = InventoryNumber.ID )
	INNER JOIN Transaction ON
		( Transaction.ID = InventoryAssignment.Transaction )
WHERE
	( InventoryNumber.Item = 20016 )
	AND ( InventoryNumber.InventoryNumber = '3720726' )