/**
 * @NApiVersion 2.x
 * @NScriptType WorkflowActionScript
 */
define(['N/search'], function(search) {
    function onAction(scriptContext) {
        var newRecord = scriptContext.newRecord;
        var creditDetails = [];

        var creditSearch = search.load({ id: 'customsearch_payment_credits_search' });
        
        // Target the Bill's paying transaction link to isolate this vendor payment event
        creditSearch.filters.push(search.createFilter({
            name: 'payingtransaction',
            operator: search.Operator.ANYOF,
            values: newRecord.id
        }));

        creditSearch.run().each(function(result) {
            var columns = result.columns;
            
            var billNum = '';
            var pcnNum = '';
            var pcnAmount = '';
            var pcnDate = '';

            for (var i = 0; i < columns.length; i++) {
                // 1. Parent Vendor Bill Number (Grouped)
                if (columns[i].name === 'tranid' && columns[i].join === null) {
                    billNum = result.getValue(columns[i]);
                // 2. Child Purchase Credit Note Number (Grouped)
                } else if (columns[i].name === 'tranid' && columns[i].join === 'applyingtransaction') {
                    pcnNum = result.getValue(columns[i]);
                // 3. Exact Split Amount Applied (Summed)
                } else if (columns[i].name === 'amount' && columns[i].join === 'applyingtransaction') {
                    pcnAmount = result.getValue(columns[i]);
                // 4. Purchase Credit Note Date (Grouped)
                } else if (columns[i].name === 'trandate' && columns[i].join === 'applyingtransaction') {
                    pcnDate = result.getValue(columns[i]);
                }
            }

            creditDetails.push({
                invoice: billNum, // Maps to 'invoice' key to keep PDF Freemarker logic consistent
                creditMemo: pcnNum,
                amount: Math.abs(parseFloat(pcnAmount)), // Kept absolute for clean PDF layout
                date: pcnDate
            });
            return true;
        });

        return JSON.stringify(creditDetails);
    }
    return { onAction: onAction };
});
