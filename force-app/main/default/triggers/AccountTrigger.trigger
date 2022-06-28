trigger AccountTrigger on Account (after insert) {

    if (Trigger.isAfter && Trigger.isInsert) {
        
        List<Contact> contacto = new List<Contact>();

        for (Account acc : Trigger.new) {

            Contact newContact = new Contact(LastName = Account.Name + 'Com', AccountId = acc.Id);
            contacto.add(newContact);
            
        }
        if (!contacto.isEmpty()) {
            insert contacto;
        }
       
    }

}