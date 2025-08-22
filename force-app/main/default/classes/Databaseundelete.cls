public class Databaseundelete {
    public void undeletemethod()

{

Account[] acc = [SELECT Id from Account WHERE Name LIKE 'Test1' All Rows];

Database.UndeleteResult[] drList = Database.undelete(acc, false);

for(Database.UndeleteResult dr : drList)

{

if (dr.isSuccess())

{

System.debug('Successfully undeleted account with ID: ' + dr.getId());

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