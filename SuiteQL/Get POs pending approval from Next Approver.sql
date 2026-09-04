SELECT
    t.tranid,
    t.trandate,
    BUILTIN.DF(t.entity) as supplier,
    t.foreigntotal
FROM
    transaction AS t
INNER JOIN
    transactionLine AS tl
    ON t.id = tl.transaction
WHERE
    t.type = 'PurchOrd'
    AND t.status = 'PurchOrd:A'
    AND tl.subsidiary = 7
    AND t.nextapprover = 4109