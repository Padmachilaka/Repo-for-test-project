trigger UpdatePrimaryContact on Contact (before insert,before update) {
	 Set<Id> accountIds = new Set<Id>();
 		for (Contact con : Trigger.new) {
 			if (con.Is_Primary__c) {
			 accountIds.add(con.AccountId);
		 }
 }
    List<Contact> existingContacts = [SELECT Id, AccountId, Lead_Source__c, Is_Primary__c FROM Contact WHERE AccountId IN :accountIds];
    Map<Id, List<Contact>> accountContactMap = new Map<Id, List<Contact>>();
       for (Contact con : existingContacts) {
         if (!accountContactMap.containsKey(con.AccountId)) {
 			accountContactMap.put(con.AccountId, new List<Contact>());
 			}
			 accountContactMap.get(con.AccountId).add(con);
 		}
 				for (Contact con : Trigger.new) {
 					if (con.Is_Primary__c) {
 						List<Contact> accountContacts = accountContactMap.get(con.AccountId);
							 for (Contact accCon : accountContacts) {
								 if (accCon.Id != con.Id && accCon.Lead_Source__c == con.Lead_Source__c && 
										accCon.Is_Primary__c) {
 										accCon.Is_Primary__c = false;
                                            
 									}
								 }
 								}
							 }
 		update existingContacts;

}