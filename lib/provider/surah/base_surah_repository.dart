import 'package:quran_app/models/surah_models.dart';

abstract class BaseSurahRepository {
  Future<SurahModels> getSurah();
}
