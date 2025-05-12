public class Temperature {
  public static Decimal FahrenheitToCelsius(Decimal fahrenheit) {
    Decimal result = (fahrenheit - 32) * 5 / 9;
    return result.setScale(2);
  }
}