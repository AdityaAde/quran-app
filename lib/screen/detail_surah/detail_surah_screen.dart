import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'widget/widget.dart';
import '../../components/components.dart';
import '../../provider/detail_surah/detail_surah.dart';
import '../../models/detail_surah_english_models.dart';
import '../../models/detail_surah_models.dart';
import '../../models/surah_models.dart';

class DetailSurahScreen extends StatefulWidget {
  const DetailSurahScreen({Key? key, this.arguments}) : super(key: key);

  final Tuple2<BuildContext, Datum>? arguments;

  static const String routeName = '/detail-surah';
  static Route route({required Tuple2<BuildContext, Datum>? arguments}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => DetailSurahScreen(arguments: arguments),
    );
  }

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  SurahDetailsModels surahDetails = SurahDetailsModels();
  SurahDetailsEnglishModels surahDetailsEnglish = SurahDetailsEnglishModels();
  final DetailSurahRepository _detailSurahRepository = DetailSurahRepository();

  List<Ayah> ayahs = [];
  List<AyahOnEnglish> ayahOnEnglish = [];

  bool isLoading = false;

  Future<SurahDetailsModels> _getDetailSurah() async {
    surahDetails = await _detailSurahRepository.getDetailSurah(widget.arguments!.item2.number.toString());
    setState(() {
      surahDetails.code == 200 ? isLoading = true : isLoading = false;
      for (var element in surahDetails.data!.ayahs!) {
        ayahs.add(element);
      }
    });
    return surahDetails;
  }

  Future<SurahDetailsEnglishModels> _getDetailSurahOnEnglish() async {
    surahDetailsEnglish = await _detailSurahRepository.getDetailSurahEnglish(widget.arguments!.item2.number.toString());
    (widget.arguments!.item2.number.toString());
    setState(() {
      for (var element in surahDetailsEnglish.data!.ayahs!) {
        ayahOnEnglish.add(element);
      }
    });
    return surahDetailsEnglish;
  }

  @override
  void initState() {
    super.initState();
    _getDetailSurah();
    _getDetailSurahOnEnglish();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(widget.arguments!.item2.englishName!, textTheme, colorScheme, context),
      body: isLoading
          ? Column(
              children: [
                const SizedBox(height: 15),
                HeaderTitleSurah(
                  arguments: widget.arguments,
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
                DetailSurahBody(
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                  surah: ayahs,
                  surahOnEnglish: ayahOnEnglish,
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
