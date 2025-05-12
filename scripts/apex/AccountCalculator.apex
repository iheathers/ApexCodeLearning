List<Account> accounts = [SELECT Id FROM Account];
List<Id> accountIds = new List<Id>();

for (Account account : accounts) {
  accountIds.add(account.Id);
}

AccountCalculator.countContacts(accountIds);
