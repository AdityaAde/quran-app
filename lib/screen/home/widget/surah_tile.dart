import 'package:flutter/material.dart';

class SurahTile extends StatelessWidget {
  const SurahTile({
    Key? key,
    required this.textTheme,
    required this.colorScheme,
    required this.surahIndex,
    required this.surahEnglishName,
    required this.ayahSurah,
    required this.surahArabName,
    this.onTap,
  }) : super(key: key);

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final int surahIndex;
  final String surahEnglishName;
  final int ayahSurah;
  final String surahArabName;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Image.asset('assets/images/border.png'),
                Positioned(
                  bottom: 8,
                  left: (surahIndex < 10
                      ? 16
                      : surahIndex <= 99
                          ? 13
                          : 11),
                  child: Text(surahIndex.toString(), style: textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
                ),
              ]),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    surahEnglishName,
                    style: textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '$ayahSurah Ayat',
                    style: textTheme.bodyText1!.copyWith(
                      color: colorScheme.onBackground.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                surahArabName,
                style: textTheme.bodyText1!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
