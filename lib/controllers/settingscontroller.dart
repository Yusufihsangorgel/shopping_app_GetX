import 'package:get/get.dart';
import 'package:shopping_app/models/country.dart';
import 'package:shopping_app/services/city_services.dart';

class SettingsController extends GetxController {
  var cityList = <Product>[].obs;

  late RxString selectedValueSingleDialog = "".obs;
  @override
  void onInit() {
    fetchCity();
    super.onInit();
  }

  void fetchCity() async {
    try {
      var products = await CityServices.fetchProducts();
      if (products != null) {
        cityList.value = products as List<Product>;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
