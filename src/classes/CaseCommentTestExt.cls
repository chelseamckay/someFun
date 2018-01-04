public with sharing class CaseCommentTestExt {
    
    public string CaseId {get;set;}
    
    public Boolean deletableProperty {get; set;}
    public Boolean updateableProperty {get; set;} 
    
    
    public CaseCommentTestExt(ApexPages.StandardController controller) {

        CaseId = System.currentPageReference().getParameters().get('id');
        
        system.debug('Are comments deleteable? ' +  Schema.SObjectType.CaseComment.isDeletable());
        system.debug('Are comments updatable? ' +  Schema.SObjectType.CaseComment.isUpdateable());
        
        system.debug('Can I delete cases? ' + Schema.SObjectType.Case.isDeletable());
        system.debug('Can I update cases? ' + Schema.SObjectType.Case.isUpdateable());
        
        deletableProperty = Schema.SObjectType.CaseComment.isDeletable();
        updateableProperty = Schema.SObjectType.CaseComment.isUpdateable();
        
        /*deletableProperty = Schema.SObjectType.CaseComment.isDeletable();
        updateableProperty = Schema.SObjectType.CaseComment.isUpdateable();*/


        }

    
    }