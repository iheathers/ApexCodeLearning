// List<Contact> contactList = new List<Contact>{
//   new Contact(FirstName = 'Pritam', LastName = 'Shrestha'),
//   new Contact(FirstName = 'Reena', LastName = 'Shrestha'),
//   new Contact(),
//   new Contact()
// };

// Database.SaveResult[] srList = Database.insert(contactList, false);

// for (Database.SaveResult sr : srList) {
//   if (sr.isSuccess()) {
//     System.debug('Successfull' + sr.getId());
//   } else {
//     for (Database.Error err : sr.getErrors()) {
//       System.debug('Errors');
//       System.debug(err.getStatusCode() + ':' + err.getMessage());
//       System.debug('Contact fields ' + err.getFields());
//     }
//   }
// }

List<Account> accList = new List<Account>();

//
accList = [SELECT Id, Name FROM Account LIMIT 2];

System.debug('accList' + accList);
