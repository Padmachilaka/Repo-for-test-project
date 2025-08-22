Global class  CreateContactFromEmail implements Messaging.InboundEmailHandler{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String subToCompare = 'Create Contact';
        
        //CREATE Contact
        if(email.subject.equalsIgnoreCase(subToCompare))
        {
            
            Contact c = new Contact();
            c.LastName =email.fromAddress;
            c.Email = email.fromAddress;
            c.Description = email.fromName;
            system.debug( c.LastName);
            system.debug( c.Email);
            system.debug(c.Description);
            insert c;
             system.debug('Successfully inserted Contact>>> '+ c.Id);
            //save the attachments if any
            system.debug('Test email attachemetns size text '+email.textAttachments);
            system.debug('Test email attachemetns size binary '+ email.binaryAttachments);
            if(email.binaryAttachments!=null ){
                system.debug('Successfully inserted1');
                for (Messaging.InboundEmail.binaryAttachment tAttachment : email.binaryAttachments){
                    Attachment attachment = new Attachment();
                     system.debug('Successfully inserted Attachments 2');
                    attachment.Name =  tAttachment.fileName;
                    attachment.Body =tAttachment.body;
                    attachment.ParentId =c.Id;
                    insert attachment;
                }
            }  
                
        }
        result.success = true;
        return result;
    }
}