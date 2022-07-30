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
        const SizedBox(height: 30),
        Stack(
          children: [
            Image.asset(
              'assets/images/home.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              top: 50,
              left: 13,
              child: RichText(
                text: TextSpan(
                  text: 'Assalamualaikum, \n',
                  style: textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.background.withOpacity(0.7),
                    fontSize: 17,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Aditya Ade',
                      style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.background,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
