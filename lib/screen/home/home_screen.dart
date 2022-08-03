import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../components/components.dart';
import '../screen.dart';
import 'widget/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
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
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ListSurahLoaded) {
            return Scaffold(
              floatingActionButton: CircleAvatar(
                backgroundColor: colorScheme.primary,
                radius: 30,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/bookmarks');
                  },
                  icon: const Icon(Icons.bookmark),
                  iconSize: 28,
                  color: Colors.white,
                ),
              ),
              appBar: AppBarCustom.appBarCustom(
                context,
                'Quran App',
                textTheme,
                colorScheme,
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchScreen(listSurah: state.listSurah));
                  },
                  icon: Icon(
                    Icons.search,
                    color: colorScheme.onBackground.withOpacity(0.5),
                  ),
                ),
              ),
              body: Padding(
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
            );
          } else {
            return const Center(child: Text('Terjadi Kesalahan'));
          }
        },
      );
    });
  }
}
