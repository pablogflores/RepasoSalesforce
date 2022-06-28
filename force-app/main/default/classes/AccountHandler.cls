public with sharing class AccountHandler {

    public static Account insertNewAccount(String name){
        try {
            Account cuenta =  new Account(Name = name);
            insert cuenta;
            return cuenta;
          
            
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                        e.getMessage());
            return null;
        }
}

 public static void countContact(String accountname){
    Map<Id, Integer> accMapWithContsCount = new Map<Id, Integer>();
    Integer cantidad = 0;
    Account newaccount = [SELECT Id FROM Account WHERE Name =:accountname];
    System.debug(newaccount); 
 
    for (Contact con : [SELECT Id, AccountId FROM Contact WHERE AccountId =:newaccount.Id]) {
            

        if(!accMapWithContsCount.containsKey(con.AccountId)) {
            accMapWithContsCount.put(con.AccountId, 1);
            //System.debug(accMapWithContsCount.put(con.AccountId, 1));
        }
        else {
            accMapWithContsCount.put(con.AccountId, accMapWithContsCount.get(con.AccountId) + 1);
           // System.debug(accMapWithContsCount.put(con.AccountId, accMapWithContsCount.get(con.AccountId)));
        } 
        //Pablo Flores
        cantidad =  accMapWithContsCount.get(con.AccountId);
    }
    System.debug(cantidad);



 }

}
