/**
 * @File Name          : Dividas.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 28/11/2019 10:22:01
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    28/11/2019   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class Dividas {
    
    public ApexPages.StandardController stdCntrlr {get; set;}
    public List<Contact> devedores {get;set;}
    
    public Dividas(ApexPages.StandardController controller){
    	stdCntrlr = controller;
    }
   
	public static List<Contact> getDevedores(){
        return [SELECT id, Name, LastName FROM Contact];
    }
    

}