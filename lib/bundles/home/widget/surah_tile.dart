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
              CircleAvatar(
                backgroundImage: const AssetImage('assets/images/border.png'),
                radius: 17,
                backgroundColor: Colors.transparent,
                child: Text(
                  surahIndex.toString(),
                  style: textTheme.bodyText2,
                ),
              ),
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
