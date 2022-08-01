import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/detail_surah/detail_surah_bloc.dart';
import 'bloc/list_surah/list_surah_bloc.dart';
import 'config/config.dart';

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
        BlocProvider<ListSurahBloc>(
          create: (context) => ListSurahBloc(),
        ),
        BlocProvider<DetailSurahBloc>(
          create: (context) => DetailSurahBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Quran App',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
