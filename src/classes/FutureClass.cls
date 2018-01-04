public class FutureClass {
// File: FutureClass
// Name: Chelsea McKay
// Date: 7/16/16
// Desc: Class that contains @future method for use
// with CheckContext trigger on account and CheckContextHandler 

    	@future (callout=true)
        public static void PostponeLogic(List<Id> AccountList){
            
            CheckContextHandler handler = new CheckContextHandler();
            system.debug('>>>>>>> in future method; calling handler...');
            //call handler class to do logic
            handler.UpdateRelatedObjects(AccountList);
            
        }
}