import 'dart:convert';

DetailDoaModels detailDoaModelsFromJson(String str) => DetailDoaModels.fromJson(json.decode(str));

String detailDoaModelsToJson(DetailDoaModels data) => json.encode(data.toJson());

class DetailDoaModels {
  DetailDoaModels({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<DetailDoa>? data;

  factory DetailDoaModels.fromJson(Map<String, dynamic> json) => DetailDoaModels(
        code: json["code"],
        message: json["message"],
        data: List<DetailDoa>.from(json["data"].map((x) => DetailDoa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DetailDoa {
  DetailDoa({
    this.idDoa,
    this.nama,
    this.lafal,
    this.transliterasi,
    this.arti,
    this.riwayat,
    this.keterangan,
    this.kataKunci,
  });

  String? idDoa;
  String? nama;
  String? lafal;
  String? transliterasi;
  String? arti;
  String? riwayat;
  dynamic keterangan;
  List<String>? kataKunci;

  factory DetailDoa.fromJson(Map<String, dynamic> json) => DetailDoa(
        idDoa: json["id_doa"],
        nama: json["nama"],
        lafal: json["lafal"],
        transliterasi: json["transliterasi"],
        arti: json["arti"],
        riwayat: json["riwayat"],
        keterangan: json["keterangan"],
        kataKunci: List<String>.from(json["kata_kunci"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id_doa": idDoa,
        "nama": nama,
        "lafal": lafal,
        "transliterasi": transliterasi,
        "arti": arti,
        "riwayat": riwayat,
        "keterangan": keterangan,
        "kata_kunci": List<dynamic>.from(kataKunci!.map((x) => x)),
      };
}
