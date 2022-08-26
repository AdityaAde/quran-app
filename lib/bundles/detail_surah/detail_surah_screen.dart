import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:tuple/tuple.dart';

import '../../provider/provider.dart';
import 'widget/widget.dart';
import '../../bloc/bloc.dart';
import '../../components/components.dart';

class DetailSurahScreen extends StatelessWidget {
  const DetailSurahScreen({Key? key, this.tuple, this.toIndexAyat}) : super(key: key);

  /// Tuple 5 :
  /// item1 = nama latin, item2 = ayat, item3 = arti, item4 = deksripsi, item5 = audio

  final Tuple5<String, String, String, String, String>? tuple;
  final int? toIndexAyat;

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
    final bookmarkRepository = BookmarkRepository();
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
              if (toIndexAyat != null) {
                bookmarkRepository.autoScroll.scrollToIndex(
                  toIndexAyat! + 1,
                  preferPosition: AutoScrollPosition.begin,
                  duration: const Duration(seconds: 2),
                );
                return _surahLoaded(
                  context,
                  textTheme,
                  colorScheme,
                  descriptionSurah,
                  state,
                  bookmarkRepository,
                );
              } else {
                return _surahLoaded(
                  context,
                  textTheme,
                  colorScheme,
                  descriptionSurah,
                  state,
                  bookmarkRepository,
                );
              }
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
    BookmarkRepository bookmarkRepository,
  ) {
    List<Widget> surahBody = List.generate(state.surahDetailArabic.ayat!.length, (index) {
      return DetailSurahBody(
        colorScheme: colorScheme,
        textTheme: textTheme,
        surah: state.surahDetailArabic,
        surahName: tuple!.item1,
        arti: tuple!.item3,
        deskripsi: tuple!.item4,
        audio: tuple!.item5,
        index: index,
        bookmarkRepository: bookmarkRepository,
      );
    });
    return Scaffold(
      appBar: AppBarCustom.appBarCustom(
        context,
        tuple!.item1,
        textTheme,
        colorScheme,
        InfoSurah(textTheme: textTheme, descriptionSurah: descriptionSurah, colorScheme: colorScheme),
      ),
      body: ListView(
        controller: bookmarkRepository.autoScroll,
        children: [
          AutoScrollTag(
            key: const ValueKey(0),
            index: 0,
            controller: bookmarkRepository.autoScroll,
            child: const SizedBox(height: 15),
          ),
          AutoScrollTag(
            key: const ValueKey(1),
            index: 1,
            controller: bookmarkRepository.autoScroll,
            child: HeaderTitleSurah(
              arguments: tuple,
              textTheme: textTheme,
              colorScheme: colorScheme,
            ),
          ),
          ...surahBody
        ],
      ),
      bottomNavigationBar: const AudioSurah(),
    );
  }
}
