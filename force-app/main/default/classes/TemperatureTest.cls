@isTest
public class TemperatureTest {
  @isTest
  private static void warmTempTest() {
    Decimal result = Temperature.FahrenheitToCelsius(70);

    System.assertEquals(20.11, result);
    // TO DO: implement unit test
  }
}