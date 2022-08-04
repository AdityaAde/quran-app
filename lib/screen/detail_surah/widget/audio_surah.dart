import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';

class AudioSurah extends StatefulWidget {
  const AudioSurah({
    Key? key,
  }) : super(key: key);

  @override
  State<AudioSurah> createState() => _AudioSurahState();
}

class _AudioSurahState extends State<AudioSurah> {
  final audioPLayer = AudioPlayer();
  bool isPlaying = false;
  int indexMusic = 0;
  bool isRepeat = false;

  List<String> urlMusic = [];

  @override
  void dispose() {
    super.dispose();
    audioPLayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioSurahBloc, AudioSurahState>(
      builder: (context, state) {
        if (state is AudioSurahAudioLoaded) {
          return _audioSurahLoaded(state, context);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Container _audioSurahLoaded(AudioSurahAudioLoaded state, BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Text(
                  state.surahName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Not implemented yet.')),
                    );
                  },
                  icon: const Icon(Icons.skip_previous, color: Color(0xff672CBC)),
                  iconSize: 30,
                ),
                const SizedBox(width: 15),
                IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      audioPLayer.onPlayerStateChanged.listen((state) {
                        setState(() {
                          isPlaying = state == PlayerState.stopped;
                        });
                      });
                      audioPLayer.pause();
                    } else {
                      /// TODO: Bug ketika menjalankan audio

                      audioPLayer.onPlayerStateChanged.listen((state) {
                        setState(() {
                          isPlaying = state == PlayerState.playing;
                        });
                      });
                      audioPLayer.play(UrlSource(state.urlSurah));
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: const Color(0xff672CBC),
                  ),
                  iconSize: 30,
                ),
                const SizedBox(width: 15),
                IconButton(
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Not implemented yet.')),
                    );
                  },
                  icon: const Icon(
                    Icons.skip_next,
                    color: Color(0xff672CBC),
                  ),
                  iconSize: 30,
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isRepeat = !isRepeat;
                  });
                  if (isRepeat == true) {
                    audioPLayer.setReleaseMode(ReleaseMode.loop);
                  } else {
                    audioPLayer.setReleaseMode(ReleaseMode.stop);
                  }
                },
                icon: Icon(
                  Icons.repeat,
                  color: isRepeat ? const Color(0xff672CBC) : Colors.black38,
                )),
          ],
        ),
      ),
    );
  }
}
