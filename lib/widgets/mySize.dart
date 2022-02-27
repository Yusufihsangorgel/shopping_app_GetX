import 'package:flutter/material.dart';

class MySize extends StatelessWidget {
  late double height;
  late double width;
  MySize({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
