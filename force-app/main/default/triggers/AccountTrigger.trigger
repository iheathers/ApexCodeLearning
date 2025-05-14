trigger AccountTrigger on Account(before insert, before update, after insert) {
  if (Trigger.isInsert && Trigger.isBefore) {
    AccountTriggerHandler.beforeInsert(Trigger.new);
  } else if (Trigger.isUpdate) {
    System.debug('Trigger after is Update');
  }
}
