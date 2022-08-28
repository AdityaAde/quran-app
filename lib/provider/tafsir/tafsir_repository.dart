import 'dart:convert';

import 'package:quran_app/provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../models/tafsir_models.dart';

class TafsirRepository extends BaseTafsirRepository {
  @override
  Future<TafsirAyahModels> getTafsirAyah(String ayat) async {
    var url = 'https://equran.id/api/tafsir/$ayat';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return TafsirAyahModels.fromJson(result);
      } else {
        return throw Exception('Error get tafsir');
      }
    } catch (e) {
      return throw Exception(e);
    }
  }
}
