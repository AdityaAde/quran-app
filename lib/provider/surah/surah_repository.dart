import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_surah_repository.dart';

import '../../models/surah_models.dart';

class SurahRepository extends BaseSurahRepository {
  @override
  Future<SurahModels> getSurah() async {
    final response = await http.get(Uri.parse('http://api.alquran.cloud/v1/surah'));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return SurahModels.fromJson(result);
      } else {
        return throw Exception('Error get surah');
      }
    } catch (e) {
      throw Exception('Error get surah $e');
    }
  }
}
