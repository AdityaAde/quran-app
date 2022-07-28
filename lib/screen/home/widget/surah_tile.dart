import 'package:flutter/material.dart';

class SurahTile extends StatelessWidget {
  const SurahTile({
    Key? key,
    required this.textTheme,
    required this.colorScheme,
    required this.surahIndex,
  }) : super(key: key);

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final int surahIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Image.asset('assets/images/border.png'),
              Positioned(
                bottom: 8,
                left: 14,
                child: Text(surahIndex.toString(), style: textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
              ),
            ]),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Al-Fatiha',
                  style: textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'MECCAN \u00b7 7 VERSES',
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
              'الفاتحة',
              style: textTheme.bodyText1!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
