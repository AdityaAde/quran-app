part of 'audio_surah_bloc.dart';

abstract class AudioSurahEvent extends Equatable {
  const AudioSurahEvent();

  @override
  List<Object> get props => [];
}

class PlayAudioSurahEvent extends AudioSurahEvent {
  final String urlSurahl;

  const PlayAudioSurahEvent({required this.urlSurahl});

  @override
  List<Object> get props => [urlSurahl];
}
