/**
 * @NApiVersion 2.1
 * @NScriptType ClientScript
 */
define(['N/runtime', 'N/ui/dialog'], (runtime, dialog) => {

    const pageInit = (context) => {

        if (context.mode !== 'create') {
            return;
        }

        const currentUser = runtime.getCurrentUser();
        const targetRole = 1263; // RAYNER SSO - Credit Hold Order Change Override

        if (currentUser.role === targetRole) {
            dialog.alert({
                title: 'Important Customer Order Reminder',
                message: 'You are logged in with the Credit Hold Order Change Override role for processing this customer order.'
            });
        }
    };

    return {
        pageInit
    };
});