SELECT
    Customer.EntityID AS Customer_Code,
    Customer.CompanyName AS Customer_Name,
    Transaction.TranID AS Invoice_Number,
    Transaction.Trandate AS Invoice_Date,
    BUILTIN.DF(TransactionLine.Item) AS Product_SKU,
    TransactionLine.Quantity AS Quantity,
    TransactionLine.Rate AS Item_Price,
    TransactionLine.NetAmount AS Total_Line_Price,
    BUILTIN.DF(Transaction.Currency) AS Currency

FROM
    Transaction

INNER JOIN
    TransactionLine
        ON TransactionLine.Transaction = Transaction.ID

INNER JOIN
    Customer
        ON Customer.ID = Transaction.Entity

WHERE
    Transaction.Type = 'CustInvc'

    AND Transaction.Trandate BETWEEN
        TO_DATE('2026-07-06', 'YYYY-MM-DD')
        AND TO_DATE('2026-08-31', 'YYYY-MM-DD')

    AND Customer.EntityID IN (
        'CU2831',
        'CU1744',
        'CU1764',
        'CU5995',
        'CU4676',
        'CU3379',
        'CU4490',
        'CU2839',
        'CU1751',
        'CU4069',
        'CU2056',
        'CU2825',
        'CU2826',
        'CU5684',
        'CU1756',
        'CU2059',
        'CU2047',
        'CU2991',
        'CU3055',
        'CU3879',
        'CU2032',
        'CU2773',
        'CU2064',
        'CU2834',
        'CU2833',
        'CU4213',
        'CU3751',
        'CU6324',
        'CU1749',
        'CU2069'
    )

    AND TransactionLine.MainLine = 'F'
    AND TransactionLine.TaxLine = 'F'
    AND TransactionLine.Item IS NOT NULL

ORDER BY
    Customer.EntityID,
    Transaction.Trandate DESC,
    Transaction.TranID;