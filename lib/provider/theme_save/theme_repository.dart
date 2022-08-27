import 'package:sqflite/sqflite.dart';
import '../provider.dart';

/// Create [ThemeRepository] sebagai prosess penyimpanan tema

class ThemeRepository extends BaseThemeRepository {
  DatabaseThemeManager database = DatabaseThemeManager.instance;
  @override
  Future<void> addTheme(String theme, bool themeFlag) async {
    Database db = await database.db;

    if (themeFlag == true) {
      await db.delete("theme", where: "theme_flag = 1");
    }

    await db.insert("theme", {
      "theme_current": theme,
      "theme_flag": themeFlag == true ? 1 : 0,
    });

    /* var data = await db.query("theme");
    print(data); */
  }

  /// Fungsi untuk mendapatkan kondisi tema saat ini
  @override
  Future<Map<String, dynamic>?> getTheme() async {
    Database db = await database.db;
    final List<Map<String, dynamic>> theme = await db.query("theme", where: "theme_flag = 1");
    if (theme.isEmpty) {
      return {
        'theme_current': 'light',
        'theme_flag': 1,
      };
    } else {
      return theme.first;
    }
  }
}
