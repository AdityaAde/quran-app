import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audio_surah_event.dart';
part 'audio_surah_state.dart';

class AudioSurahBloc extends Bloc<AudioSurahEvent, AudioSurahState> {
  AudioSurahBloc() : super(AudioSurahLoading()) {
    on<PlayAudioSurahEvent>(_onGetAudioSurahAudio);
  }

  void _onGetAudioSurahAudio(
    PlayAudioSurahEvent event,
    Emitter<AudioSurahState> emit,
  ) {
    emit(AudioSurahAudioLoaded(urlSurah: event.urlSurahl, surahName: event.surahName));
  }
}
