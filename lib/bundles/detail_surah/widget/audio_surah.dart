import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';

/// Create [AudioSurah] Widget yang digunakan untuk melakukan PLAY/PAUSE
/// pada audio surah
class AudioSurah extends StatefulWidget {
  const AudioSurah({
    Key? key,
  }) : super(key: key);

  @override
  State<AudioSurah> createState() => _AudioSurahState();
}

class _AudioSurahState extends State<AudioSurah> {
  final audioPLayer = AudioPlayer();
  bool isRepeat = false;
  bool isPlay = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    audioPLayer.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds);

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioSurahBloc, AudioSurahState>(
      listener: (context, state) {
        if (state is AudioSurahLoaded) {
          state.isPlay ? audioPLayer.play(UrlSource(state.urlSurah)) : audioPLayer.pause();

          /// Listen to states : Playing, Pause, Stop
          audioPLayer.onPlayerStateChanged.listen((condition) {
            setState(() {
              isPlay = condition == PlayerState.playing;
            });
          });

          /// Listen to Audio Duration
          audioPLayer.onDurationChanged.listen((newDuration) {
            setState(() {
              duration = newDuration;
            });
          });

          /// Listen to Audio Position
          audioPLayer.onPositionChanged.listen((newDuration) {
            setState(() {
              position = newDuration;
            });
          });
        }
      },
      builder: (context, state) {
        return BlocBuilder<AudioSurahBloc, AudioSurahState>(
          builder: (context, state) {
            if (state is AudioSurahLoaded) {
              return _audioSurahLoaded(state, context);
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }

  Container _audioSurahLoaded(AudioSurahLoaded state, BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.1),
      height: 75,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  state.surahName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text(formatTime(position)),
                    Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final position = Duration(seconds: value.toInt());
                        await audioPLayer.seek(position);
                        //await audioPLayer.resume();
                      },
                    ),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 15),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
