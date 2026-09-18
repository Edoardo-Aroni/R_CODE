SELECT
    r.id AS role_id,
    r.name AS role_name,
    r.scriptid,
    r.type,
    r.isinactive,
    COUNT(e.id) AS employee_count
FROM
    Role r
LEFT JOIN
    Employee e
    ON BUILTIN.MNFILTER(
        e.rolesforsearch,
        'MN_INCLUDE',
        '',
        'TRUE',
        r.id
    ) = 'T'
GROUP BY
    r.id,
    r.name,
    r.scriptid,
    r.type,
    r.isinactive
ORDER BY
    employee_count,
    r.name