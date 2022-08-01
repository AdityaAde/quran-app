import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/surah_models.dart';
import '../../provider/provider.dart';

part 'list_surah_event.dart';
part 'list_surah_state.dart';

class ListSurahBloc extends Bloc<ListSurahEvent, ListSurahState> {
  ListSurahBloc() : super(ListSurahLoading()) {
    on<GetSurahEvent>(_onGetSurahEvent);
  }

  void _onGetSurahEvent(
    GetSurahEvent event,
    Emitter<ListSurahState> emit,
  ) async {
    emit(ListSurahLoading());
    final SurahRepository surahRepository = SurahRepository();
    try {
      final listSurah = await surahRepository.getSurah();
      if (listSurah.code == 200) {
        emit(ListSurahLoaded(listSurah: listSurah));
      }
    } catch (e) {
      emit(ListSurahError(error: e.toString()));
    }
  }
}
