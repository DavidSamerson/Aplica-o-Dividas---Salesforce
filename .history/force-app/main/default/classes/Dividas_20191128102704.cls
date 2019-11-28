/**
 * @File Name          : Dividas.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 28/11/2019 10:27:04
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    28/11/2019   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class Dividas {
    
    public ApexPages.StandardController stdCntrlr {get; set;}
    public List<Contact> devedores {get;set;}
    
    public Dividas(ApexPages.StandardController controller){
    	stdCntrlr = controller;
        devedores = getDevedores();
    }
   
	public static List<Contact> getDevedores(){
        List<Contact> contact = [SELECT id, Name, LastName FROM Contact];
        if(contact.size() > 0){
            return contact;
        } else {
            return null;
        }
    }
    

}