SELECT
ar.custrecord_sas_ar_subsidiary as subsidiary,
s.name as subsidiary_name,
am.id as approval_rule_internal_id,
ar.name as approval_rule,
ar.BUILTIN.DF(custrecord_sas_ar_record_name) as record_name,
ar.custrecord_sas_ar_priority as priority,
BUILTIN.DF(custrecord_sas_am_approvertype) as approver_type,
CASE
    WHEN e.entityid LIKE 'EM%' THEN e.entityid || ' ' || e.firstname || ' ' || e.lastname
    ELSE e.entityid
END as approver,
am.custrecord_sas_am_minapprovalamount as Min_Approval_Amount,
am.custrecord_sas_am_maxapprovalamount as Max_Approval_Amount,
ss.name as saved_search_name,
ss.id as saved_search_internal_id

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

--and entityid = 'EM0230'
