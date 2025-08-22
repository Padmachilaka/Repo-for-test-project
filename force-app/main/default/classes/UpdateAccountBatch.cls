global class UpdateAccountBatch implements Database.Batchable<sObject>  

{ 

    global Database.QueryLocator start(Database.BatchableContext BC)  

    { 

        String query = 'SELECT Id,Name,Industry FROM Account'; 

         

        return Database.getQueryLocator(query); 

    } 

    global void execute(Database.BatchableContext BC, List<Account> scope)  

    { 

        for(Account a : scope) 

        { 

            a.Name = a.Name + 'Batch Job'; 

a.Description = 'Batch Job Update This Record '; 

        } 

        update scope; 

    } 

    global void finish(Database.BatchableContext BC) { 

    } 

}