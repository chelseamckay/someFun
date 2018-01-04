public class SubmitCaseController { 

public CaseReplace__c c { get; set; } 

public SubmitCaseController() { 
c = new CaseReplace__c(); 
} 

public PageReference submitCase() { 

c.Account__c = '001j000000eBGrQ'; 


c.Contact__c = '003j000000km9t3'; 


// Insert the case 
INSERT c; 
return new PageReference('/thanks'); 

} 


}