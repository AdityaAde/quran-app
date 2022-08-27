import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../components/components.dart';
import 'widget/search_surah.dart';
import 'widget/widget.dart';

/// [HomeScreen] Halaman landing page setelah User melakukan tap
/// dari halaman WelcomeScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocConsumer<ListSurahBloc, ListSurahState>(listener: (context, state) {
      if (state is ListSurahError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Terjadi Kesalahan')),
        );
        context.read<ListSurahBloc>().add(GetSurahEvent());
      }
    }, builder: (context, state) {
      return BlocBuilder<ListSurahBloc, ListSurahState>(
        builder: (context, state) {
          if (state is ListSurahLoading) {
            return const Scaffold(
              body: Center(
                child: Loading(),
              ),
            );
          } else if (state is ListSurahLoaded) {
            return _listSurah(context, textTheme, colorScheme, state);
          } else {
            return const Center(child: Text('Terjadi Kesalahan'));
          }
        },
      );
    });
  }

  Scaffold _listSurah(BuildContext context, TextTheme textTheme, ColorScheme colorScheme, ListSurahLoaded state) {
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        'My Quran',
        textTheme,
        colorScheme,
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchSurah(listSurah: state.listSurah));
          },
          icon: Icon(
            Icons.search,
            color: colorScheme.onBackground.withOpacity(0.5),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                HeaderHome(
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
                const SizedBox(height: 15),
                ListSurah(
                  listSurah: state.listSurah,
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CustomNavbar(),
          ),
        ],
      ),
    );
  }
}
