public with sharing class UpdateParentAccount implements Queueable {
  private List<Account> accounts;
  private Id parentAccountId;

  public UpdateParentAccount(List<Account> accRecords, Id id) {
    this.accounts = accRecords;
    this.parentAccountId = id;
  }

  public void execute(QueueableContext context) {
    for (Account acc : accounts) {
      acc.ParentId = parentAccountId;
    }

    update accounts;
  }
}
