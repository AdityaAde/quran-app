import 'package:flutter/material.dart';
import 'widget/welcome_screen_body.dart';

/// [WelcomeScreen] Halaman yang akan tampil hanya sekali pada saat
/// Aplikasi pertama kali di jalankan.

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/welcome';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WelcomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeScreenBody(),
    );
  }
}
