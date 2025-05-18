public with sharing class OpportunityProcessorScheduler implements Schedulable {
  public void execute(SchedulableContext context) {
    OpportunityProcessor opportunityProcessor = new OpportunityProcessor();

    Database.executeBatch(opportunityProcessor);
  }
}
