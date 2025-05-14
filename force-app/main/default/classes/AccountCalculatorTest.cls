@isTest
public class AccountCalculatorTest {
  @isTest
  public static void countContactsTest() {
    List<Account> accounts = new List<Account>();

    for (Integer i = 0; i < 250; i++) {
      accounts.add(new Account(Name = 'Test' + i));
    }

    insert accounts;

    List<Contact> contacts = new List<Contact>();

    List<Id> accIds = new List<Id>();

    for (Account account : accounts) {
      contacts.add(
        new Contact(
          FirstName = 'Test',
          LastName = account.Name,
          AccountId = account.Id
        )
      );
      accIds.add(account.Id);
    }

    insert contacts;

    Test.startTest();
    AccountCalculator.countContacts(accIds);
    Test.stopTest();

    List<Account> accountList = [SELECT Id, Number_Of_Contacts__c FROM Account];

    System.assertEquals(1, accountList[0].Number_Of_Contacts__c);
  }
}
