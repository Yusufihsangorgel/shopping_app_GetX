// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.success,
    required this.status,
    required this.dataupdatedate,
    required this.description,
    required this.pagecreatedate,
    required this.postakodu,
  });

  bool success;
  String status;
  DateTime dataupdatedate;
  String description;
  DateTime pagecreatedate;
  List<Postakodu> postakodu;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        success: json["success"],
        status: json["status"],
        dataupdatedate: DateTime.parse(json["dataupdatedate"]),
        description: json["description"],
        pagecreatedate: DateTime.parse(json["pagecreatedate"]),
        postakodu: List<Postakodu>.from(
            json["postakodu"].map((x) => Postakodu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "dataupdatedate":
            "${dataupdatedate.year.toString().padLeft(4, '0')}-${dataupdatedate.month.toString().padLeft(2, '0')}-${dataupdatedate.day.toString().padLeft(2, '0')}",
        "description": description,
        "pagecreatedate": pagecreatedate.toIso8601String(),
        "postakodu": List<dynamic>.from(postakodu.map((x) => x.toJson())),
      };
}

class Postakodu {
  Postakodu({
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

  factory Postakodu.fromJson(Map<String, dynamic> json) => Postakodu(
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
