trigger BatchAccountTrigger on Account(after insert, after update) {

    system.debug('>>>> Current Trigger Heap: ' + Limits.getHeapSize());
    system.debug('>>>>>> Trigger Heap Limit: ' + Limits.getLimitHeapSize());
    
    Account BatchAccount = [SELECT id, Async_Limit__c, Sync_Limit__c FROM Account WHERE id = '001j000000NXmmm'];
    
    if(BatchAccount.Sync_Limit__c == 'test'){
    
    BatchAccount.Sync_Limit__c = '>>>> Current Trigger Heap: ' + Limits.getHeapSize() 
                                          +  '>>>>>> Trigger Heap Limit: ' + Limits.getLimitHeapSize();
    update BatchAccount;
    }
}