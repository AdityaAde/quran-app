part of 'list_surah_bloc.dart';

abstract class ListSurahState extends Equatable {
  const ListSurahState();

  @override
  List<Object> get props => [];
}

class ListSurahLoading extends ListSurahState {}

class ListSurahLoaded extends ListSurahState {
  final SurahModels listSurah;

  const ListSurahLoaded({required this.listSurah});

  @override
  List<Object> get props => [listSurah];
}

class ListSurahError extends ListSurahState {
  final String error;

  const ListSurahError({required this.error});

  @override
  List<Object> get props => [error];
}
