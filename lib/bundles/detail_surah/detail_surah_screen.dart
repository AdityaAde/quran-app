import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import 'widget/widget.dart';
import '../../bloc/bloc.dart';
import '../../components/components.dart';

class DetailSurahScreen extends StatelessWidget {
  const DetailSurahScreen({Key? key, this.tuple}) : super(key: key);

  final Tuple5<String, String, String, String, String>? tuple;

  static const String routeName = '/detail-surah';
  static Route route({required final Tuple5<String, String, String, String, String>? tuple}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => DetailSurahScreen(tuple: tuple!),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final descriptionSurah = tuple!.item4.replaceAll("</i>", " ");
    return BlocConsumer<DetailSurahBloc, DetailSurahState>(
      listener: (context, state) {
        if (state is DetailSurahError) {
          context.read<DetailSurahBloc>().add(GetDetailSurahEvent(surahIndex: tuple!.item2.toString()));
          if (kDebugMode) {
            print(state.error);
          }
        }
      },
      builder: (context, state) {
        return BlocBuilder<DetailSurahBloc, DetailSurahState>(
          builder: (context, state) {
            if (state is DetailSurahLoading) {
              return const Scaffold(
                body: Center(
                  child: Loading(),
                ),
              );
            } else if (state is DetailSurahLoaded) {
              return _surahLoaded(context, textTheme, colorScheme, descriptionSurah, state);
            } else {
              return const Scaffold(
                body: Center(
                  child: Text('Something Went Wrong'),
                ),
              );
            }
          },
        );
      },
    );
  }

  Scaffold _surahLoaded(
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
    String descriptionSurah,
    DetailSurahLoaded state,
  ) {
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        tuple!.item1,
        textTheme,
        colorScheme,
        InfoSurah(textTheme: textTheme, descriptionSurah: descriptionSurah, colorScheme: colorScheme),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          HeaderTitleSurah(
            arguments: tuple,
            textTheme: textTheme,
            colorScheme: colorScheme,
          ),
          DetailSurahBody(
            colorScheme: colorScheme,
            textTheme: textTheme,
            surah: state.surahDetailArabic,
            surahName: tuple!.item1,
          ),
        ],
      ),
      bottomNavigationBar: const AudioSurah(),
    );
  }
}
