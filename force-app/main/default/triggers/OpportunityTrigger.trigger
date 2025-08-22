trigger OpportunityTrigger on Opportunity (before insert,after insert ,before update,after update,before delete,after delete){
    /*if(trigger.isafter && trigger.isinsert ){
        OpportunityTriggerHandler1.notifyclosedwon(trigger.new,Null);
    }*/
    if(trigger.isAfter && trigger.isupdate){

        OpportunityTriggerHandler1.notifyclosedwon(trigger.new,trigger.oldMap);
    }
 /*if(trigger.isbefore && trigger.isinsert)
 {
    
    }
if(trigger.isbefore && trigger.isupdate){
    
}*/
}