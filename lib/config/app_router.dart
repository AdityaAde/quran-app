import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../models/surah_models.dart';
import '../screen/screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return SplashScreen.route();
      case '/home':
        return HomeScreen.route();
      case '/detail-surah':
        return DetailSurahScreen.route(arguments: settings.arguments as Tuple2<BuildContext, Datum>);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Something went worng'),
        ),
      ),
    );
  }
}
