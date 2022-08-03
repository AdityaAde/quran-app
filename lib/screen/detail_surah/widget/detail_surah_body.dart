import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';

class DetailSurahBody extends StatelessWidget {
  DetailSurahBody({
    Key? key,
    required this.colorScheme,
    required this.textTheme,
    required this.surah,
  }) : super(key: key);

  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final SurahDetailModels surah;
  final AudioPlayer audioPLayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: surah.ayat!.length,
        itemBuilder: (context, index) {
          final surahDetail = surah.ayat![index];
          final indexSurah = index + 1;

          return Column(
            children: [
              Padding(
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
                              backgroundColor: colorScheme.primary,
                              radius: 13,
                              child: Text(
                                indexSurah.toString(),
                                style: textTheme.bodyLarge!.copyWith(color: colorScheme.background),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Not implemented yet.')),
                                  );
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
              ),
              const SizedBox(height: 15),
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
                    style: textTheme.bodyLarge!.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
