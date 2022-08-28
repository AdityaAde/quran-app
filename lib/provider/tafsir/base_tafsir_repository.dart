import 'package:quran_app/models/tafsir_models.dart';

abstract class BaseTafsirRepository {
  Future<TafsirAyahModels> getTafsirAyah(String ayat);
}
