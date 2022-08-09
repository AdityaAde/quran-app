part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class AddBookmarkEvent extends BookmarkEvent {
  final bool lastRead;
  final String namaSurah;
  final Ayat surah;
  final int indexAyat;
  final BuildContext context;

  const AddBookmarkEvent({
    required this.lastRead,
    required this.namaSurah,
    required this.surah,
    required this.indexAyat,
    required this.context,
  });

  @override
  List<Object> get props => [lastRead, namaSurah, surah, indexAyat, context];
}

class GetBookmarkEvent extends BookmarkEvent {}

class DeleteBookmarkEvent extends BookmarkEvent {
  final int id;

  const DeleteBookmarkEvent({required this.id});

  @override
  List<Object> get props => [id];
}
