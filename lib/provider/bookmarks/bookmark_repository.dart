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
  }

  @override
  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.db;
    final List<Map<String, dynamic>> allBookmarks = await db.query("bookmark", where: "last_read = 0");
    return allBookmarks;
  }
}
