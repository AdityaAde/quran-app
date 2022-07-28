import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key, required this.textTheme, required this.colorScheme}) : super(key: key);

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w500,
            color: colorScheme.onBackground.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/home.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(height: 30),
        Center(
            child: Text(
          'Surah',
          style: textTheme.subtitle1!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        )),
        Divider(
          thickness: 3,
          color: colorScheme.primary,
        ),
      ],
    );
  }
}
