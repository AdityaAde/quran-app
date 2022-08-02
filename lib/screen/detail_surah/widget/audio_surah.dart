import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

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

  List<String> urlMusic = [
    'https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3',
    'https://cdn.islamic.network/quran/audio/128/ar.alafasy/2.mp3',
    'https://cdn.islamic.network/quran/audio/128/ar.alafasy/3.mp3',
  ];

  @override
  void initState() {
    super.initState();

    /// Playing, pause, stopped
    audioPLayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPLayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  'Al-Fatihah',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '${indexMusic + 1} / ${urlMusic.length}',
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    setState(() {
                      indexMusic -= 1;
                      audioPLayer.play(UrlSource(urlMusic[indexMusic]));
                    });
                  },
                  icon: const Icon(Icons.skip_previous, color: Color(0xff672CBC)),
                  iconSize: 30,
                ),
                const SizedBox(width: 15),
                IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPLayer.pause();
                    } else {
                      await audioPLayer.play(UrlSource(urlMusic[indexMusic]));
                    }
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: const Color(0xff672CBC)),
                  iconSize: 30,
                ),
                const SizedBox(width: 15),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      indexMusic += 1;
                      audioPLayer.play(UrlSource(urlMusic[indexMusic]));
                    });
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
