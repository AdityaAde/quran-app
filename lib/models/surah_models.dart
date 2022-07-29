// To parse this JSON data, do
//
//     final surahModels = surahModelsFromJson(jsonString);

import 'dart:convert';

SurahModels surahModelsFromJson(String str) => SurahModels.fromJson(json.decode(str));

String surahModelsToJson(SurahModels data) => json.encode(data.toJson());

class SurahModels {
  SurahModels({
    this.code,
    this.status,
    this.data,
  });

  int? code;
  String? status;
  List<Datum>? data;

  factory SurahModels.fromJson(Map<String, dynamic> json) => SurahModels(
        code: json["code"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
  });

  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        numberOfAyahs: json["numberOfAyahs"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "numberOfAyahs": numberOfAyahs,
      };
}
