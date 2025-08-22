public  without sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> accounts = [SELECT Id,(SELECT Id FROM contacts) FROM Account Where Id IN :accountIds];
        for(Account acc : accounts) {
            acc.Number_Of_Contacts__c= acc.Contacts.size();
        }
        update accounts;
    }

}