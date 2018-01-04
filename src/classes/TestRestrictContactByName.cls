@isTest
public class TestRestrictContactByName {

    @isTest static void testTesting(){
        Contact c = new Contact(FirstName = 'test', LastName = 'INVALIDNAME');
        insert c;
    }
}