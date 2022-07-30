import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/detail_surah_models.dart';
import 'base_detail_surah_repository.dart';

class DetailSurahRepository extends BaseDetailSurahRepository {
  @override
  Future<SurahDetailsModels> getDetailSurah(surahIndex) async {
    String url = 'http://api.alquran.cloud/v1/surah/$surahIndex/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        print('GET DETAIL SURAH OK');
        final result = jsonDecode(response.body);
        return SurahDetailsModels.fromJson(result);
      } else {
        return throw Exception('Error get detail surah');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
