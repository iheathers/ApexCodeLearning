@isTest
public class UpdateAccountsTest {
  @isTest
  private static void testUpdateAccount() {
    Account acc = new Account();
    acc.Name = 'Test Account';
    acc.Active__c = 'No';
    acc.Rating = 'Cold';
    // This does not actually insert any account in org.
    // The reason why the insert acc; statement in your test method does not actually insert the Account record into your Salesforce org is because Apex test methods operate in an isolated test context.
    insert acc;

    Contact con = new Contact();
    con.FirstName = 'Test';
    con.LastName = 'Test';
    con.AccountId = acc.Id;
    insert con;

    UpdateAccounts.updateAccount();

    Account updatedAcc = [
      SELECT Id, Active__c, Rating
      FROM Account
      WHERE Id = :acc.Id
    ];

    System.assertEquals('Warm', updatedAcc.Rating);
  }
}