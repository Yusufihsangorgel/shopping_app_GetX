import 'package:get/get.dart';
import 'package:shopping_app/services/remote_services.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
        isLoading(false);
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
