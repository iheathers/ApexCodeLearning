@isTest
public class EventUtilityTest {
  @isTest
  private static void testEventStatusLength() {
    String res = EventUtility.eventPriority('IDN');

    System.assertEquals(null, res);
  }

  @isTest
  private static void testHighPriority() {
    String res = EventUtility.eventPriority('CA');
    System.assertEquals('High', res);
  }

  @isTest
  private static void testMediumPriority() {
    String res = EventUtility.eventPriority('No');
    System.assertEquals('Medium', res);
  }
}