trigger ClosedOpportunityTrigger on Opportunity (after update, after insert) {
    
    List<Task> aList = new List<Task>();
    
    for(opportunity a : Trigger.new) {
        
        if(a.StageName == 'Closed Won') {
            
            aList.add(new Task(WhatId = a.id, Subject = 'Follow Up Test Task'));
            
        }
    }
    
    insert aList;


}