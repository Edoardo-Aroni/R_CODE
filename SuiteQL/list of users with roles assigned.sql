SELECT
    e.id AS employee_id,
    e.entityid AS employee,
    e.email,
    r.id AS role_id,
    r.name AS role_name
FROM
    Employee e
CROSS JOIN
    Role r
WHERE
    BUILTIN.MNFILTER(
        e.rolesforsearch,
        'MN_INCLUDE',
        '',
        'TRUE',
        r.id
    ) = 'T'
ORDER BY
    e.entityid,
    r.name