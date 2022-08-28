import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/models/tafsir_models.dart';
import 'package:quran_app/provider/provider.dart';

part 'tafsir_event.dart';
part 'tafsir_state.dart';

class TafsirBloc extends Bloc<TafsirEvent, TafsirState> {
  TafsirRepository tafsirRepository = TafsirRepository();
  TafsirBloc() : super(TafsirLoading()) {
    on<GetTafsirEvent>(_onGetTafsirEvent);
  }

  void _onGetTafsirEvent(GetTafsirEvent event, Emitter<TafsirState> emit) async {
    emit(TafsirLoading());
    var result = await tafsirRepository.getTafsirAyah(event.nomorSurah);
    try {
      if (result.status == true) {
        emit(TafsirLoaded(tafsir: result));
      }
    } catch (e) {
      emit(TafsirError(error: e.toString()));
    }
  }
}
