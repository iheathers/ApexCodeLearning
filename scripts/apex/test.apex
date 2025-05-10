List<Student__c> students = new List<Student__c>();

String name = '%Tech%';
students = [
  SELECT Id, Name, (SELECT Id, Name FROM Books__r)
  FROM Student__c
];

if (students.isEmpty()) {
  return;
}

for (Student__c student : students) {
  System.debug('Student__c Books__r -> ' + student.Books__r);

  if (student.Books__r.isEmpty()) {
    System.debug('No Books__r found for Student__c: ' + student.Id);

    continue;
  }

  for (Book__c book : student.Books__r) {
    System.debug('Books__r For Student__c -> ' + student.Id + ' are ' + book);
  }
}

System.debug('student ->' + students);
