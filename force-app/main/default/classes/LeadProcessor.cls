public without sharing class LeadProcessor implements Database.Batchable<sObject> {
    public Integer recordcount = 0;
    
    public database.QueryLocator start(Database.BatchableContext dbc){
        return Database.getQueryLocator([SELECT Id,Name FROM Lead]);
    }
    public void execute(Database.BatchableContext dbc , List<Lead> leads){
        for(Lead l : leads){
            l.LeadSource = 'DreamForce';
        }
        update leads;
        recordcount = recordcount + leads.size(); 
    }
    public void finish(Database.BatchableContext dbc){
        system.debug('Total records processed' + recordcount);
    }
}