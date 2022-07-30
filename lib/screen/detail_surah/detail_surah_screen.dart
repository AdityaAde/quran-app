import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../models/surah_models.dart';

class DetailSurahScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: _appBarCustom(context, textTheme, colorScheme, arguments!.item2.englishName!),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Stack(
            children: [
              Image.asset(
                'assets/images/detail-surah.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1 + 10,
                right: MediaQuery.of(context).size.width / 2 - 123,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  child: Column(
                    children: [
                      Text(
                        arguments!.item2.englishName!,
                        style: textTheme.headline3!.copyWith(color: colorScheme.background),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        arguments!.item2.englishNameTranslation!,
                        style: textTheme.headline3!.copyWith(
                          color: colorScheme.background,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 250,
                        child: Divider(
                          thickness: 1,
                          color: colorScheme.background.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text('${arguments!.item2.numberOfAyahs!.toString()} VERSES',
                          style: textTheme.headline4!.copyWith(color: colorScheme.background))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: colorScheme.onBackground.withOpacity(0.5),
            ))
      ],
    );
  }
}
