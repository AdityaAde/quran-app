import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../provider/bookmarks/bookmark_repository.dart';

part 'last_read_event.dart';
part 'last_read_state.dart';

class LastReadBloc extends Bloc<LastReadEvent, LastReadState> {
  BookmarkRepository bookmarkRepository = BookmarkRepository();
  LastReadBloc() : super(LastReadLoading()) {
    on<GetLastReadEvent>(_onGetLasReadEvent);
  }

  void _onGetLasReadEvent(GetLastReadEvent event, Emitter<LastReadState> emit) async {
    emit(LastReadLoading());
    try {
      final Map<String, dynamic>? dataLastRead = await bookmarkRepository.getLastRead();
      if (dataLastRead == null) {
        await bookmarkRepository.getLastRead();
        emit(LastReadLoaded(lastRead: dataLastRead!));
      }
      emit(LastReadLoaded(lastRead: dataLastRead));
    } catch (e) {
      emit(LastReadError(error: e.toString()));
    }
  }
}
