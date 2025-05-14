public with sharing class OpportunityProcessor implements Database.Batchable<sObject>, Database.Stateful {
  public Integer recordsCount = 0;

  public Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator([SELECT Id, Name FROM Opportunity]);
  }

  public void execute(
    Database.BatchableContext bc,
    List<Opportunity> opportunities
  ) {
    for (Opportunity opportunity : opportunities) {
      opportunity.LeadSource = 'Other';
    }

    update opportunities;

    recordsCount = recordsCount + opportunities.size();
  }

  public void finish(Database.BatchableContext bc) {
    System.debug('Finish');
    System.debug('Total Records Processed' + recordsCount);
  }
}
