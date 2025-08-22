global class CreateLeadFromEmail implements Messaging.InboundEmailHandler{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String subToCompare = 'Create Lead';
        
        //CREATE LEAD
        if(email.subject.equalsIgnoreCase(subToCompare))
        {
            
            Lead l = new Lead();
            l.LastName = email.fromName;
            l.Email = email.fromAddress;
            l.Company = email.fromName;
            system.debug( l.LastName);
            system.debug( l.Email);
            system.debug( l.Company);
            insert l;
             system.debug('Successfully inserted lead');
            //save the attachments if any
            system.debug('Test email attachemetns size text '+email.textAttachments);
            system.debug('Test email attachemetns size binary '+ email.binaryAttachments);
            if(email.binaryAttachments!=null ){
                system.debug('Successfully inserted1');
                for (Messaging.InboundEmail.BinaryAttachment tAttachment : email.binaryAttachments){
                    Attachment attachment = new Attachment();
                     system.debug('Successfully inserted Attachments2');
                    attachment.Name =  tAttachment.fileName;
                    attachment.Body = tAttachment.body;
                    attachment.ParentId =l.Id;
                    insert attachment;
                }
                
                
            }
           /* if(email.binaryAttachments!=null){
                system.debug('Succsfully inserted');
                for(Messaging.InboundEmail.binaryAttachment bAttachment: email.binaryAttachments){
                    Attachment attachment = new Attachment();
                    system.debug('successfully inserted');
                     attachment.Name=bAttachment.fileName;
                     attachment.Body = Blob.valueOf(bAttachment.body);
                     attachment.ParentId =l.Id;
                    insert attachment;
                    
                }
            }*/
            
        }
        result.success = true;
        return result;
    }
}