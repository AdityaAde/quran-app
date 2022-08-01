import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/detail_surah_english_models.dart';
import 'package:quran_app/models/detail_surah_models.dart';
import 'base_detail_surah_repository.dart';

class DetailSurahRepository extends BaseDetailSurahRepository {
  @override
  Future<List<Ayah>> getDetailSurah(surahIndex) async {
    String url = 'http://api.alquran.cloud/v1/surah/$surahIndex/ar.alafasy';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final detailSurah = ((result as Map<String, dynamic>)['data']['ayahs'] as List)
            .map(
              (e) => Ayah.fromJson(e),
            )
            .toList();
        return detailSurah;
      } else {
        return throw Exception('Error get detail surah');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AyahOnEnglish>> getDetailSurahEnglish(String surahIndex) async {
    String url = 'http://api.alquran.cloud/v1/surah/$surahIndex/en.asad';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final detailSurah = ((result as Map<String, dynamic>)['data']['ayahs'] as List)
            .map(
              (e) => AyahOnEnglish.fromJson(e),
            )
            .toList();
        return detailSurah;
      } else {
        return throw Exception('Error get detail surah');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
