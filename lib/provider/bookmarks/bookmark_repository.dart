import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/models.dart';
import 'base_bookmark_repository.dart';

class BookmarkRepository extends BaseBookmarkRepository {
  // Objek yang digunakan untuk melakukan auto scroll
  AutoScrollController autoScroll = AutoScrollController();

  /// Objek yang digunakan untuk mendapatkan turunan di [DatabaseManager]
  DatabaseManager database = DatabaseManager.instance;

  /// Override [addBookmark] yang digunakan untuk menambahkan data kedalam bookmark
  /// kedalam lokal database
  @override
  Future<void> addBookmark(
    bool lastRead,
    String nomorSurah,
    String namaSurah,
    Ayat surah,
    String arti,
    String deskripsi,
    String audio,
    int indexAyat,
    BuildContext context,
  ) async {
    Database db = await database.db;
    bool flagExist = false;

    /// Kondisi apabila lastread yang ada pada lokal database bernilai TRUE
    if (lastRead == true) {
      await db.delete("bookmark", where: "last_read = 1");
    } else {
      List checkData = await db.query(
        "bookmark",
        columns: ["surah", "ayat", "arti", "deskripsi", "audio", "via", "index_ayat", "last_read"],
        where:
            "surah = '${namaSurah.replaceAll("'", "+")}' and ayat = ${surah.nomor} and via = 'surah' and index_ayat = $indexAyat and last_read = 0 ",
      );
      if (checkData.isNotEmpty) {
        // Terdapat data yang sama di dalam lokal database
        flagExist = true;
      }
    }

    /// Kondisi apabila tidak ada data yang sama pada lokal database
    /// maka akan melakukan INSERT pada database
    if (flagExist == false) {
      await db.insert("bookmark", {
        "nomor_surah": nomorSurah,
        "surah": namaSurah.replaceAll("'", "+"),
        "ayat": surah.nomor,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "via": "surah",
        "index_ayat": indexAyat,
        "last_read": lastRead == true ? 1 : 0,
      });
    }
    /* var data = await db.query("bookmark");
    print(data); */
  }

  /// Override [getBookmark] yang digunakan untuk mendapatkan data bookmark
  /// di dalam lokal database
  @override
  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.db;
    final List<Map<String, dynamic>> allBookmarks = await db.query(
      "bookmark",
      where: "last_read = 0",
      orderBy: "surah",
    );
    return allBookmarks;
  }

  /// Override [deleteBookmark] yang digunakan untuk menghapus data bookmark
  /// di dalam lokal database
  @override
  Future<void> deleteBookmark(int id) async {
    Database db = await database.db;
    await db.delete("bookmark", where: "id = $id");
  }

  /// Override [getLastRead] yang digunakan untuk mendapatkan data last read
  /// di dalam lokal database
  @override
  Future<Map<String, dynamic>?> getLastRead() async {
    Database db = await database.db;
    final List<Map<String, dynamic>> dataLastRead = await db.query("bookmark", where: "last_read = 1");
    if (dataLastRead.isEmpty) {
      // Tidak ada data lastread
      return null;
    } else {
      return dataLastRead.first;
    }
  }
}
