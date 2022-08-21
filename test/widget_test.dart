import 'package:http/http.dart' as http;
import 'package:quran_app/provider/surah/surah_repository.dart';
import 'package:quran_app/provider/detail_surah/detail_surah_repository.dart';

void main() async {
  SurahRepository surahRepository = SurahRepository();
  await surahRepository.getSurah();

  DetailSurahRepository detailSurahRepository = DetailSurahRepository();
  await detailSurahRepository.getDetailSurah('114');

  await getDoa();
  await getDetailDoa(1);
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
