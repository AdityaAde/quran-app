// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:quran_app/models/detail_surah_models.dart';
import 'package:sqflite/sqflite.dart';

/// Create [DatabaseManager] sebagai class untuk membuat TABLE
/// penyimpanan data bookmark

class DatabaseManager {
  DatabaseManager._private();

  static DatabaseManager instance = DatabaseManager._private();

  Database? _db;

  Future<Database> get db async {
    _db ??= await _initDB();
    return _db!;
  }

  Future _initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();

    String path = join(docDir.path, "bookmark.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        return await database.execute('''
          CREATE TABLE bookmark (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            nomor_surah TEXT NOT NULL,
            surah TEXT NOT NULL,
            ayat INTEGER NOT NULL,
            arti TEXT NOT NULL,
            deskripsi TEXT NOT NULL,
            audio TEXT NOT NULL,
            via TEXT NOT NULL,
            index_ayat INTEGER NOT NULL,
            last_read INTEGER DEFAULT 0
          )
          ''');
      },
    );
  }

  Future closeDB() async {
    _db = await instance.db;
    _db!.close();
  }
}

abstract class BaseBookmarkRepository {
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
  );
  Future<List<Map<String, dynamic>>> getBookmark();
  Future<void> deleteBookmark(int id);
  Future<Map<String, dynamic>?> getLastRead();
}
