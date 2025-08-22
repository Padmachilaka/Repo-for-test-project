trigger accountshippost on Account (before insert ,before update) {
     for(Account acc: Trigger.new) {
        if(acc.Match_Billing_Address_c__c == True && acc.BillingPostalCode != null) {
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }

}