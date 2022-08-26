import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import 'widget/widget.dart';
import '../../bloc/bloc.dart';
import '../../components/components.dart';
import '../../models/surah_models.dart';

class DetailSurahScreen extends StatelessWidget {
  const DetailSurahScreen({Key? key, this.arguments}) : super(key: key);

  final Tuple2<BuildContext, SurahModels>? arguments;

  static const String routeName = '/detail-surah';
  static Route route({required Tuple2<BuildContext, SurahModels>? arguments}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => DetailSurahScreen(arguments: arguments),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final descriptionSurah = arguments!.item2.deskripsi!.replaceAll("</i>", " ");
    return BlocConsumer<DetailSurahBloc, DetailSurahState>(
      listener: (context, state) {
        if (state is DetailSurahError) {
          context.read<DetailSurahBloc>().add(GetDetailSurahEvent(surahIndex: arguments!.item2.nomor.toString()));
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
        arguments!.item2.namaLatin!,
        textTheme,
        colorScheme,
        InfoSurah(textTheme: textTheme, descriptionSurah: descriptionSurah, colorScheme: colorScheme),
      ),
      body: ListView(
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
            surahName: arguments!.item2.namaLatin!,
          ),
        ],
      ),
      bottomNavigationBar: const AudioSurah(),
    );
  }
}
