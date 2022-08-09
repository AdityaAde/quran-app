part of 'bookmark_bloc.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkLoading extends BookmarkState {}

class AddBookmarkSuccess extends BookmarkState {}

class GetBookmarkEmpty extends BookmarkState {}

class GetBookmarkLoadedState extends BookmarkState {
  final List<Map<String, dynamic>> listBookmarks;

  const GetBookmarkLoadedState({required this.listBookmarks});

  @override
  List<Object> get props => [listBookmarks];
}

class GetBookmarkError extends BookmarkState {
  final String error;

  const GetBookmarkError({required this.error});

  @override
  List<Object> get props => [error];
}
