trigger CreateContactOnMediaAccount on Account (After insert, After update) {
     List<Contact> contactsToInsert = new List<Contact>();

    for(Account acc : Trigger.new) {
        if (acc.Industry == 'Media') {
            Contact c = new Contact();
            c.Email='test@gmail.com';
            c.FirstName = 'Padma1';
            c.LastName = 'Chilaka1';
            c.AccountId = acc.Id;
            contactsToInsert.add(c);
            
        }
    }
    try{
    insert contactsToInsert;
    }
    catch(Exception e){
    System.debug('Error >> '+ e.getMessage());
    }

}