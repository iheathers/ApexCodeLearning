public with sharing class UpdateContactMailingAddress implements Database.Batchable<sObject> {
  public Database.QueryLocator start(Database.BatchableContext bc) {
    System.debug('Start');

    return DAtabase.getQueryLocator(
      'SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry,' +
        '(SELECT Id, MailingStreet, MailingCity, MailingState, MailingPostalCode FROM Contacts)' +
        'FROM Account WHERE BillingCountry = \'USA\''
    );
  }

  public void execute(Database.BatchableContext bc, List<Account> accounts) {
    System.debug('Execute');

    List<Contact> contacts = new List<Contact>();

    for (Account account : accounts) {
      for (Contact contact : account.Contacts) {
        contact.MailingStreet = account.BillingStreet;
        contact.MailingCity = account.BillingCity;
        contact.MailingState = account.BillingState;
        contact.MailingPostalCode = account.BillingPostalCode;
        contact.MailingCountry = account.BillingCountry;

        contacts.add(contact);
      }
    }

    update contacts;
  }

  public void finish(Database.BatchableContext bc) {
    System.debug('Finish');
  }
}
