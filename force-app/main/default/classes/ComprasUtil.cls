/**
 * @File Name          : ComprasUtil.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 30/10/2019 13:16:42
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    25/10/2019   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class ComprasUtil {
    public ComprasUtil() {}
    
    //public static void novoProjeto(List < Opportunity > newOpportunitysList, Map <Id, Opportunity > oldCasesMap){}
    public static void valorPorParcela(List <Compras__c> newComprasList, Map <Id, Compras__c> oldComprasMap){
        
        List <Compras__c> newCompra = new List<Compras__c>();
        
        for(Compras__c cc : newComprasList){
            if(cc.NumeroDeParcelas__c >= 2){
                
                for(integer i = 0; i < cc.NumeroDeParcelas__c; i++){
                    Compras__c compraParcela = new Compras__c();
                    compraParcela.CompraTOTAL__c = cc.Id;
                    compraParcela.Cartoes__c = cc.Cartoes__c;
                    compraParcela.Juros__c = cc.Juros__c;
                    compraParcela.Taxas__c = cc.Taxas__c;
                    compraParcela.IOF__c = cc.IOF__c;
                    compraParcela.Estabelecimento__c = cc.Estabelecimento__c;
                    compraParcela.Produto__c = cc.Produto__c;
                    compraParcela.Devedor__c = cc.Devedor__c;
                    compraParcela.Name = cc.Name + ' ' +(i + 1) +'/'+ cc.NumeroDeParcelas__c;
                    compraParcela.DataDaCompra__c = cc.DataDaCompra__c.addMonths(i + 1);
                    compraParcela.DataPagamento__c = cc.DataDaCompra__c.addMonths(i + 1);
                    compraParcela.ValorDaCompra__c = (cc.ValorDaCompra__c / cc.NumeroDeParcelas__c);
                    compraParcela.NumeroDeParcelas__c = 1;
                    compraParcela.LocalDaCompra__c = cc.LocalDaCompra__c;
                    compraParcela.TipoRegistro__c = 'ParcelaCompra';
                    compraParcela.NumeroParcelas__c = cc.NumeroDeParcelas__c;
                    compraParcela.ParcelaAtual__c = i + 1;
                    //if(compraParcela.Cartoes__c.contrains('nubank')){
                     //   Date data = new Date();
                     //   compraParcela.DataPagamento__c = cc.DataDaCompra__c.addMonths(i + 1);
                   // }
                    newCompra.add(compraParcela); 
                }      
                
            }
        }
        
        if(newCompra != null ){
            insert newCompra;
        }
    }
    
    //não funcionando ainda
    public static void PreencheDataPagamento(List <Compras__c> newComprasList, Map <Id, Compras__c> oldComprasMap){
       
        List<Compras__c> compras = new List<Compras__c>();

        for(Compras__c cc : newComprasList){

            if(cc.StatusDoPagamento__c == 'Pago'){
                cc.DataPagamento__c = Date.today();
            }
            else {
               cc.DataPagamento__c = null; 
            }
            
            compras.add(cc);
        }
        
        //upsert compras;
    }
    
}