import 'package:flutter/material.dart';
import 'package:quran_app/models/models.dart';
import 'package:quran_app/provider/bookmarks/base_bookmark_repository.dart';
import 'package:sqflite/sqflite.dart';

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

    var data = await db.query("bookmark");
    print(data);
  }

  @override
  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.db;
    final List<Map<String, dynamic>> allBookmarks = await db.query("bookmark", where: "last_read = 0");
    return allBookmarks;
  }
}
