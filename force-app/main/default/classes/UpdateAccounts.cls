public class UpdateAccounts {
  public static void updateAccount() {
    List<Account> accToBeUpdated = new List<Account>();

    Set<Id> accIdSet = new Set<Id>();

    for (Contact contact : [
      SELECT Id, Account.Id
      FROM Contact
      WHERE Name LIKE '%Test%' AND Account.Id != NULL
    ]) {
      // This alone does not create a new Account right there. It has to be inserted. Now,
      // The new Account() statement is used to create an in-memory representation of the updates,
      // but the Id field ensures that the update operation modifies existing records rather than
      // creating new ones.
      Account account = new Account();
      account.Id = contact.Account.Id;
      account.Active__c = 'Yes';
      account.Rating = 'Hot';
      accToBeUpdated.add(account);

      accIdSet.add(contact.Account.Id);
    }

    if (!accToBeUpdated.isEmpty()) {
      update accToBeUpdated;
    }
  }
}