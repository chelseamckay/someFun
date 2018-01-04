public class isClosedTest {
private final Case caseTest;
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public isClosedTest(ApexPages.StandardController stdController) {
        this.caseTest = (Case)stdController.getRecord();
    }

    public String isClosed() {
        //caseTest.isClosed=true; you can't write to isClosed!
        string rtrnstring='no!'; 
        return rtrnstring;
    }


}