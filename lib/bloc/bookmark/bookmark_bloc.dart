import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../provider/bookmarks/bookmark_repository.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkRepository bookmarkRepository = BookmarkRepository();
  BookmarkBloc() : super(BookmarkLoading()) {
    on<AddBookmarkEvent>(_onAddBookmarkEvent);
    on<GetBookmarkEvent>(_onGetBookmarkEvent);
    on<DeleteBookmarkEvent>(_onDeleteBookmarkEvent);
  }

  void _onAddBookmarkEvent(
    AddBookmarkEvent event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(BookmarkLoading());
    try {
      await bookmarkRepository.addBookmark(
        event.lastRead,
        event.namaSurah,
        event.surah,
        event.indexAyat,
        event.context,
      );
      emit(AddBookmarkSuccess());
    } catch (e) {
      emit(GetBookmarkError(error: e.toString()));
    }
  }

  void _onGetBookmarkEvent(
    GetBookmarkEvent event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(BookmarkLoading());
    try {
      final listBookmarks = await bookmarkRepository.getBookmark();
      if (listBookmarks.isEmpty) {
        emit(GetBookmarkEmpty());
      } else {
        emit(GetBookmarkLoadedState(listBookmarks: listBookmarks));
      }
    } catch (e) {
      emit(GetBookmarkError(error: e.toString()));
    }
  }

  void _onDeleteBookmarkEvent(DeleteBookmarkEvent event, Emitter<BookmarkState> emit) async {
    await bookmarkRepository.deleteBookmark(event.id);
    final listBookmarks = await bookmarkRepository.getBookmark();
    if (listBookmarks.isEmpty) {
      emit(GetBookmarkEmpty());
    } else {
      emit(GetBookmarkLoadedState(listBookmarks: listBookmarks));
    }
  }
}
