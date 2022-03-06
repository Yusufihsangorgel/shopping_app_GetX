import 'package:get/get.dart';

class PushNotificationsController extends GetxController {
  final status1 = false.obs;
  final status2 = true.obs;
  final status3 = false.obs;
  final statusDark = false.obs;
  final locator = false.obs;
  @override
  void onInit() {
    statusChange();
    super.onInit();
  }

  void statusChange() {}
}
