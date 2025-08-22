public  without sharing class AccountEmailTem 

{ 

    public Id accountId {get;set;} 

     

    @TestVisible 

    public List<Contact> getContactList() 

    { 

        List<Contact> conList; 

         conList = [SELECT FirstName, LastName, Email, Phone, Title,Account.name FROM Contact WHERE AccountId =: accountId ]; 

 

        return conList; 

    } 

}