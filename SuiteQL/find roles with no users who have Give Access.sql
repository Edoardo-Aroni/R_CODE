SELECT
    r.id AS role_id,
    r.name AS role_name,
    r.scriptid,
    r.type,
    r.isinactive AS role_inactive,

    COUNT(e.id) AS total_employees,

    SUM(
        CASE
            WHEN e.giveaccess = 'T' THEN 1
            ELSE 0
        END
    ) AS employees_with_access,

    SUM(
        CASE
            WHEN e.giveaccess = 'F' THEN 1
            ELSE 0
        END
    ) AS employees_without_access

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

HAVING
    SUM(
        CASE
            WHEN e.giveaccess = 'T' THEN 1
            ELSE 0
        END
    ) = 0

ORDER BY
    r.name