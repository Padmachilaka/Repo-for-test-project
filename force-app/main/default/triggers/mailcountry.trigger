trigger mailcountry on Account (after insert,after update) {
        Set<String> mailingCountries = new Set<String>();
        List<Account> accnts= new List<Account>();
    for (Account acc : Trigger.new) {
        for (Contact con : [SELECT MailingCountry FROM Contact WHERE AccountId = :acc.Id]) {
            mailingCountries.add(con.MailingCountry);
        }
        acc.Mailing_country__c = String.join(new List<String>(mailingCountries), ', ');
        accnts.add(acc);
    }
    update accnts;
}