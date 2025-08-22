public class DtabaseUpset {
    public void upsertMethod()

{

List<Account> acclist=new List<Account>();

for( Account acc1:[Select Id,Name,Rating From Account Where Name='Test1'])

{

acc1.Rating='Cold';

acclist.add(acc1);

}

Database.UpsertResult[] sr= Database.Upsert(acclist,false);

for(Database.UpsertResult dsr:sr)

{

if(dsr.isSuccess())

{

System.debug('Record inserted sucessfully ID ::'+dsr.getId());

}

else

{

for(Database.Error err : dsr.getErrors())

{

System.debug('The following error has occurred.');

System.debug(err.getStatusCode() + ': ' + err.getMessage());

System.debug('Contact fields that affected this error: ' + err.getFields());

}

}

}

}

}