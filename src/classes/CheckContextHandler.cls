public class CheckContextHandler {
// File: CheckContextHandler
// Name: Chelsea McKay
// Date: 7/16/16
// Desc: Handler for CheckContext trigger on account
// Updates the related contacts on updated account
        
    public void UpdateRelatedObjects(List<id> updatedAccounts){

		//grab contacts related to accounts
		List<Contact> ContactList = [SELECT id, Name, Description FROM Contact WHERE AccountId IN :updatedAccounts];        

        //update below can easily be replaced with
        //more meaningful record updates
    
        //confirm there are records to be updated
        if(ContactList.size() > 0){
    		for (contact c: ContactList){
            c.description = 'updated via CheckContext trigger';
        	}
        	system.debug('>>>>>>> in handler; updating contact list: ' + ContactList);
			update ContactList; 
    	}
    }    
}