import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/surah_models.dart';
import 'base_surah_repository.dart';

import '../../config/config.dart';

class SurahRepository extends BaseSurahRepository {
  @override
  Future<SurahModels> getSurah() async {
    final response = await http.get(Uri.parse(Config.listSurahUrl));
    try {
      if (response.statusCode == 200) {
        print("GET ALL SURAH OK");
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
