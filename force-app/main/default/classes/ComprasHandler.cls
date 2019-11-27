/**
 * @File Name          : ComprasHandler.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 25/10/2019 15:42:45
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    25/10/2019   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public with sharing class ComprasHandler implements TriggerHandlerInterface{
	private static final ComprasHandler instance = new ComprasHandler();
    private ComprasHandler() {}
    public static ComprasHandler getInstance() {
        return instance;
    }  
    
    public void beforeUpdate() {
      //EXEMPLO>>> MUDE OS NOMES OpportunityUtil.proposta((List<Opportunity>)Trigger.new, (Map<Id,Opportunity>)Trigger.oldMap);
      ComprasUtil.PreencheDataPagamento((List<Compras__c>)Trigger.new, (Map<Id,Compras__c>)Trigger.oldMap);
    }

    public void beforeInsert() {
      ComprasUtil.PreencheDataPagamento((List<Compras__c>)Trigger.new, (Map<Id,Compras__c>)Trigger.oldMap);
       
    }
    
    public void beforeDelete() {
    }
    
    public void afterUpdate() {
      
    }
    
    public void afterInsert()  {
        ComprasUtil.valorPorParcela((List<Compras__c>)Trigger.new, (Map<Id,Compras__c>)Trigger.oldMap);
    }

    public void afterDelete() {

    }


}