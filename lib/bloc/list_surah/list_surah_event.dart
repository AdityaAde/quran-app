part of 'list_surah_bloc.dart';

abstract class ListSurahEvent extends Equatable {
  const ListSurahEvent();

  @override
  List<Object> get props => [];
}

class GetSurahEvent extends ListSurahEvent {}
