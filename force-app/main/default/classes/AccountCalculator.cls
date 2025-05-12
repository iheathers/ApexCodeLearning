public class AccountCalculator {
  public static void countContacts(List<Id> accountIds) {
    List<Account> accounts = [
      SELECT Id, (SELECT Id FROM Contacts)
      FROM Account
      WHERE Id IN :accountIds
    ];

    for (Account account : accounts) {
      account.Number_Of_Contacts__c = account.Contacts.size() + 1;
    }

    if (!accounts.isEmpty()) {
      update accounts;
    }
  }
}