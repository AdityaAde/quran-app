import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/models/doa_models.dart';
import 'package:quran_app/provider/doa/doa.dart';

part 'doa_event.dart';
part 'doa_state.dart';

class DoaBloc extends Bloc<DoaEvent, DoaState> {
  DoaBloc() : super(DoaLoading()) {
    on<GetListDoa>(_onGetListDoa);
  }

  void _onGetListDoa(GetListDoa event, Emitter<DoaState> emit) async {
    emit(DoaLoading());
    DoaRepository doaRepository = DoaRepository();
    try {
      var result = await doaRepository.listDoa();
      if (result.code == 200) {
        emit(DoaLoaded(listDoa: result));
      }
    } catch (e) {
      emit(DoaError(error: e.toString()));
    }
  }
}
