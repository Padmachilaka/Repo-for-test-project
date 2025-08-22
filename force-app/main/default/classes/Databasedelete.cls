public class Databasedelete {
    public void deleteMethod()

{

Account[] acc = [SELECT Id from Account WHERE Name LIKE 'Test1'];

Database.DeleteResult[] drList = Database.delete(acc, false);

for(Database.DeleteResult dr : drList)

{

if (dr.isSuccess())

{

System.debug('Successfully deleted account with ID: ' + dr.getId());

}

else

{

for(Database.Error err : dr.getErrors())

{

System.debug('The following error has occurred.');

System.debug(err.getStatusCode() + ': ' + err.getMessage());

System.debug('Account fields that affected this error: ' + err.getFields());

}

}

}

}

}