import '../../models/models.dart';

abstract class BaseSurahRepository {
  Future<List<SurahModels>> getSurah();
}
