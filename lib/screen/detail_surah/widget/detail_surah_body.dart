import 'package:flutter/material.dart';
import 'package:quran_app/models/detail_surah_english_models.dart';
import 'package:quran_app/models/detail_surah_models.dart';

class DetailSurahBody extends StatelessWidget {
  const DetailSurahBody({
    Key? key,
    required this.colorScheme,
    required this.textTheme,
    required this.surah,
    required this.surahOnEnglish,
  }) : super(key: key);

  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final List<Ayah> surah;
  final List<AyahOnEnglish> surahOnEnglish;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: surah.length,
        itemBuilder: (context, index) {
          final surahDetail = surah[index];
          final translateSurah = surahOnEnglish[index];
          final translateSurahReplace = translateSurah.text!.replaceAll('"', '');
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
                          CircleAvatar(
                            backgroundColor: colorScheme.primary,
                            radius: 13,
                            child: Text(
                              indexSurah.toString(),
                              style: textTheme.bodyLarge!.copyWith(color: colorScheme.background),
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
                                    Icons.play_arrow_outlined,
                                    color: colorScheme.primary,
                                    size: 30,
                                  )),
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
                    surahDetail.text!,
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
                    translateSurahReplace,
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
