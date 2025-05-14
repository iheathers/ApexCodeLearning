@isTest
public with sharing class OpportunityProcessorTest {
  @isTest
  private static void testBatchClass() {
    List<Opportunity> opportunities = new List<Opportunity>();

    for (integer i = 0; i < 200; i++) {
      opportunities.add(
        new Opportunity(
          Name = 'Test' + i,
          StageName = 'Prospecting',
          CloseDate = System.today()
        )
      );
    }

    // Place the checkpoint here to capture the fully populated list
    System.debug('Checkpoint: Opportunities list populated');
    insert opportunities;

    Test.startTest();
    OpportunityProcessor opportunityProcessor = new OpportunityProcessor();
    Id batchId = Database.executeBatch(opportunityProcessor, 200);
    Test.stopTest();

    List<Opportunity> updatedOpps = [
      SELECT Id
      FROM Opportunity
    ];

    System.assertEquals('Other', updatedOpps[0].LeadSource);
    // System.assertEquals(200, updatedOpps.size());
  }
}
