trigger CompleteTasks on Opportunity (After insert) {
    List<Task> tasks = new List<Task>();
 for (Opportunity opp : Trigger.new) {
 if (opp.LeadSource != null) {
 // Create email task
 Task emailTask = new Task(Subject = 'Email', WhatId = opp.Id);
 tasks.add(emailTask);
 }
 if (opp.Type != null) {
 // Create call task
 Task callTask = new Task(Subject = 'Call', WhatId = opp.Id);
 tasks.add(callTask);
 }
 }
 if(!tasks.isEmpty()){
 insert tasks;
 }
 for (Opportunity opp : Trigger.new) {
 if (opp.LeadSource != null) {
 // Find email task and update status to complete
 Task emailTask = [SELECT Id FROM Task WHERE WhatId = :opp.Id AND Subject = 'Email'];
 emailTask.Status = 'Completed';
 update emailTask;
 }
 if (opp.Type != null) {
 // Find call task and update status to complete
 Task callTask = [SELECT Id FROM Task WHERE WhatId = :opp.Id AND Subject = 'Call'];
 callTask.Status = 'Completed';
 update callTask;
 }
 }


}