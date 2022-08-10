part of 'audio_surah_bloc.dart';

abstract class AudioSurahEvent extends Equatable {
  const AudioSurahEvent();

  @override
  List<Object> get props => [];
}

class PlayAudioSurahEvent extends AudioSurahEvent {
  final String urlSurahl;
  final String surahName;
  final bool isPlay;

  const PlayAudioSurahEvent({
    required this.urlSurahl,
    required this.surahName,
    required this.isPlay,
  });

  @override
  List<Object> get props => [urlSurahl, surahName, isPlay];
}
