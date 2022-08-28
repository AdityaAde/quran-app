import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../models/models.dart';
import '../../../provider/provider.dart';

/// [DetailSurahBody] Widget untuk menampilkan body dari
/// halaman DetailSurahScreen

class DetailSurahBody extends StatelessWidget {
  DetailSurahBody({
    Key? key,
    required this.colorScheme,
    required this.textTheme,
    required this.surah,
    required this.surahName,
    required this.arti,
    required this.deskripsi,
    required this.audio,
    required this.index,
    required this.bookmarkRepository,
  }) : super(key: key);

  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final SurahDetailModels surah;
  final String surahName;
  final String arti;
  final String deskripsi;
  final String audio;
  final int index;
  final BookmarkRepository bookmarkRepository;

  final AudioPlayer audioPLayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final surahDetail = surah.ayat![index];
    final indexSurah = index + 1;

    return AutoScrollTag(
      key: ValueKey(index + 2),
      index: index + 2,
      controller: bookmarkRepository.autoScroll,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            _headerSurah(indexSurah, context, surahDetail, arti, deskripsi, audio),
            const SizedBox(height: 15),
            _bodySurah(surahDetail),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Padding _headerSurah(
    int indexSurah,
    BuildContext context,
    Ayat surahDetail,
    String arti,
    String deskripsi,
    String audio,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    backgroundColor: colorScheme.secondary,
                    radius: 13,
                    child: Text(
                      indexSurah.toString(),
                      style: textTheme.bodyLarge!.copyWith(color: colorScheme.onPrimary),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return BlocBuilder<BookmarkBloc, BookmarkState>(
                                builder: (context, state) {
                                  return Container(
                                    color: Colors.transparent,
                                    child: Container(
                                        height: 100,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(130, 30),
                                                primary: colorScheme.secondary,
                                              ),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                context.read<BookmarkBloc>().add(
                                                      AddBookmarkEvent(
                                                        lastRead: true,
                                                        nomorSurah: surah.nomor.toString(),
                                                        namaSurah: surahName,
                                                        surah: surahDetail,
                                                        arti: arti,
                                                        deskripsi: deskripsi,
                                                        audio: audio,
                                                        indexAyat: indexSurah,
                                                        context: context,
                                                      ),
                                                    );
                                                context.read<LastReadBloc>().add(GetLastReadEvent());
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'Berhasil Menambahkan Sebagai Terakhir dibaca',
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Terakhir dibaca',
                                                style: textTheme.bodyLarge!.copyWith(
                                                  color: colorScheme.onPrimary,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(130, 30),
                                                primary: colorScheme.secondary,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                context.read<BookmarkBloc>().add(AddBookmarkEvent(
                                                      lastRead: false,
                                                      nomorSurah: surah.nomor.toString(),
                                                      namaSurah: surahName,
                                                      surah: surahDetail,
                                                      arti: arti,
                                                      deskripsi: deskripsi,
                                                      audio: audio,
                                                      indexAyat: indexSurah,
                                                      context: context,
                                                    ));

                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text('Berhasil Menambahkan Bookmark')),
                                                );
                                              },
                                              child: Text(
                                                'Bookmark',
                                                style: textTheme.bodyLarge!.copyWith(
                                                  color: colorScheme.onPrimary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  );
                                },
                              );
                            });
                      },
                      icon: Icon(
                        Icons.bookmark_outline,
                        color: colorScheme.primary,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _bodySurah(Ayat surahDetail) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              surahDetail.ar!,
              style: textTheme.bodyLarge!.copyWith(fontSize: 20),
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              surahDetail.idn!,
              style: textTheme.bodyLarge!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: colorScheme.onBackground.withOpacity(0.7),
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ],
    );
  }
}
