public with sharing class DailyOppProcessor implements Schedulable {
  public void execute(SChedulableContext ctx) {
    List<Opportunity> opportunities = [
      SELECT Id, LeadSource
      FROM Opportunity
      WHERE LeadSource = NULL
      LIMIT 200
    ];

    for (Opportunity opp : opportunities) {
      opp.LeadSource = 'Web';
    }

    if (!opportunities.isEmpty()) {
      update opportunities;
    }
  }
}
