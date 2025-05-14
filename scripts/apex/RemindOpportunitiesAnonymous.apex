RemindOpportunitiesOwners reminder = new RemindOpportunitiesOwners();

// SECONDS MINUTES HOURS DAYOFMONTH MONTH DAYOFWEEK YEAR
String schedule = '0 0 0 15 5 ? 2025';

String jobID = System.schedule('Remind Opp Owners', schedule, reminder);
