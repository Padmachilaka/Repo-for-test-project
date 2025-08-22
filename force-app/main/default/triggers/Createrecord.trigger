trigger Createrecord on Account (after insert) {
List <Contact> cntLst = new List<Contact>();
  
        for(Account acc: Trigger.New)
        {
            if(acc.Amount__c > 1000){
            Contact cnt = new Contact();
            cnt.LastName = ''+ acc.name;
             cnt.AccountId=acc.id;
            cntLst.Add(cnt);
         }
             insert cntLst;
 
        }
   

}