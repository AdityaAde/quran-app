import 'package:http/http.dart' as http;
import 'package:quran_app/provider/provider.dart';

void main() async {
  SurahRepository surahRepository = SurahRepository();
  await surahRepository.getSurah();

  DetailSurahRepository detailSurahRepository = DetailSurahRepository();
  await detailSurahRepository.getDetailSurah('114');

  DetailDoaRepository detailDoaRepository = DetailDoaRepository();
  await detailDoaRepository.getDetailDoa('1');

  TafsirRepository tafsirRepository = TafsirRepository();
  await tafsirRepository.getTafsirAyah('1');

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
