public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accountIdList) {
        
        List<Account> accountList = new List<Account>();
        for (Account a : [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIdList]) {
            a.Number_of_Contacts__c = a.Contacts.size();
            accountList.add(a);
        }
        update accountList;
    }

}