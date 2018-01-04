@IsTest
public class AccountProcessorTest {
    
    @IsTest
    public static void testAccountUpdate () {
        Account acc = new Account(name= 'test account');
        Account acc2 = new Account(name= 'test account2');
        
        List<Account> accList = new List<Account>();
        accList.add(acc);
        accList.add(acc2);
        insert accList;
        
        List<Id> accIdList = new List<Id>();
        accIdList.add(acc.Id);
        accIdList.add(acc2.Id);
        Test.startTest();
        AccountProcessor.countContacts(accIdList);
        Test.stopTest();
    }
    

}