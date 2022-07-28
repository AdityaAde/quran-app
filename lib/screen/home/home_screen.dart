import 'package:flutter/material.dart';

import 'widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: _appBarCustom(textTheme, colorScheme),
      body: Padding(
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        SurahTile(
                          surahIndex: index + 1,
                          textTheme: textTheme,
                          colorScheme: colorScheme,
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
      ),
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
