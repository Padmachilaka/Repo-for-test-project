trigger AccountTrigger on Account (after update) {
    List<Messaging.SingleEmailMessage> listSingleEmailMessage = new List<Messaging.SingleEmailMessage>();

    List<Account> updatedAccounts = new List<Account>();
    for (Account acc : Trigger.new) {
        if (acc.Check_Box__c == true) {
             updatedAccounts.add(acc);
             System.debug('Email Template' +updatedAccounts);
        }
    }
    if (updatedAccounts.size() > 0) {
        
        List<Account> accs=[SELECT Id, OwnerId,Owner.Email FROM Account WHERE Id IN :updatedAccounts];
         EmailTemplate emailTemplate = [Select Id,DeveloperName,Body from EmailTemplate where name = 'Distributor Partner Email notification'];
         System.debug('Email Template' +emailTemplate.id);

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for (Account accIds : accs) {
          Messaging.SingleEmailMessage objSingleEmailMessage = Messaging.renderStoredEmailTemplate(emailTemplate.Id, null, accIds.Id);  
           List<String> listToAddresses = new List<String>();
                listToAddresses.add(accIds.Owner.Email);
                objSingleEmailMessage.setToAddresses(listToAddresses); 
                
                listSingleEmailMessage.add(objSingleEmailMessage);
              }
            if(listSingleEmailMessage.size()>0)
                System.debug('Size > 0');   
                
                Messaging.sendEmail(listSingleEmailMessage);
         
             System.debug('Email Sent');
       
        }
        
       
    
}