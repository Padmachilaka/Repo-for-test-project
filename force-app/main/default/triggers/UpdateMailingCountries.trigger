//16. Show comma separated unique mailing countries from Contacts on related custom field on account.
trigger UpdateMailingCountries on Contact (after insert,after update) {
Set<Id> accountIds = new Set<Id>();
 for (Contact con : Trigger.new) {
 accountIds.add(con.AccountId);
 }
 List<Account> accounts = [SELECT Id,Mailing_country__c FROM Account WHERE Id IN :accountIds];
 Map<Id, Set<String>> countrySets = new Map<Id, Set<String>>();
 for (Contact con : [SELECT AccountId,MailingCountry FROM Contact WHERE AccountId IN :accountIds]) {
 if (!countrySets.containsKey(con.AccountId)) {
 countrySets.put(con.AccountId, new Set<String>());
 }
 countrySets.get(con.AccountId).add(con.MailingCountry);
 }
 for (Account acc : accounts) {
 acc.Mailing_country__c = String.join(new List<String>(countrySets.get(acc.Id)), ',');
 }
 update accounts;
}