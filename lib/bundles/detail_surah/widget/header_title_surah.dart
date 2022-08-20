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
    bool isPlay = false;

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
                  style: textTheme.headline3!.copyWith(color: colorScheme.onPrimary),
                ),
                const SizedBox(height: 3),
                Text(
                  arguments!.item2.arti!,
                  style: textTheme.headline3!.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  width: 250,
                  child: Divider(
                    thickness: 1,
                    color: colorScheme.onPrimary.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${arguments!.item2.jumlahAyat!.toString()} AYAT',
                  style: textTheme.headline4!.copyWith(color: colorScheme.onPrimary),
                )
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
            child: IconButton(onPressed: () async {
              isPlay = !isPlay;
              context.read<AudioSurahBloc>().add(
                    PlayAudioSurahEvent(
                      urlSurahl: arguments!.item2.audio!,
                      surahName: arguments!.item2.namaLatin!,
                      isPlay: isPlay,
                    ),
                  );
            }, icon: BlocBuilder<AudioSurahBloc, AudioSurahState>(
              builder: (context, state) {
                if (state is AudioSurahLoaded) {
                  return state.isPlay
                      ? const Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                          size: 30,
                        );
                }
                return const Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                  size: 30,
                );
              },
            )),
          ),
        ),
      ],
    );
  }
}
