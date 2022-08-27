import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/components.dart';
import '../../bundles.dart';

/// Widget body dari WelcomeScreen

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _headline(textTheme, colorScheme),
          SizedBox(
            height: 450,
            width: 314,
            child: Image.asset(
              'assets/images/splash-screen.png',
            ),
          ),
          const SizedBox(height: 30),
          _navigationButton(colorScheme, textTheme, context),
        ],
      ),
    );
  }

  Widget _headline(TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          'My Quran',
          style: textTheme.headline1!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Yuk belajar dan \n membaca Al-Qur\'an',
          textAlign: TextAlign.center,
          style: textTheme.headline3!
              .copyWith(fontWeight: FontWeight.w400, color: colorScheme.onBackground.withOpacity(0.5)),
        ),
        const SizedBox(height: 45),
      ],
    );
  }

  Widget _navigationButton(ColorScheme colorScheme, TextTheme textTheme, BuildContext context) {
    return InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 60,
          width: 185,
          child: Center(
            child: Text(
              'Mulai',
              style: textTheme.headline4!.copyWith(color: colorScheme.background),
            ),
          ),
        ),
        onTap: () async {
          Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: const HomeScreen()), (route) => false);
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('onboarding', true);
        });
  }
}
