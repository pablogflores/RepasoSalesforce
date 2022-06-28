@isTest
public  class ContactTriggerTest {

    @testSetup
    static void dataSetup() {
        Account newAcc = new Account(Name='TestAccount1',Total_Contacts_Count__c = 0);
        insert newAcc;
        
        Account newAcc2 = new Account(Name='TestAccount2');
        insert newAcc2;
    }
    @isTest
    static void test_afterInsert() {
        Account insertedAcc1 = [Select Id, Total_Contacts_Count__c From Account Where Name = 'TestAccount1'];
        System.assertEquals(0, insertedAcc1.Total_Contacts_Count__c, 'Contacts count does not match.');
        
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0; i<2; i++) {
            contacts.add(new Contact(LastName='TestContact'+i, AccountId=insertedAcc1.Id));
        }
        
        Test.startTest();
            insert contacts;
            Account udpatedAcc1 = [Select Id, Total_Contacts_Count__c From Account Where Id = :insertedAcc1.Id];
            System.assertEquals(2, udpatedAcc1.Total_Contacts_Count__c, 'Contacts count does not match.');
        Test.stopTest();
    }
}
