import 'dart:convert';

SurahDetailModels surahDetailModelsFromJson(String str) => SurahDetailModels.fromJson(json.decode(str));

String surahDetailModelsToJson(SurahDetailModels data) => json.encode(data.toJson());

class SurahDetailModels {
  SurahDetailModels({
    this.status,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  bool? status;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  List<Ayat>? ayat;
  SuratSelanjutnya? suratSelanjutnya;
  bool? suratSebelumnya;

  factory SurahDetailModels.fromJson(Map<String, dynamic> json) => SurahDetailModels(
        status: json["status"],
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
        ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
        suratSelanjutnya: SuratSelanjutnya.fromJson(json["surat_selanjutnya"]),
        suratSebelumnya: json["surat_sebelumnya"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "ayat": List<dynamic>.from(ayat!.map((x) => x.toJson())),
        "surat_selanjutnya": suratSelanjutnya!.toJson(),
        "surat_sebelumnya": suratSebelumnya,
      };
}

class Ayat {
  Ayat({
    this.id,
    this.surah,
    this.nomor,
    this.ar,
    this.tr,
    this.idn,
  });

  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}

class SuratSelanjutnya {
  SuratSelanjutnya({
    this.id,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  int? id;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) => SuratSelanjutnya(
        id: json["id"],
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}
