part of 'audio_surah_bloc.dart';

abstract class AudioSurahState extends Equatable {
  const AudioSurahState();

  @override
  List<Object> get props => [];
}

class AudioSurahLoading extends AudioSurahState {}

class AudioSurahLoaded extends AudioSurahState {
  final String urlSurah;
  final String surahName;
  final bool isPlay;

  const AudioSurahLoaded({
    required this.urlSurah,
    required this.surahName,
    required this.isPlay,
  });

  @override
  List<Object> get props => [urlSurah, surahName, isPlay];
}
