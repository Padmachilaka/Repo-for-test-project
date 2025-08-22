trigger contactcounts on Contact (after insert,after update,before delete) {
    //scenario:Display the count of contacts on account
    //object:contact
    //context:after insert,after update,before delete
    //insert:contact-account id---allcontacts
    //update:contact--old accountid new accountid-old accountid,new accountid--all contacts
    //delete:old accountid--all contacts
    //account-custom field to store count of contacts

}