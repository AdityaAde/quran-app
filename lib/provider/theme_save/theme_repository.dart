import 'package:quran_app/provider/theme_save/base_theme_repository.dart';
import 'package:sqflite/sqflite.dart';

class ThemeRepository extends BaseThemeRepository {
  DatabaseThemeManager database = DatabaseThemeManager.instance;
  @override

  ///TODO: BUG pada bagian ganti tema => data string berbentuk LIST yang menumpuk mengakibatkan aplikasi bengkak
  Future<void> addTheme(String theme) async {
    Database db = await database.db;
    await db.insert("theme", {
      "theme_current": theme,
    });

    var data = await db.query("theme");
    print(data);
  }

  @override
  Future<List<Map<String, dynamic>>> getTheme() async {
    Database db = await database.db;
    List<Map<String, dynamic>> theme = await db.query("theme");

    return theme;
  }
}
