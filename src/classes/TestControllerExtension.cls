public class TestControllerExtension {

    
     private final Case testCase;
     
     public TestControllerExtension(ApexPages.StandardController stdcontroller) {
     this.testCase = (Case)stdcontroller.getRecord();
     }


public PageReference redirectByProfile()
{   
    string accountInfo='';
        Id profileId = userinfo.getProfileId();
        //if current page is an account page:
        string CurrentURL = (ApexPages.currentPage().geturl());
        if(CurrentURL.contains('001')){
        Id accountId = (ApexPages.currentPage().getparameters().get('def_account_id'));
        accountInfo= '&cas4_lkid=' + accountId;
        }
        
        
        
        //Profile systemadminprofile = User.getSystemadminprofile();
        String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
        
        if (profileName != 'System Administrator')
        {           
            String prefix = Case.SObjectType.getDescribe().getKeyPrefix();
            //String param = getParameters() + '&(your field id)=(your field value)';
            String param = getParameters() + accountInfo;
            return new PageReference('/'+prefix+'/e?nooverride=1&'+param); 
        }
        else    
            return null;              

}




    //public PageReference redirect(){
    //String prefix = Case.SObjectType.getDescribe().getKeyPrefix();
    //String param = getParameters() + '&(your field id)=(your field value)';
    //return new PageReference('/'+prefix+'/e?nooverride=1&'+param); 
    //}
    
    // Inherit previous parameters, more imporatntly, RecordType parameter!
    private String getParameters(){
    string param = '';
    Map<String, String> strMap = ApexPages.currentPage().getParameters();
    String[] keys = new String[]{'RecordType', 'retURL', 'cancelURL', 'account'};
    for(String s : keys){
    if(strMap.containsKey(S)) param += s + '=' + strMap.get(s) + '&';
    }
    if(param.length() > 0) param = param.substring(0, param.length()-1);

    return param;
    }
   
    
    
}