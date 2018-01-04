public class TableController{

    public String getDataTable() {
        return null;
    }

 
 public List<Account> accList{get;set;}

 public TableController(){
  accList= new List<Account>();
  accList= [select id,name,type,industry from Account];
 }
 
 public void dataTable(){
 
 string column1 = 'test';
 
 }
}