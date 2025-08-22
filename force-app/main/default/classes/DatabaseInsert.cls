public class DatabaseInsert {
    public void insertmethod()

{

List<Contact> conlist= new List<Contact>();

for(Integer i=0 ;i<=5;i++)

{

Contact con=new Contact();

con.LastName='Test Contact'+i;

con.Phone='123456';

conlist.add(con);

}

Database.SaveResult[] sr= Database.insert(conlist,false);

for(Database.SaveResult dsr:sr)

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