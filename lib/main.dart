import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/screens/homeScreen.dart';
import 'package:shopping_app/screens/loginScreen.dart';

void main() {
  runApp(Shopping());
}

class Shopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
