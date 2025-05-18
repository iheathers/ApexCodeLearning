Contact contact = new Contact(LastName = 'Queue Test');

insert contact;

ContactClone job = new ContactClone(contact, 'Energy');
Id jobId = System.enqueueJob(job);
