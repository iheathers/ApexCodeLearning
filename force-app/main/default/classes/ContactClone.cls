public with sharing class ContactClone implements Queueable {
  private Contact contact;
  private String industry;

  public ContactClone(Contact contact, String industry) {
    this.contact = contact;
    this.industry = industry;
  }

  public void execute(QueueableContext context) {
    System.debug('Execute');
    List<Account> accounts = [
      SELECT Id
      FROM Account
      WHERE Industry = :industry
    ];

    List<Contact> contacts = new List<Contact>();

    for (Account account : accounts) {
      Contact cloneContact = contact.clone(false, false, false, false);
      cloneContact.AccountId = account.Id;
      contacts.add(cloneContact);
    }

    if (!contacts.isEmpty()) {
      insert contacts;
    }
  }
}
