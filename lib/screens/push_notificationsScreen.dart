import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/pushNotifications_controller.dart';

class PushNotifications extends StatelessWidget {
  PushNotifications({Key? key}) : super(key: key);
  final PushNotificationsController pushNotificationsController =
      Get.put(PushNotificationsController());
  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromARGB(255, 67, 138, 209);
  Color _scaffoldBgcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: _textColor),
          bodyText2: TextStyle(color: _textColor),
        ),
      ),
      child: Obx(() => Scaffold(
            backgroundColor: _scaffoldBgcolor,
            appBar: AppBar(
              backgroundColor: _appBarColor,
              title: Text(
                "Bildirimler",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeWXkpELX7-v06iH8yIXn3GDOZgN1ouuAQBw&usqp=CAU')
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Uygulama Bildirimleri',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        FlutterSwitch(
                          activeText: "Uygulama Bildirimi Açık",
                          inactiveText: "Uygulama Bildirimi Kapalı",
                          value: pushNotificationsController.status1.value,
                          valueFontSize: 10.0,
                          width: 110,
                          borderRadius: 30.0,
                          showOnOff: true,
                          onToggle: (val) {
                            pushNotificationsController.status1.value = val;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'SMS Bildirimleri',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        FlutterSwitch(
                          activeText: "Sms Bildirimi Açık",
                          inactiveText: "Sms Bildirimi Kapalı",
                          value: pushNotificationsController.status2.value,
                          valueFontSize: 10.0,
                          width: 110,
                          borderRadius: 30.0,
                          showOnOff: true,
                          onToggle: (val) {
                            pushNotificationsController.status2.value = val;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Mail Bildirimleri',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        FlutterSwitch(
                          activeText: "Mail Bildirimi Açık",
                          inactiveText: "Mail Bildirimi Kapalı",
                          value: pushNotificationsController.status3.value,
                          valueFontSize: 10.0,
                          width: 110,
                          borderRadius: 30.0,
                          showOnOff: true,
                          onToggle: (val) {
                            pushNotificationsController.status3.value = val;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
