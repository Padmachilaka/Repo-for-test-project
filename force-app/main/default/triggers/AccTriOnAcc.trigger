trigger AccTriOnAcc on Account (after insert) 
{
   List<Contact> newContacts = new List<Contact>();
      for (Account acc : Trigger.new) 
      {
    if (acc.Industry == 'Media') 
    {
     Contact newContact = new Contact();
      newContact.LastName = acc.Name + ' Contact';
      newContact.AccountId = acc.Id;
      newContacts.add(newContact);
     }
   }
  if (newContacts.size() > 0)
  {
  insert newContacts;
  }
}