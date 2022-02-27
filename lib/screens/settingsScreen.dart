import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/settingscontroller.dart';
import 'package:shopping_app/widgets/mySize.dart';
import 'package:search_choices/search_choices.dart';
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
          appBar: AppBar(
            title: Text('Ayarlar'),
          ),
          body: Column(
            children: [
              SearchChoices.single(
                items: items,
                value: settingsController.selectedValueSingleDialog.value,
                hint: "Select one",
                searchHint: "Select one",
                onChanged: (value) {
                  settingsController.selectedValueSingleDialog.value = value;
                },
                isExpanded: true,
              ),
              MySize(height: 30, width: 10),
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
                              ? Text("Karanlık Mod açık")
                              : Text("Karanlık mod kapalı")),
                ],
              ),
            ],
          ),
        ));
  }
}