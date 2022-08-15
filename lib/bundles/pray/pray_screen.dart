import 'package:flutter/material.dart';

import '../../components/components.dart';

class PrayScreen extends StatelessWidget {
  const PrayScreen({Key? key}) : super(key: key);

  static const String routeName = '/pray';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PrayScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        'Doa - Doa',
        textTheme,
        colorScheme,
        const SizedBox(),
      ),
    );
  }
}
