global with sharing class RemindOpportunitiesOwners implements Schedulable {
  global void execute(SchedulableContext ctx) {
    List<Opportunity> opportunities = [
      SELECT Id, Name, OwnerId, CloseDate
      FROM Opportunity
      WHERE IsClosed = FALSE AND CloseDate < TODAY
    ];

    TaskUtils.remindOwners(opportunities);
  }
}
