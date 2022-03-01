import 'package:http/http.dart' as http;
import 'package:shopping_app/models/city.dart';

class CityServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response =
        await client.get(Uri.parse('https://api.ubilisim.com/postakodu/il/34'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    } else {
      print('error');
      return null;
    }
  }
}
