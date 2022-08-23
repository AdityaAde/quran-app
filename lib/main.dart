// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/theme_observer.dart';
import 'config/config.dart';

import 'bloc/bloc.dart';
import 'config/theme/theme_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: ThemeObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
