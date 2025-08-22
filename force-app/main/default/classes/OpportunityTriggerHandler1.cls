public class OpportunityTriggerHandler1{
    //get current records from opportunity
    //get current records opportunityowner from opportunity
    //get current records serviceManager from Account
    //get email address for the opportunity
    // get email address for the service manager
    //prepare email for the opportunityowner and service Manager
    //send Email
    public static void notifyclosedwon(List<opportunity> opplist , Map<Id,opportunity> oldMap)
    {
        Set<Id> oppIds =  new Set<Id>();
        for(opportunity opp :opplist)
        {
             if(opp.stageName == 'Closed Won' && opp.stageName != oldMap.get(opp.Id).stageName)
            {
                oppIds.add(opp.Id);
                System.debug('Add to Ids');
            }
        }
    
    
        if(oppIds.size() > 0){
            System.debug('Send oppor');
        List<opportunity>  opportunities  = [SELECT Id ,Name,owner.email,Account.Service_Manager__c From Opportunity WHERE Id In :oppIds];
       List<messaging.SingleEmailMessage>emails = new List<messaging.SingleEmailMessage>();
            for(opportunity o : opportunities){
               Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new List<String> {o.Account.Service_Manager__r.email,o.owner.email});
                email.setSubject('opportunity' +o.Name + 'closed Won');
                email.setPlainTextBody('The opportunity' + o.Name +'has been Closed Won.Congratulations!');  
                emails.add(email);
        
         
            }
            Messaging.sendEmail(emails);
        }
}
}