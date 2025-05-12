public with sharing class AccountTriggerHandler {
  public static void beforeInsert(List<Account> newAccounts) {
    System.debug('Test');
    for (Account account : newAccounts) {
      account.Description = 'Test Description from Trigg asdfer';
    }
  }
}
