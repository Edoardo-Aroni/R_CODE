SELECT
	SalesOrder.ID AS SalesOrder,
	SalesOrder.TranID AS SalesOrderID,	
	Fulfillment.ID AS Fulfillment,
	Fulfillment.TranID AS FulfillmentID,
	Fulfillment.Status AS FulfillmentStatus,
	REPLACE( BUILTIN.DF( Fulfillment.Status ), 'Item Fulfillment : ', '' ) AS FulfillmentStatusName,
	FulfillmentLine.Item AS FulfillmentItem,
	BUILTIN.DF( FulfillmentLine.Item ) AS FulfillmentItemID,
	( FulfillmentLine.Quantity * -1 ) AS FulfillmentQuantity,
	BUILTIN.DF( InventoryAssignment.InventoryNumber ) AS AssignedInventoryNumber,
	( InventoryAssignment.Quantity * -1 ) AS AssignedQuantity
FROM
	Transaction AS SalesOrder 
	INNER JOIN TransactionLine AS SalesOrderLine ON
		( SalesOrderLine.Transaction = SalesOrder.ID )	
	INNER JOIN NextTransactionLineLink AS NTLL ON
		( NTLL.PreviousDoc = SalesOrderLine.Transaction )
		AND ( NTLL.PreviousLine = SalesOrderLine.ID )
		AND ( NTLL.LinkType = 'ShipRcpt' )
	INNER JOIN Transaction AS Fulfillment ON
		( Fulfillment.ID = NTLL.NextDoc )
	INNER JOIN TransactionLine AS FulfillmentLine ON
		( FulfillmentLine.Transaction = NTLL.NextDoc )
		AND ( FulfillmentLine.ID = NTLL.NextLine )
	INNER JOIN Item AS FulfillmenItem ON
		( FulfillmenItem.ID = FulfillmentLine.Item )
	LEFT OUTER JOIN InventoryAssignment ON
		( InventoryAssignment.Transaction = FulfillmentLine.Transaction )
		AND ( InventoryAssignment.TransactionLine = FulfillmentLine.ID )
	LEFT OUTER JOIN InventoryNumber ON
		( InventoryNumber.ID = InventoryAssignment.InventoryNumber )
WHERE
	( SalesOrder.Type = 'SalesOrd' )
	AND ( SalesOrder.TranID = 'COUK92619' )