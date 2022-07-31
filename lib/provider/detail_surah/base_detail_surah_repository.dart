import 'package:quran_app/models/detail_surah_english_models.dart';
import 'package:quran_app/models/detail_surah_models.dart';

abstract class BaseDetailSurahRepository {
  Future<SurahDetailsModels> getDetailSurah(String surahIndex);
  Future<SurahDetailsEnglishModels> getDetailSurahEnglish(String surahIndex);
}
