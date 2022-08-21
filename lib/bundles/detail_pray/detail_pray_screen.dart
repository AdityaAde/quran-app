import 'package:flutter/material.dart';

import '../../components/components.dart';

class DetailPrayScreen extends StatelessWidget {
  const DetailPrayScreen({Key? key}) : super(key: key);

  static const String routeName = '/detail-doa';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const DetailPrayScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        'Doa Sebelum Tidur',
        textTheme,
        colorScheme,
        const SizedBox(),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'بِاسْمِكَ اللَّهُمَّ أَمُوْتُ وَأَحْيَا',
                      style: textTheme.bodyLarge!.copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Bismika-llaahumma amuutu wa ahyaa.',
                    style: textTheme.bodyLarge!.copyWith(color: colorScheme.secondaryContainer),
                  ),
                  Text(
                    "Dengan Nama-Mu ya Allah, aku mati dan aku hidup.",
                    style: textTheme.bodyLarge,
                  ),
                  Text(
                    'HR. Bukhari 6324',
                    style: textTheme.bodyLarge,
                  )
                ],
              ),
            );
          }),
    );
  }
}
