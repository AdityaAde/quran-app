part of 'audio_surah_bloc.dart';

abstract class AudioSurahState extends Equatable {
  const AudioSurahState();

  @override
  List<Object> get props => [];
}

class AudioSurahLoading extends AudioSurahState {}

class AudioSurahAudioLoaded extends AudioSurahState {
  final String urlSurah;
  final String surahName;

  const AudioSurahAudioLoaded({required this.urlSurah, required this.surahName});

  @override
  List<Object> get props => [urlSurah];
}
