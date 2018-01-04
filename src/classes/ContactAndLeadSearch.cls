public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads(String n) {
    
        List<List< SObject>> stList = [FIND :n IN Name fields RETURNING Contact(FirstName, LastName),Lead(FirstName, LastName)];
        
        return stList;
        
        
        
        }


}