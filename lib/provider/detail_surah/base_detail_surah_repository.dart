import '../../models/models.dart';

abstract class BaseDetailSurahRepository {
  Future<SurahDetailModels> getDetailSurah(String surahIndex);
}
