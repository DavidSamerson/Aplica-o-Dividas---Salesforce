trigger Compras on Compras__c (
    before insert, 
    before update, 
    before delete, 
    after insert, 
    after update, 
    after delete, 
    after undelete) {

        if (Trigger.isBefore)
            if (Trigger.isUpdate)
                ComprasHandler.getInstance().beforeUpdate();
            else if (Trigger.isInsert)
                ComprasHandler.getInstance().beforeInsert();
            else
                ComprasHandler.getInstance().beforeDelete();
        else
            if (Trigger.isUpdate)
                ComprasHandler.getInstance().afterUpdate();
            else if (Trigger.isInsert)
                ComprasHandler.getInstance().afterInsert();
            else
                ComprasHandler.getInstance().afterDelete();
}