// List<List<sObject>> searchList = [
//   FIND 'Tech'
//   IN ALL FIELDS
//   RETURNING Contact(Id, FirstName), Account(Id, Name), Student__c(Id, Name)
// ];

// System.debug('SearchList' + searchList);

// // [
// // [{id: 1, name: 1}, {id: 2, name: 2} ],
// // [{id: 3, name: 3}, {id: 4, name: 4}],
// // ]

Account acc = new Account(Name = 'Test Trigger');
insert acc;
