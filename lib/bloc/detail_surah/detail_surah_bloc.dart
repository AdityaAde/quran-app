import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/detail_surah_english_models.dart';
import '../../models/detail_surah_models.dart';
import '../../provider/provider.dart';

part 'detail_surah_event.dart';
part 'detail_surah_state.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  DetailSurahBloc() : super(DetailSurahLoading()) {
    on<GetDetailSurahEvent>(_onGetDetailSurahEvent);
  }

  void _onGetDetailSurahEvent(
    GetDetailSurahEvent event,
    Emitter<DetailSurahState> emit,
  ) async {
    final DetailSurahRepository detailSurahRepository = DetailSurahRepository();
    emit(DetailSurahLoading());
    try {
      final surahDetailArabic = await detailSurahRepository.getDetailSurah(event.surahIndex);
      final surahDetailEnglish = await detailSurahRepository.getDetailSurahEnglish(event.surahIndex);
      if (surahDetailArabic.code == 200 && surahDetailEnglish.code == 200) {
        print('BLOC DETAIL SURAH OK');
        emit(DetailSurahLoaded(surahDetailArabic: surahDetailArabic, surahDetailEnglish: surahDetailEnglish));
      }
    } catch (e) {
      return emit(DetailSurahError(error: e.toString()));
    }
  }
}
