import 'dart:convert';

import 'package:quran_app/models/doa_models.dart';
import 'package:quran_app/provider/doa/base_doa_repository.dart';
import 'package:http/http.dart' as http;

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
