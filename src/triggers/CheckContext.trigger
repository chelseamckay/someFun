trigger CheckContext on Account (before insert, before update) {
// File: CheckContext 
// Name: Chelsea McKay
// Date: 7/16/16
// Desc: Checks current limits to determine context 
// depending on context, logic and DML will be pushed to @future
// 
/*  What to execute in anonymous window to trigger:
        Account testAccount = [SELECT id, name, description FROM Account 
                                WHERE id IN (Select AccountId From Contact) LIMIT 1];
            
            testAccount.description = 'test handler'; OR testAccount.description = 'test future';
            update testAccount;
*/ 
      
    //trigger handler
    CheckContextHandler handler = new CheckContextHandler();
    
    //Heap size limits
    integer CurrentHeap = Limits.getHeapSize();  
    integer TotalHeap = Limits.getLimitHeapSize();
    //CPU limits
    integer TotalCpu = Limits.getLimitCpuTime();
    integer CurrentCpu = Limits.getCpuTime();
    
    //could include any other pertinent limits
    //by calling limits class
    
    List<Id> TriggerListIds = new List<Id>();
    for (account a: Trigger.new)
        {
            TriggerListIds.add(a.id);
        }
    
    //check total heap to determine context
    if (TotalHeap == 12000000){ //we're asynchronous!
        system.debug('>>>>>>> async context; calling handler...');
        //call handler class to do logic
        handler.UpdateRelatedObjects(TriggerListIds);
    }
    
    else{//this is a synchronous transaction

        // if we're less than halfway to our sync limit,
        // and we aren't executing a test to call @future, 
        // let's go for it and call handler! 
        if ((Trigger.new[0].description != 'test future') &&((CurrentHeap < (TotalHeap/2)) || (CurrentCpu < (TotalCpu/2)))) {
            
            system.debug('>>>>>>> sync context; but calling handler');
            system.debug('>>>>>>> sync context; Current CPU: ' + CurrentCpu);
            system.debug('>>>>>>> sync context; Current Heap: ' + CurrentHeap);
            //call handler class
            handler.UpdateRelatedObjects(TriggerListIds);
        }
        
        else{ //we've consumed over half our resources, move to @future
        system.debug('>>>>>>> sync context; calling @future method...');
        
        FutureClass.PostponeLogic(TriggerListIds);
        }  
    }
}