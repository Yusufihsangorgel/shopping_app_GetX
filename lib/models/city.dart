// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.plaka,
    required this.il,
    required this.ilce,
    required this.semtBucakBelde,
    required this.mahalle,
    required this.pk,
  });

  String plaka;
  Il? il;
  String ilce;
  String semtBucakBelde;
  String mahalle;
  String pk;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        plaka: json["plaka"],
        il: ilValues.map[json["il"]],
        ilce: json["ilce"],
        semtBucakBelde: json["semt_bucak_belde"],
        mahalle: json["mahalle"],
        pk: json["pk"],
      );

  Map<String, dynamic> toJson() => {
        "plaka": plaka,
        "il": ilValues.reverse[il],
        "ilce": ilce,
        "semt_bucak_belde": semtBucakBelde,
        "mahalle": mahalle,
        "pk": pk,
      };
}

enum Il { STANBUL }

final ilValues = EnumValues({"İSTANBUL": Il.STANBUL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
