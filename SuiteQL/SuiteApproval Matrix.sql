SELECT
    ar.custrecord_sas_ar_subsidiary AS subsidiary,
    s.name AS subsidiary_name,
    ar.id AS approval_rule_internal_id,
    ar.name AS approval_rule,
    BUILTIN.DF(ar.custrecord_sas_ar_record_name) AS record_name,
    ar.custrecord_sas_ar_priority AS priority,

    ar.custrecord_sas_ar_generallimit AS record_amount_limit,

    BUILTIN.DF(am.custrecord_sas_am_approvertype) AS approver_type,

    CASE
        WHEN e.entityid LIKE 'EM%'
        THEN e.entityid || ' ' || e.firstname || ' ' || e.lastname
        ELSE e.entityid
    END AS approver,

    am.custrecord_sas_am_minapprovalamount AS min_approval_amount,
    am.custrecord_sas_am_maxapprovalamount AS max_approval_amount,

    ss.name AS saved_search_name,
    ss.id AS saved_search_internal_id

FROM CUSTOMRECORD_SAS_APPROVALMATRIX am

JOIN CUSTOMRECORD_SAS_APPROVALRULE ar
    ON ar.id = am.custrecord_sas_am_approvalrule

JOIN SUBSIDIARY s
    ON s.id = ar.custrecord_sas_ar_subsidiary

JOIN SavedSearch ss
    ON ss.id = ar.custrecord_sas_ar_savedsearchfilter

LEFT JOIN employee e
    ON e.id = am.custrecord_sas_am_approver

WHERE am.isinactive = 'F'
AND BUILTIN.DF(ar.custrecord_sas_ar_record_name) = 'Purchase Order'

--ORDER BY subsidiary, priority, record_name, Min_Approval_Amount

--and entityid = 'EM216'