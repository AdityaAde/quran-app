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

class GetLastReadLoaded extends BookmarkState {
  final Map<String, dynamic> lastRead;

  const GetLastReadLoaded({required this.lastRead});

  @override
  List<Object> get props => [lastRead];
}

class GetBookmarkError extends BookmarkState {
  final String error;

  const GetBookmarkError({required this.error});

  @override
  List<Object> get props => [error];
}
