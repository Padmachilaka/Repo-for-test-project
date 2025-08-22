trigger CaseTrigger on Case (Before insert) {
     //Get the current records from the salesforce
    for(Case ca : Trigger.New)
    {
        if(ca.subject=='Support'){
            ca.Status='Working';
        }

    }
  }