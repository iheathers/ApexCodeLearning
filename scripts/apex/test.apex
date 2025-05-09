// DataTypeDemo d = new DataTypeDemo();
// d.methodDemo();

// Account acc = new Account(name = 'Test Anonymoous User');
// insert acc;

// Only Lead, Account and Contact Objects can be merge
// List<Account> masterAcc = [
//   SELECT Id, Name
//   FROM Account
//   WHERE Name = 'Tech School5'
//   ALL ROWS
// ];

// System.debug('masterAcc' + masterAcc);

// undelete masterAcc;
// Account mergeAcc = [SELECT Id, Name FROM Account WHERE Name = 'Tech School4'];

// merge masterAcc mergeAcc;

try {
  Acccount acc = new Account();
  insert acc;
} catch (DMLException e) {
  System.debug(e);
}
