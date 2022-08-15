import 'package:flutter/material.dart';
import 'widget/loading_screen_body.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoadingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingScreenBody(),
    );
  }
}
