import 'package:flutter/material.dart';
import 'package:quran_app/models/detail_surah_english_models.dart';
import 'package:quran_app/models/detail_surah_models.dart';
import 'package:quran_app/provider/detail_surah/detail_surah.dart';
import 'package:tuple/tuple.dart';

import 'widget/detail_surah_body.dart';
import 'widget/header_title_surah.dart';
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
      appBar: _appBarCustom(context, textTheme, colorScheme, widget.arguments!.item2.englishName!),
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

  PreferredSizeWidget _appBarCustom(
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
    String title,
  ) {
    return AppBar(
      title: Text(
        title,
        style: textTheme.headline4!.copyWith(color: colorScheme.primary),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          )),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Not implemented yet.')),
              );
            },
            icon: Icon(
              Icons.search,
              color: colorScheme.onBackground.withOpacity(0.5),
            ))
      ],
    );
  }
}
