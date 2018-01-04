public class RandomContactFactory {
	
    public static List<Contact> generateRandomContacts(Integer int1, String lastName){
        
        List<Contact> cList = new List<Contact>();
        
        for(Integer i = 0; i < int1; i++){
            cList.add(new Contact(FirstName = 'Test'+i, LastName= lastName));
            
            
            
        }
     return cList;   
    }
}