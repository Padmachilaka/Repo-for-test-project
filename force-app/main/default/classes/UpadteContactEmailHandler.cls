public class UpadteContactEmailHandler {
      public static void updateContactEmailAddress(List<Account> lstNew, Map<Id,Account> mapOld){ 

        Set<Id> accIds = new Set<Id>(); 

         

          for(Account acc : lstNew){ 

            system.debug('===oldmap email==='+mapOld.get(acc.Id).Email_Account__c); 

            system.debug('===lstNew=email=='+acc.Email_Account__c); 

            if(acc.Email_Account__c != mapOld.get(acc.Id).Email_Account__c && acc.Email_Account__c !=null){             

                accIds.add(acc.Id); 

            } 

        } 

        system.debug('===accIds=='+accIds); 

        if(!accIds.isEmpty()){ 

            List<Contact> lstContact = [Select ID,  

                                    Account.Email_Account__c, 

                                    Email  

                                    FROM  

                                    Contact  

                                    where  

                                    AccountID IN :accIds];         

             

            List<Contact> lstUpdateCon = new List<Contact>(); 

            for(Contact con : lstContact){            

                if(con.Email != con.Account.Email_Account__c){ 

                    con.Email = con.Account.Email_Account__c; 

                    lstUpdateCon.add(con);  

                } 

                else{ 

                    con.Email =null;  

                    lstUpdateCon.add(con);  

                }            

            } 

            if(!lstUpdateCon.isEmpty()){ 

                update lstUpdateCon; 

            }         

        } 

    } 

}