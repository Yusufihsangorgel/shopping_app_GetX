// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Postakodu productFromJson(String str) => Postakodu.fromJson(json.decode(str));

String productToJson(Postakodu data) => json.encode(data.toJson());

class Postakodu {
  Postakodu({
    required this.plaka,
    required this.il,
    required this.ilce,
    required this.semtBucakBelde,
    required this.mahalle,
    required this.pk,
  });

  String? plaka;
  String? il;
  String? ilce;
  String? semtBucakBelde;
  String? mahalle;
  String? pk;

  Postakodu.fromJson(Map<String, dynamic> json) {
    plaka = json['plaka'];
    il = json['il'];
    ilce = json['ilce'];
    semtBucakBelde = json['semt_bucak_belde'];
    mahalle = json['mahalle'];
    pk = json['pk'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plaka'] = this.plaka;
    data['il'] = this.il;
    data['ilce'] = this.ilce;
    data['semt_bucak_belde'] = this.semtBucakBelde;
    data['mahalle'] = this.mahalle;
    data['pk'] = this.pk;
    return data;
  }
}
