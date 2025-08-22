@isTest
private class LeadProcessorTest {
  @isTest
    private static void testbatchclass(){
        //Load test data
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0 ; i<200; i++){
         leads.add(new Lead(LastName = 'Connock',Company='salesforce'));   
        }
        insert leads;
        //perform the test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp,200);
        Test.stopTest();
        //check the result
        List<Lead> updatedLeads = [SELECT Id From Lead WHERE Leadsource='Dreamforce'];
        system.assertEquals(200, updatedLeads.size(),'ERROR:At least l Lead record not updated not updated correctly');
    }
}