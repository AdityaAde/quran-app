import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
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
    final List<Ayah> listSurahDetailArabic = [];
    final List<AyahOnEnglish> listSurahDetailEnglish = [];
    emit(DetailSurahLoading());
    try {
      final surahDetailArabic = await detailSurahRepository.getDetailSurah(event.surahIndex);
      final surahDetailEnglish = await detailSurahRepository.getDetailSurahEnglish(event.surahIndex);
      listSurahDetailArabic.addAll(surahDetailArabic);
      listSurahDetailEnglish.addAll(surahDetailEnglish);
      emit(DetailSurahLoaded(surahDetailArabic: listSurahDetailArabic, surahDetailEnglish: listSurahDetailEnglish));
    } catch (e) {
      return emit(DetailSurahError(error: e.toString()));
    }
  }
}
