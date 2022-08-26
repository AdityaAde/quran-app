// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config.dart';
import 'bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = await SharedPreferences.getInstance();
  final getValueOnBoarding = prefs.getBool('onboarding') ?? false;
  BlocOverrides.runZoned(
    () => runApp(MyApp(valueOnBoard: getValueOnBoarding)),
    blocObserver: BlocBuilderObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool valueOnBoard;
  const MyApp({Key? key, required this.valueOnBoard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..getCurrentTheme()),
        BlocProvider<ListSurahBloc>(create: (context) => ListSurahBloc()..add(GetSurahEvent())),
        BlocProvider<LastReadBloc>(create: (context) => LastReadBloc()..add(GetLastReadEvent())),
        BlocProvider<DetailSurahBloc>(create: (context) => DetailSurahBloc()),
        BlocProvider<AudioSurahBloc>(create: (context) => AudioSurahBloc()),
        BlocProvider<BookmarkBloc>(create: (context) => BookmarkBloc()),
        BlocProvider<DoaBloc>(create: (context) => DoaBloc()),
        BlocProvider<DetailDoaBloc>(create: (context) => DetailDoaBloc()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quran App',
            theme: state.theme == 'light' ? lightTheme() : darkTheme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: valueOnBoard ? '/' : '/welcome',
          );
        },
      ),
    );
  }
}
