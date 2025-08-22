trigger AccountName on Account (before insert,before update) {
     for (Account acc : Trigger.New) { 

        if(acc.Name == 'Padma') {    

            acc.AddError('Padma is not allowed for Account Creations'); 

        } 

    } 

}