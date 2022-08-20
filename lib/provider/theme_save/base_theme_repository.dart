// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseThemeManager {
  DatabaseThemeManager._private();

  static DatabaseThemeManager instance = DatabaseThemeManager._private();

  Database? _db;

  Future<Database> get db async {
    _db ??= await _initDB();
    return _db!;
  }

  Future _initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();

    String path = join(docDir.path, "theme.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        return await database.execute('''
        CREATE TABLE theme (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          theme_current TEXT NOT NULL
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

abstract class BaseThemeRepository {
  Future<void> addTheme(String theme);
  Future<List<Map<String, dynamic>>> getTheme();
}
