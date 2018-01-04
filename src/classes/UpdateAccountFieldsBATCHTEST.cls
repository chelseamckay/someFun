global class UpdateAccountFieldsBATCHTEST implements Database.Batchable<sObject>{
// File: UpdateAccountFieldsBATCHTEST
// Name: Chelsea McKay
// Date: 7/16/16
// Desc: Bare bones batch class built for use with
// CheckContext trigger on account and CheckContextHandler

/*	What to execute in anonymous window:
       	String q = 'SELECT Industry FROM Account LIMIT 10';
		String e = 'Account';
		String f = 'Industry';
		String v = 'Consulting';
		Id batchInstanceId = Database.executeBatch(new UpdateAccountFieldsBATCHTEST(q,e,f,v), 5); 
*/ 
   
   global final String Query;
   global final String Entity;
   global final String Field;
   global final String Value;

   global UpdateAccountFieldsBATCHTEST(String q, String e, String f, String v){
             Query=q; Entity=e; Field=f; Value=v;

   }

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, 
                       List<sObject> scope){

      //query grabs a test account
      Account BatchAccount = [SELECT id, Name, Description FROM Account WHERE name LIKE '%test%' LIMIT 1];
      BatchAccount.Description = 'Batch Update';
      update BatchAccount;
   }

   global void finish(Database.BatchableContext BC){

   }

}