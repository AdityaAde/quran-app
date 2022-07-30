import 'package:quran_app/models/detail_surah_models.dart';

abstract class BaseDetailSurahRepository {
  Future<SurahDetailsModels> getDetailSurah(String surahIndex);
}
