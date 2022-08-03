import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_surah_repository.dart';

import '../../models/surah_models.dart';

class SurahRepository extends BaseSurahRepository {
  @override
  Future<List<SurahModels>> getSurah() async {
    final response = await http.get(Uri.parse('https://equran.id/api/surat'));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final data = result as List;
        List<SurahModels> listSurah = data.map((surah) => SurahModels.fromJson(surah)).toList();
        return listSurah;
      } else {
        return throw Exception('Error get surah');
      }
    } catch (e) {
      throw Exception('Error get surah $e');
    }
  }
}
