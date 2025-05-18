@isTest
public with sharing class UpdateContactMailingAddressTest {
  @isTest
  public static void testAddressCopy() {
    List<Account> accounts = new List<Account>();
    List<Contact> contacts = new List<Contact>();

    for (Integer i = 0; i < 5; i++) {
      Account account = new Account(
        Name = 'Account' + i,
        BillingStreet = 'Aurum Parade',
        BillingCountry = 'USA'
      );
      accounts.add(account);
    }

    insert accounts;

    for (Account account : accounts) {
      Contact contact = new Contact();
      contact.LastName = 'Test';
      contact.AccountId = account.Id;
      contacts.add(contact);
    }

    insert contacts;

    Test.startTest();
    UpdateContactMailingAddress updateJob = new UpdateContactMailingAddress();
    Id batchId = Database.executeBatch(updateJob);
    Test.stopTest();

    Integer contactCount = [
      SELECT COUNT()
      FROM Contact
      WHERE MailingStreet = 'Aurum Parade'
    ];

    System.assertEquals(5, contactCount);
  }
}
