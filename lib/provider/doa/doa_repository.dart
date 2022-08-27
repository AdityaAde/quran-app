import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/models.dart';
import 'base_doa_repository.dart';

/// Create [DoaRepository] sebagai proses untuk mendapatkan
/// list dari doa-doa

class DoaRepository extends BaseDoaRepository {
  @override
  Future<ListDoaModels> listDoa() async {
    const String url = 'https://tanyadoa-api.herokuapp.com/all';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return ListDoaModels.fromJson(result);
      } else {
        return throw Exception('Error get list doa');
      }
    } catch (e) {
      return throw Exception(e);
    }
  }
}
