public class NewCaseListController{


    public List<Case> getNewCases(){
    
    List<Case> caseList = [SELECT id, CaseNumber FROM Case WHERE Status='new'];
    
    return caseList;
    
    }


}