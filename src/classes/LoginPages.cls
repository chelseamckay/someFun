public class LoginPages {
 
    public String password { get; set; }
    public String username { get; set; }
    
    public PageReference registerUser() {
        PageReference newPage = new PageReference('/apex/newPage');
        newPage.setRedirect(true);
        return newPage;
    }
}