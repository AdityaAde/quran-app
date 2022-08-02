import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import 'widget/widget.dart';
import '../../bloc/bloc.dart';
import '../../components/components.dart';
import '../../models/surah_models.dart';

class DetailSurahScreen extends StatelessWidget {
  const DetailSurahScreen({Key? key, this.arguments}) : super(key: key);

  final Tuple2<BuildContext, Datum>? arguments;

  static const String routeName = '/detail-surah';
  static Route route({required Tuple2<BuildContext, Datum>? arguments}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => DetailSurahScreen(arguments: arguments),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocConsumer<DetailSurahBloc, DetailSurahState>(
      listener: (context, state) {
        if (state is DetailSurahError) {
          context.read<DetailSurahBloc>().add(GetDetailSurahEvent(surahIndex: arguments!.item2.number.toString()));
        }
      },
      builder: (context, state) {
        return BlocBuilder<DetailSurahBloc, DetailSurahState>(
          builder: (context, state) {
            if (state is DetailSurahLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is DetailSurahLoaded) {
              return Scaffold(
                appBar: AppBarCustom.appBarCustom(
                  context,
                  arguments!.item2.englishName!,
                  textTheme,
                  colorScheme,
                  null,
                ),
                body: Column(
                  children: [
                    const SizedBox(height: 15),
                    HeaderTitleSurah(
                      arguments: arguments,
                      textTheme: textTheme,
                      colorScheme: colorScheme,
                    ),
                    DetailSurahBody(
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                      surah: state.surahDetailArabic,
                      surahOnEnglish: state.surahDetailEnglish,
                    ),
                  ],
                ),
                bottomNavigationBar: const AudioSurah(),
              );
            } else {
              return const Center(child: Text('Something Went Wrong'));
            }
          },
        );
      },
    );
  }
}
