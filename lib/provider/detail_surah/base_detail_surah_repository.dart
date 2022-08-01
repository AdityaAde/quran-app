import 'package:quran_app/models/detail_surah_english_models.dart';
import 'package:quran_app/models/detail_surah_models.dart';

abstract class BaseDetailSurahRepository {
  Future<List<Ayah>> getDetailSurah(String surahIndex);
  Future<List<AyahOnEnglish>> getDetailSurahEnglish(String surahIndex);
}
