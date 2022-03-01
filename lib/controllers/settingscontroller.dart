import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/city.dart';

import 'package:shopping_app/services/city_services.dart';

class SettingsController extends GetxController {
  var cityList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCity();
    super.onInit();
  }

  void fetchCity() async {
    isLoading(true);
    try {
      var citys = await CityServices.fetchProducts();
      print('burda takıldı 1');
      if (citys != null) {
        print('burda takıldı 2');
        cityList.value = citys;
        isLoading(false);
      }
    } on Exception catch (e) {
      print('burda takıldı 3');
      print(e);
    }
  }
}
