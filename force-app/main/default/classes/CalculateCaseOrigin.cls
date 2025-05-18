public with sharing class CalculateCaseOrigin {
  // @future
  public static void countCases() {
    List<Account> accounts = [
      SELECT Id, (SELECT Id, Origin FROM Cases)
      FROM Account
    ];

    System.debug('Accounts' + accounts);

    for (Account account : accounts) {
      Integer WebCount = 0, EmailCount = 0, PhoneCount = 0;

      System.debug('Account Cases->' + account.Cases);

      for (Case c : account.Cases) {
        if (c.Origin == 'Web') {
          WebCount++;
        } else if (c.Origin == 'Email') {
          EmailCount++;
        } else if (c.Origin == 'Phone') {
          PhoneCount++;
        }
      }

      account.Cases_Through_Email__c = EmailCount;
      account.Cases_Through_Web__c = WebCount;
      account.Cases_Through_Phone__c = PhoneCount;
    }

    update accounts;
  }
}
