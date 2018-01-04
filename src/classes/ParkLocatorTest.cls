@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String[] parks = ParkLocator.Country('Japan');
        // Verify that a fake result is returned
        system.assert(parks.size() > 0);
    }
}