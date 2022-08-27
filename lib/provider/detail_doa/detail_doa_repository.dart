import 'dart:convert';

import 'package:quran_app/provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../models/models.dart';

/// Create [DetailDoaRepository] sebagai proses untuk mendapatkan
/// Detail doa

class DetailDoaRepository extends BaseDetailDoaRepository {
  @override
  Future<DetailDoaModels> getDetailDoa(String id) async {
    String url = 'https://tanyadoa-api.herokuapp.com/show/$id';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return DetailDoaModels.fromJson(result);
      } else {
        return throw Exception('Get detail doa error');
      }
    } catch (e) {
      return throw Exception(e);
    }
  }
}
