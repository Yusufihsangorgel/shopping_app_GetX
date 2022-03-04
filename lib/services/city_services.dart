import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shopping_app/models/city.dart';

var dio = Dio();

Future<List<Postakodu>?> getPostCode() async {
  var response = await dio.get("https://api.ubilisim.com/postakodu/il/34");
  debugPrint(response.data['postakodu'].toString());
  List<Postakodu> _postCodeList = [];
  if (response.statusCode == 200) {
    _postCodeList = (response.data['postakodu'] as List)
        .map((e) => Postakodu.fromJson(e))
        .toList();
    return _postCodeList;
  } else {
    debugPrint(response.statusMessage);
    return null;
  }
}
