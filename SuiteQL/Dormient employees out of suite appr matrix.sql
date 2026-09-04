SELECT
    e.id AS internalid,
    e.entityid,
    BUILTIN.DF(e.id) AS employee_name,
    e.email,
    MAX(lat.date) AS last_login_date
FROM
    employee e
LEFT JOIN
    LoginAudit lat
        ON lat.user = e.id
WHERE
    e.isinactive = 'F'
    AND e.giveaccess = 'T'
    AND NOT EXISTS (
        SELECT 1
        FROM CUSTOMRECORD_SAS_APPROVALMATRIX am
        WHERE am.custrecord_sas_am_approver = e.id
    )
GROUP BY
    e.id,
    e.entityid,
    BUILTIN.DF(e.id),
    e.email
HAVING
    MAX(lat.date) < ADD_MONTHS(CURRENT_DATE, -6)
ORDER BY
    last_login_date;