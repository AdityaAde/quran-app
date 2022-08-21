import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/models.dart';
import 'base_bookmark_repository.dart';

class BookmarkRepository extends BaseBookmarkRepository {
  DatabaseManager database = DatabaseManager.instance;
  @override
  Future<void> addBookmark(bool lastRead, String namaSurah, Ayat surah, int indexAyat, BuildContext context) async {
    Database db = await database.db;
    bool flagExist = false;

    if (lastRead == true) {
      await db.delete("bookmark", where: "last_read = 1");
    } else {
      List checkData = await db.query(
        "bookmark",
        columns: ["surah", "ayat", "via", "index_ayat", "last_read"],
        where:
            "surah = '${namaSurah.replaceAll("'", "+")}' and ayat = ${surah.nomor} and via = 'surah' and index_ayat = $indexAyat and last_read = 0 ",
      );
      if (checkData.isNotEmpty) {
        // Ada data
        flagExist = true;
      }
    }

    if (flagExist == false) {
      await db.insert("bookmark", {
        "surah": namaSurah.replaceAll("'", "+"),
        "ayat": surah.nomor,
        "via": "surah",
        "index_ayat": indexAyat,
        "last_read": lastRead == true ? 1 : 0,
      });
    }
    /*  var data = await db.query("bookmark");
    print(data); */
  }

  @override
  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.db;
    final List<Map<String, dynamic>> allBookmarks = await db.query("bookmark", where: "last_read = 0");
    return allBookmarks;
  }

  @override
  Future<void> deleteBookmark(int id) async {
    Database db = await database.db;
    await db.delete("bookmark", where: "id = $id");
  }

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
