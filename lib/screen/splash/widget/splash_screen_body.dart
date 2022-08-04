import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
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
            ],
          ),
        ),
        _navigationButton(colorScheme, textTheme, context),
      ],
    );
  }

  Widget _headline(TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          'Quran App',
          style: textTheme.headline1!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Learn Quran and \n Recite once everyday',
          textAlign: TextAlign.center,
          style: textTheme.headline3!
              .copyWith(fontWeight: FontWeight.w400, color: colorScheme.onBackground.withOpacity(0.5)),
        ),
        const SizedBox(height: 45),
      ],
    );
  }

  Widget _navigationButton(ColorScheme colorScheme, TextTheme textTheme, BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height / 5 - 80,
      right: 105,
      child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(30),
            ),
            height: 60,
            width: 185,
            child: Center(
              child: Text(
                'Get Started',
                style: textTheme.headline4!.copyWith(color: colorScheme.background),
              ),
            ),
          ),
          onTap: () {
            context.read<ListSurahBloc>().add(GetSurahEvent());
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          }),
    );
  }
}
