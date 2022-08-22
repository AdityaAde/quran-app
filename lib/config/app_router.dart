import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../bundles/bundles.dart';
import '../models/models.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return LoadingScreen.route();
      case '/home':
        return HomeScreen.route();
      case '/detail-surah':
        return DetailSurahScreen.route(arguments: settings.arguments as Tuple2<BuildContext, SurahModels>);
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
