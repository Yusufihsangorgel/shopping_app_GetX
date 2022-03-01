import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/settingscontroller.dart';
import 'package:shopping_app/widgets/city_tile.dart';
import 'package:shopping_app/widgets/myDivider.dart';
import 'package:shopping_app/widgets/mySize.dart';
import 'package:shopping_app/widgets/mySpinkit.dart';
import '../controllers/pushNotifications_controller.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

  SettingsScreen({Key? key}) : super(key: key);
  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;

  List<DropdownMenuItem> items = [];
  @override
  final PushNotificationsController pushNotificationsController =
      Get.put(PushNotificationsController());
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _scaffoldBgcolor,
          appBar: AppBar(
            title: Text('Ayarlar'),
          ),
          body: Column(
            children: [
              MySize(height: 20, width: 10),
              Text(
                'Semt Seçiniz',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: _textColor),
              ),
              Expanded(
                child: Obx(() {
                  if (settingsController.isLoading.isTrue) {
                    return (mySpinKit.spinkit);
                  } else
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: settingsController.cityList.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return CityTile(settingsController.cityList[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                }),
              ),
              MySize(height: 30, width: 10),
              MyDivider(color: _textColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlutterSwitch(
                    width: 100.0,
                    height: 55.0,
                    toggleSize: 45.0,
                    value: pushNotificationsController.statusDark.value,
                    borderRadius: 30.0,
                    padding: 2.0,
                    activeToggleColor: Color(0xFF6E40C9),
                    inactiveToggleColor: Color(0xFF2F363D),
                    activeSwitchBorder: Border.all(
                      color: Color(0xFF3C1E70),
                      width: 6.0,
                    ),
                    inactiveSwitchBorder: Border.all(
                      color: Color(0xFFD1D5DA),
                      width: 6.0,
                    ),
                    activeColor: Color(0xFF271052),
                    inactiveColor: Colors.white,
                    activeIcon: Icon(
                      Icons.nightlight_round,
                      color: Color(0xFFF8E3A1),
                    ),
                    inactiveIcon: Icon(
                      Icons.wb_sunny,
                      color: Color(0xFFFFDF5D),
                    ),
                    onToggle: (val) {
                      pushNotificationsController.statusDark.value = val;

                      if (val) {
                        _textColor = Colors.white;
                        _appBarColor = Color.fromRGBO(22, 27, 34, 1);
                        _scaffoldBgcolor = Color(0xFF0D1117);
                      } else {
                        _textColor = Colors.black;
                        _appBarColor = Color.fromRGBO(36, 41, 46, 1);
                        _scaffoldBgcolor = Colors.white;
                      }
                    },
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child:
                          pushNotificationsController.statusDark.value == true
                              ? Text("Karanlık Mod açık",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: _textColor))
                              : Text("Karanlık mod kapalı",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: _textColor))),
                ],
              ),
            ],
          ),
        ));
  }
}
