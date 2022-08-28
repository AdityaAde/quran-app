class TafsirAyahModels {
  TafsirAyahModels({
    this.status,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.tafsir,
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
  List<Tafsir>? tafsir;

  factory TafsirAyahModels.fromJson(Map<String, dynamic> json) => TafsirAyahModels(
        status: json["status"],
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
        tafsir: List<Tafsir>.from(json["tafsir"].map((x) => Tafsir.fromJson(x))),
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
        "tafsir": List<dynamic>.from(tafsir!.map((x) => x.toJson())),
      };
}

class Tafsir {
  Tafsir({
    this.id,
    this.surah,
    this.ayat,
    this.tafsir,
  });

  int? id;
  int? surah;
  int? ayat;
  String? tafsir;

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
        surah: json["surah"],
        ayat: json["ayat"],
        tafsir: json["tafsir"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "ayat": ayat,
        "tafsir": tafsir,
      };
}
