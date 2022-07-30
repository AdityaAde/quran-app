import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../models/surah_models.dart';
import '../../provider/surah/surah_repository.dart';
import 'widget/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  SurahModels listSurah = SurahModels();
  SurahRepository listSurahProvider = SurahRepository();
  Future<SurahModels> getListSurah() async {
    listSurah = await listSurahProvider.getSurah();
    setState(() {
      listSurah.code != 200 ? isLoading = false : isLoading = true;
    });
    return listSurah;
  }

  @override
  void initState() {
    super.initState();
    getListSurah();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: _appBarCustom(textTheme, colorScheme),
      body: isLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  HeaderHome(
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                        itemCount: listSurah.data!.length,
                        itemBuilder: (context, index) {
                          final surah = listSurah.data![index];
                          return Column(
                            children: [
                              const SizedBox(height: 10),
                              SurahTile(
                                surahIndex: surah.number!,
                                textTheme: textTheme,
                                colorScheme: colorScheme,
                                surahEnglishName: surah.englishName!,
                                ayahSurah: surah.numberOfAyahs!,
                                surahArabName: surah.name!,
                                onTap: () {
                                  final Tuple2<BuildContext, Datum> arguments = Tuple2(context, surah);
                                  Navigator.pushNamed(context, '/detail-surah', arguments: arguments);
                                },
                              ),
                              const SizedBox(height: 8),
                              Divider(
                                thickness: 1,
                                color: colorScheme.onBackground.withOpacity(0.1),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  PreferredSizeWidget _appBarCustom(TextTheme textTheme, ColorScheme colorScheme) {
    return AppBar(
      title: Text(
        'Quran App',
        style: textTheme.headline4!.copyWith(color: colorScheme.primary),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: colorScheme.onBackground.withOpacity(0.5),
            ))
      ],
    );
  }
}
