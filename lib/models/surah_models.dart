/// Create [SurahModels] sebagai data model untuk menampung
/// data dari List Surah

class SurahModels {
  SurahModels({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? arti;
  String? deskripsi;
  String? audio;

  factory SurahModels.fromJson(Map<String, dynamic> json) => SurahModels(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}
