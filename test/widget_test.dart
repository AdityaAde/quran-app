// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:http/http.dart' as http;
import 'package:quran_app/provider/surah/surah_repository.dart';
import 'package:quran_app/provider/detail_surah/detail_surah_repository.dart';

void main() async {
  SurahRepository surahRepository = SurahRepository();
  await surahRepository.getSurah();

  DetailSurahRepository detailSurahRepository = DetailSurahRepository();
  await detailSurahRepository.getDetailSurah('114');

  http.Response listDoa = await getDoa();
  print(listDoa.statusCode);

  http.Response detailDoa = await getDetailDoa(1);
  print(detailDoa.statusCode);
}

Future<http.Response> getDoa() async {
  var url = 'https://tanyadoa-api.herokuapp.com/all';
  var response = await http.get(Uri.parse(url));
  return response;
}

Future<http.Response> getDetailDoa(int id) async {
  var url = 'https://tanyadoa-api.herokuapp.com/show/$id';
  var response = await http.get(Uri.parse(url));
  return response;
}
