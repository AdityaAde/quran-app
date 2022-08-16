import 'package:quran_app/models/doa_models.dart';

abstract class BaseDoaRepository {
  Future<ListDoaModels> listDoa();
}
