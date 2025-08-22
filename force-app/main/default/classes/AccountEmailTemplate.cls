public without sharing class AccountEmailTemplate {
    public Id accountId {get;set;}
        
    @TestVisible
    public List<Contact> getContactList()
    {
       
        List<Contact> ConList;
       
        ConList = [SELECT FirstName ,LastName,Email,Phone,Title,Account.Name From Contact WHERE AccountId=:accountId AND Leadsource='Web' ];
        return ConList;
        
    }
}