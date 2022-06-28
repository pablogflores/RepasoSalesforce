trigger ContactTrigger on Contact (after insert) {
    if(Trigger.isAfter) {
       
        if(Trigger.isInsert) {
            
            Map<Id, Integer> accMapWithContsCount = new Map<Id, Integer>();
            
           
            for(Contact con : Trigger.new) {
                
                if(!accMapWithContsCount.containsKey(con.AccountId)) {
                    accMapWithContsCount.put(con.AccountId, 1);
                    System.debug(accMapWithContsCount.put(con.AccountId, 1));
                }
                else {
                    accMapWithContsCount.put(con.AccountId, accMapWithContsCount.get(con.AccountId) + 1);
                    System.debug(accMapWithContsCount.put(con.AccountId, accMapWithContsCount.get(con.AccountId)));
                }
            }
            
           
            List<Account> accountsToBeUpdated = [Select Id, Total_Contacts_Count__c From Account Where Id IN :accMapWithContsCount.keySet()];
            for(Account acc : accountsToBeUpdated) {
                acc.Total_Contacts_Count__c = acc.Total_Contacts_Count__c + accMapWithContsCount.get(acc.Id);
            }
            update accountsToBeUpdated;
        }
 }
}