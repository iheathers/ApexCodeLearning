public class DataTypeDemo {
  public void methodDemo() {
    Map<String, String> colorCodes = new Map<String, String>{
      'AU' => 'Australia',
      'US' => 'United States',
      'IN' => 'India'
    };

    colorCodes.put('Red', 'FF0000');
    colorCodes.put('Blue', 'FF0000');

    List<String> colors = new List<String>();
    colors = colorCodes.values();

    System.debug('hello' + colors);
  }
}