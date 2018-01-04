public class testTabStyleController {

    List<account> listAccounts;
    
    public List<account> getlistAccounts() {
        if(listAccounts == null) {
           listAccounts = [SELECT Id, Name FROM account];
        }
        return listAccounts;
    }
}