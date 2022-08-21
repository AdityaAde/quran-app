import 'package:quran_app/models/models.dart';

abstract class BaseDetailDoaRepository {
  Future<DetailDoaModels> getDetailDoa(String id);
}
