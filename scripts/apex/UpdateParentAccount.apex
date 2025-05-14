List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = 'NY'];

Account account = [SELECT Id FROM Account WHERE Name = 'Account 1' LIMIT 1];

UpdateParentAccount updateJob = new UpdateParentAccount(accounts, account.Id);
Id jobId = System.enqueueJob(updateJob);
