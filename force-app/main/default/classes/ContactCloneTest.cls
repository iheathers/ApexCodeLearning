/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 *
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class ContactCloneTest {
  @testSetup
  static void setup() {
    List<Account> accounts = new List<Account>();

    for (Integer i = 1; i <= 5; i++) {
      Account account = new Account();
      account.Name = 'Test' + i;
      account.Industry = 'Energy';
      accounts.add(account);
    }

    insert accounts;

    Contact contact = new Contact(LastName = 'Queue');
    insert contact;
  }

  @isTest
  static void testContactClone() {
    // TO DO: implement unit test

    Contact baseContact = [
      SELECT Id, LastName
      FROM Contact
      WHERE LastName = 'Queue'
    ];

    Test.startTest();
    ContactClone job = new ContactClone(baseContact, 'Energy');
    Id jobId = System.enqueueJob(job);
    Test.stopTest();

    Integer clonedContactCount = [
      SELECT COUNT()
      FROM Contact
      WHERE AccountId IN (SELECT Id FROM Account WHERE Industry = 'Energy')
    ];

    System.assertEquals(5, clonedContactCount);
  }
}
