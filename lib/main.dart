import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/config.dart';

import 'bloc/bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<ListSurahBloc>(create: (context) => ListSurahBloc()),
        BlocProvider<DetailSurahBloc>(create: (context) => DetailSurahBloc()),
        BlocProvider<AudioSurahBloc>(create: (context) => AudioSurahBloc()),
        BlocProvider<BookmarkBloc>(create: (context) => BookmarkBloc()),
        BlocProvider<LastReadBloc>(create: (context) => LastReadBloc()),
        BlocProvider<DoaBloc>(create: (context) => DoaBloc()),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {
          debugPrint(state.toString());
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quran App',
            theme: state.theme == AppTheme.light ? lightTheme() : darkTheme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
