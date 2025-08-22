public class Databaseupdate {
    public void updateMethod()

{

List<Contact> con=new List<Contact>();

for(Contact conlist:[Select Name,Id,Phone,Email From Contact where Name Like 'Test Contact' ])

{

conlist.Phone='123';

conlist.Email='padma@jadeglobal.com';

con.add(conlist);

}

Database.SaveResult[] sr= Database.update(con,false);

for(Database.SaveResult dsr:sr)

{

if(dsr.isSuccess())

{

System.debug('Record updated sucessfully ID ::'+dsr.getId());

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