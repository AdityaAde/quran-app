import 'dart:convert';
import 'package:http/http.dart' as http;

import 'base_detail_surah_repository.dart';
import '../../models/models.dart';

/// Create [DetailSurahRepository] sebagai proses untuk mendapatkan
/// Detail dari surah

class DetailSurahRepository extends BaseDetailSurahRepository {
  @override
  Future<SurahDetailModels> getDetailSurah(surahIndex) async {
    String url = 'https://equran.id/api/surat/$surahIndex';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return SurahDetailModels.fromJson(result);
      } else {
        return throw Exception('Error get detail surah');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
