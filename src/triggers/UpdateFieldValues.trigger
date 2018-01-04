trigger UpdateFieldValues on Case (before update, before insert) {
    for (Case c : Trigger.new) {
        if (c.Origin == 'Phone')
            c.Priority = 'Low';
    }
    
    account a = [SELECT id, Name, description FROM Account WHERE id = '001j000000NXmmm'];
    
    a.description = 'editied via cross-object trigger';
    
    update a;
}