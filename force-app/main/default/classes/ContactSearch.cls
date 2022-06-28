public with sharing class ContactSearch {
 public static List<Contact> searchForContacts(String lastname, String postalcode){

  List<Contact> Contacts = [SELECT Id, Name FROM Contact WHERE LastName =:lastname AND MailingPostalCode =: postalcode];

  return Contacts;
 }
}
