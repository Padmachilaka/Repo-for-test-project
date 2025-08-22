trigger OpAsset on Opportunity (after insert,after update) {
    List<Asset> assetsToInsert = new List<Asset>();
    for (opportunity opp : Trigger.new){
        if(opp.isclosed){
            for (OpportunityLineItem item : opp.OpportunityLineItems){
                Asset a= new Asset();
                a.opportunity_on_Asset__c = opp.Id;
                a.Opportunity_Lineitem_id__c = item.Id;
                assetsToInsert.add(a);
            }
        }
    }
    if(!assetsToInsert.isEmpty()){
        insert assetsToInsert;
    }

}