import 'package:flutter/material.dart';
import 'package:shopping_app/controllers/settingscontroller.dart';
import 'package:get/get.dart';

class MyDivider extends StatelessWidget {
  late Color color;
  MyDivider({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 20,
      thickness: 1,
      endIndent: 0,
      color: color,
    );
  }
}
