trigger AccountAddressTrigger on Account (before insert, before update) {
    
    List<Account> aList = new List<Account>();
    
    for(Account a : Trigger.new) {
        
        if(a.Match_Billing_Address__c == true) {
            if(a.BillingPostalCode != null){
                a.ShippingPostalCode = a.BillingPostalCode;
                //aList.add(a);
            }
        }
    }
    
    //update aList;

}