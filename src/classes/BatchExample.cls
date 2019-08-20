public class BatchExample implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        String query = 'SELECT Id,Name, Years_Experience__c FROM Contact';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<Contact> conList) {       
        for(Contact con : conList) {        
            // Update the Years experience to 10 if value is blank 
            if(con.Years_Experience__c == 0) {
                con.Years_Experience__c = 10;
            }
        }
        try {
            update conList;
        
        } catch(Exception e) {
            System.debug(e);
        }        
    }   
    
    public void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
  }
}
