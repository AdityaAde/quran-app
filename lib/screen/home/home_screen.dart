import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../components/components.dart';
import 'widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBarCustom.appBarCustom('Quran App', textTheme, colorScheme, context),
      body: BlocConsumer<ListSurahBloc, ListSurahState>(
        listener: (context, state) {
          if (state is ListSurahError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Terjadi Kesalahan')),
            );
            context.read<ListSurahBloc>().add(GetSurahEvent());
          }
        },
        builder: (context, state) {
          return BlocBuilder<ListSurahBloc, ListSurahState>(
            builder: (context, state) {
              if (state is ListSurahLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ListSurahLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      HeaderHome(
                        textTheme: textTheme,
                        colorScheme: colorScheme,
                      ),
                      const SizedBox(height: 15),
                      ListSurah(listSurah: state.listSurah, textTheme: textTheme, colorScheme: colorScheme),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('Terjadi Kesalahan'));
              }
            },
          );
        },
      ),
    );
  }
}
