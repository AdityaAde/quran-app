import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import '../../../bloc/bloc.dart';
import '../../../components/route_transition.dart';
import '../../../models/surah_models.dart';
import '../../bundles.dart';
import 'surah_tile.dart';

class ListSurah extends StatelessWidget {
  const ListSurah({
    Key? key,
    required this.listSurah,
    required this.textTheme,
    required this.colorScheme,
  }) : super(key: key);

  final List<SurahModels> listSurah;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: listSurah.length,
          itemBuilder: (context, index) {
            final surah = listSurah[index];
            return Column(
              children: [
                const SizedBox(height: 10),
                SurahTile(
                  surahIndex: surah.nomor!,
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  surahEnglishName: surah.namaLatin!,
                  ayahSurah: surah.jumlahAyat!,
                  surahArabName: surah.nama!,
                  onTap: () {
                    context.read<DetailSurahBloc>().add(GetDetailSurahEvent(surahIndex: surah.nomor.toString()));
                    final Tuple5<String, String, String, String, String> tuple = Tuple5(
                      surah.namaLatin!,
                      surah.jumlahAyat.toString(),
                      surah.arti!,
                      surah.deskripsi!,
                      surah.audio!,
                    );
                    Navigator.push(context, SlideRightRoute(page: DetailSurahScreen(tuple: tuple)));
                  },
                ),
                const SizedBox(height: 8),
                Divider(
                  thickness: 1,
                  color: colorScheme.onBackground.withOpacity(0.1),
                ),
              ],
            );
          }),
    );
  }
}
