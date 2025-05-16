@isTest
public with sharing class DailyOppProcessorTest {
  @isTest
  private static void testScheduledApex() {
    String cronExp = '0 0 0 16 5 ? 2025';
    List<Opportunity> opportunities = new List<Opportunity>();

    for (Integer i = 0; i < 500; i++) {
      if (i < 250) {
        opportunities.add(
          new Opportunity(
            Name = 'Test' + i,
            StageName = 'Propeccting',
            CloseDate = System.today()
          )
        );
      } else {
        opportunities.add(
          new Opportunity(
            Name = 'Test' + i,
            StageName = 'Propeccting',
            CloseDate = System.today(),
            LeadSource = 'Other'
          )
        );
      }
    }

    insert opportunities;

    DailyOppProcessor processor = new DailyOppProcessor();

    Test.startTest();
    String jobId = System.schedule('Process Opportunities', cronExp, processor);
    Test.stopTest();

    List<Opportunity> updatedOpportunities = [
      SELECT Id, LeadSource
      FROM Opportunity
      WHERE LeadSource = 'Web'
    ];

    System.assertEquals(200, updatedOpportunities.size());
  }
}
