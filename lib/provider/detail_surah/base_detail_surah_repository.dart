import '../../models/models.dart';

abstract class BaseDetailSurahRepository {
  Future<List<Ayah>> getDetailSurah(String surahIndex);
  Future<List<AyahOnEnglish>> getDetailSurahEnglish(String surahIndex);
}
