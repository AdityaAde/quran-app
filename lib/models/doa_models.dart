/// Create [ListDoaModels] sebagai data model untuk menampung
/// data dari List Doa

class ListDoaModels {
  ListDoaModels({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<DataDoa>? data;

  factory ListDoaModels.fromJson(Map<String, dynamic> json) => ListDoaModels(
        code: json["code"],
        message: json["message"],
        data: List<DataDoa>.from(json["data"].map((x) => DataDoa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataDoa {
  DataDoa({
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

  factory DataDoa.fromJson(Map<String, dynamic> json) => DataDoa(
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
