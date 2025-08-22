@isTest
public class AccountEmailTemplateTest {

    @isTest
    static void testGetContactList() {
        AccountEmailTemplate obj = new AccountEmailTemplate();
        obj.accountId = '0035h000012KyveAAC'; // Replace with a valid account ID

        List<Contact> expectedList = [SELECT FirstName, LastName, Email, Phone, Title, Account.name FROM Contact WHERE AccountId =: obj.accountId];
        List<Contact> actualList = obj.getContactList();

        System.assertEquals(expectedList.size(), actualList.size(), 'Size of contact lists should be the same');
        for (Integer i = 0; i < expectedList.size(); i++) {
            Contact expectedContact = expectedList[i];
            Contact actualContact = actualList[i];

            System.assertEquals(expectedContact.FirstName, actualContact.FirstName, 'First names should match');
            System.assertEquals(expectedContact.LastName, actualContact.LastName, 'Last names should match');
            System.assertEquals(expectedContact.Email, actualContact.Email, 'Emails should match');
            System.assertEquals(expectedContact.Phone, actualContact.Phone, 'Phone numbers should match');
            System.assertEquals(expectedContact.Title, actualContact.Title, 'Titles should match');
            System.assertEquals(expectedContact.Account.Name, actualContact.Account.Name, 'Account names should match');
        }
    }
}