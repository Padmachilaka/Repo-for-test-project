trigger RestrictTopCases on Case (before insert,before update) {
Set<Id> accountIds = new Set<Id>();
 for (Case c : Trigger.new) {
 if (c.AccountId != null) {
 accountIds.add(c.AccountId);
 }
 }
 Map<Id, Integer> topCaseCounts = new Map<Id, Integer>();
 for (AggregateResult ar : [SELECT AccountId, COUNT(Id) cnt FROM Case WHERE Top_Case__c  = true 
AND AccountId IN :accountIds GROUP BY AccountId]) {
 topCaseCounts.put((Id) ar.get('AccountId'), (Integer) ar.get('cnt'));
 }
 for (Case c : Trigger.new) {
 if (c.Top_Case__c  && topCaseCounts.get(c.AccountId) >= 2) {
 c.Top_Case__c .addError('You can only have 2 Top Cases per Account');
 }
 }
}