public class MainBranch {
    public void method()
    {
        list<String> Name=new list<string>{'Jadeindiahyd','Jadeindiapune','wiproindiahyd','wiproindiapune','infosysindiahyd','infosysindiapune','infosysindiamumbai','infosysindiavizag','infosysindiabihar','infosysindiamah'};
        list<Account> acclist= new list<Account>(); 
		system.debug(Name);
        for(Integer i=0; i<Name.size();i++)
        {
            Account acc=New Account();
            acc.Name=Name[i];
            acc.Industry='Engineering';
            
            
             if(i==0)
            {
             acc.Main_Branch__c=True;
             }
            if(i==3)
            {
            acc.Main_Branch__c=True;
            }
           if(i==6)
            {
              acc.Main_Branch__c=True;
             }
        
            acclist.add(acc);
            
             system.debug(Name[i]);       
        }    
       insert acclist;
  }
}