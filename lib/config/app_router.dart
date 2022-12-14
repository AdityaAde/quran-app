import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../bundles/bundles.dart';

/// Create [AppRouter] Data class for storing application's routes and navigationBar's configuration.
class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/welcome':
        return WelcomeScreen.route();
      case '/detail-surah':
        return DetailSurahScreen.route(tuple: settings.arguments as Tuple5<String, String, String, String, String>);
      case '/bookmarks':
        return BookmarkScreen.route();
      case '/pray':
        return PrayScreen.route();
      case '/detail-doa':
        return DetailPrayScreen.route(arguments: settings.arguments as Tuple2<BuildContext, String>);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const Scaffold(
        body: Center(child: Text('Something went wrong')),
      ),
    );
  }
}
