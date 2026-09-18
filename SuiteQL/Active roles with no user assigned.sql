SELECT
    r.id AS role_id,
    r.name AS role_name,
    r.scriptid,
    r.type,
    r.isinactive
FROM
    Role r
WHERE
    r.isinactive = 'F'
    AND NOT EXISTS (
        SELECT 1
        FROM Employee e
        WHERE
            BUILTIN.MNFILTER(
                e.rolesforsearch,
                'MN_INCLUDE',
                '',
                'TRUE',
                r.id
            ) = 'T'
    )
ORDER BY
    r.name