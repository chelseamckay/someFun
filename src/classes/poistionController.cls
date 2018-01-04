public class poistionController {

     private final Account testList;
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public poistionController(ApexPages.StandardController stdController) {
        this.testList = (Account)stdController.getRecord();
        
    }
    
    public List<Account> getTestList() {
        List<Account> con = [SELECT Name FROM Account];
        return con;
    }
}