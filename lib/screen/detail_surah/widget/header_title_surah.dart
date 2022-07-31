import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../models/surah_models.dart';

class HeaderTitleSurah extends StatelessWidget {
  const HeaderTitleSurah({
    Key? key,
    required this.arguments,
    required this.textTheme,
    required this.colorScheme,
  }) : super(key: key);

  final Tuple2<BuildContext, Datum>? arguments;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
