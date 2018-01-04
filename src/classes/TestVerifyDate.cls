@isTest
public class TestVerifyDate {
    
    @isTest static void testingTest() {
    //VerifyDate vd = new VerifyDate();
    Date date1 = date.newInstance(2016, 11, 6);
    Date date2 = date.newInstance(2016, 11, 16);
    Date date3 = date.newInstance(2016, 12, 16);
    //Date dateReturned;
    
    Date dateReturned = VerifyDate.CheckDates(date1, date2);
    //system.assertEquals(dateReturned, 12/31/2016);
    
    Date dateReturned2 = VerifyDate.CheckDates(date2, date1);
    
    Date dateReturned3 = VerifyDate.CheckDates(date2, date3);
    }
}