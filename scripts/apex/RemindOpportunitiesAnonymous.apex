// RemindOpportunitiesOwners reminder = new RemindOpportunitiesOwners();
OpportunityProcessorScheduler job = new OpportunityProcessorScheduler();

// SECONDS MINUTES HOURS DAYOFMONTH MONTH DAYOFWEEK YEAR
String schedule = '0 38 10 18 5 ? 2025';

String jobID = System.schedule(
  'Opportunity Processor Scheduler',
  schedule,
  job
);
