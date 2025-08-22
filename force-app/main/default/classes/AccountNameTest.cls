@isTest
public class AccountNameTest{
@isTest
    static void testAccountNameTrigger() {
       Account acc = new Account(Name = 'Srikanth');
        Test.startTest();
        insert acc;
        Test.stopTest();
      acc = [SELECT Name FROM Account WHERE Id  =  :acc.Id];
       System.assertEquals( 'Srikanth ', acc.Name);
            
          
    }
}