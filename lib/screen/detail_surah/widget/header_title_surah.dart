import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import '../../../bloc/bloc.dart';
import '../../../models/surah_models.dart';

class HeaderTitleSurah extends StatelessWidget {
  const HeaderTitleSurah({
    Key? key,
    required this.arguments,
    required this.textTheme,
    required this.colorScheme,
  }) : super(key: key);

  final Tuple2<BuildContext, SurahModels>? arguments;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioSurahBloc, AudioSurahState>(
      builder: (context, state) {
        return Stack(
          children: [
            Image.asset(
              'assets/images/detail-surah.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1 + 10,
              right: MediaQuery.of(context).size.width / 2 - 123,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Column(
                  children: [
                    Text(
                      arguments!.item2.namaLatin!,
                      style: textTheme.headline3!.copyWith(color: colorScheme.background),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      arguments!.item2.arti!,
                      style: textTheme.headline3!.copyWith(
                        color: colorScheme.background,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: 250,
                      child: Divider(
                        thickness: 1,
                        color: colorScheme.background.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text('${arguments!.item2.jumlahAyat!.toString()} AYAT',
                        style: textTheme.headline4!.copyWith(color: colorScheme.background))
                  ],
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 30,
              top: MediaQuery.of(context).size.height * 0.3,
              child: CircleAvatar(
                backgroundColor: const Color(0xff672CBC),
                radius: 30,
                child: IconButton(
                    onPressed: () async {
                      context.read<AudioSurahBloc>().add(
                            PlayAudioSurahEvent(
                              urlSurahl: arguments!.item2.audio!,
                              surahName: arguments!.item2.namaLatin!,
                            ),
                          );
                    },
                    icon: const Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ),
          ],
        );
      },
    );
  }
}
