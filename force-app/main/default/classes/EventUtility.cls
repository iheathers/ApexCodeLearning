public class EventUtility {
  public static String eventPriority(String eventStatus) {
    String eventPriority;

    if (String.isBlank(eventStatus) || eventStatus.length() > 2) {
      return null;
    }

    if (eventStatus == 'CA') {
      eventPriority = 'High';
    } else {
      eventPriority = 'Medium';
    }

    return eventPriority;
  }
}