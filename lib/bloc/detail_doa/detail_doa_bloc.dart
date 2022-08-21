import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../provider/provider.dart';

part 'detail_doa_event.dart';
part 'detail_doa_state.dart';

class DetailDoaBloc extends Bloc<DetailDoaEvent, DetailDoaState> {
  DetailDoaRepository detailDoaRepository = DetailDoaRepository();
  DetailDoaBloc() : super(DetailDoaLoading()) {
    on<GetDetailDoaEvent>(_onGetDetailDoaEvent);
  }

  void _onGetDetailDoaEvent(
    GetDetailDoaEvent event,
    Emitter<DetailDoaState> emit,
  ) async {
    emit(DetailDoaLoading());
    final data = await detailDoaRepository.getDetailDoa(event.id);
    if (data.code == 200) {
      emit(DetailDoaLoaded(detailDoa: data));
    } else {
      emit(DetailDoaError(error: data.message ?? 'Terjadi kesalahan'));
    }
  }
}
