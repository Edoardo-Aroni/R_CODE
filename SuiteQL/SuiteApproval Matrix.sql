SELECT 
am.id as approval_rule_internal_id,
BUILTIN.DF(custrecord_sas_am_approvalrule) as approval_rule,
CASE
    WHEN BUILTIN.DF(custrecord_sas_am_approvalrule) LIKE '%Expense%' THEN 'Expense Report'
	WHEN BUILTIN.DF(custrecord_sas_am_approvalrule) LIKE '%Journals%' THEN 'Journal'
	ELSE 'Purchase Order'
END as record_name,
BUILTIN.DF(custrecord_sas_am_approvertype) as approver_type,
CASE
    WHEN e.entityid LIKE 'EM%' THEN e.entityid || ' ' || e.firstname || ' ' || e.lastname
    ELSE e.entityid
END as approver,
am.custrecord_sas_am_minapprovalamount as Min_Approval_Amount,
am.custrecord_sas_am_maxapprovalamount as Max_Approval_Amount
FROM CUSTOMRECORD_SAS_APPROVALMATRIX am
left JOIN employee e
ON e.id = am.custrecord_sas_am_approver
WHERE am.isinactive = 'F'
and CASE
    WHEN BUILTIN.DF(custrecord_sas_am_approvalrule) LIKE '%Expense%' THEN 'Expense Report'
	WHEN BUILTIN.DF(custrecord_sas_am_approvalrule) LIKE '%Journals%' THEN 'Journal'
	ELSE 'Purchase Order'
END = 'Purchase Order'

--and entityid = 'EM0230'