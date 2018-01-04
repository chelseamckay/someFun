@IsTest(SeeAllData=true)
public class CheckContextTestClass {

// File: CheckContextTestClass
// Name: Chelsea McKay
// Date: 7/16/16
// Desc: Test class for CheckContext trigger on account
// and CheckContextHandler for said trigger

    static testmethod void testAccountTriggerViaDML()
    {
            //Grab a test account to update
            Account testAccount = [SELECT id, name, description FROM Account WHERE id IN (Select AccountId From Contact) LIMIT 1];
        	testAccount.description = 'testing...';
        	update testAccount;
        	Contact testContact = [SELECT id, name, description FROM Contact WHERE AccountId = :testAccount.Id LIMIT 1];
            system.debug(testContact.description);
        	System.assertEquals(testContact.description, 'updated via CheckContext trigger'); 
    }
}