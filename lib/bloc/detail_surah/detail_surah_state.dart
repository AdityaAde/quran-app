part of 'detail_surah_bloc.dart';

abstract class DetailSurahState extends Equatable {
  const DetailSurahState();

  @override
  List<Object> get props => [];
}

class DetailSurahLoading extends DetailSurahState {}

class DetailSurahLoaded extends DetailSurahState {
  final SurahDetailsModels surahDetailArabic;
  final SurahDetailsEnglishModels surahDetailEnglish;

  const DetailSurahLoaded({required this.surahDetailArabic, required this.surahDetailEnglish});

  @override
  List<Object> get props => [surahDetailArabic, surahDetailEnglish];
}

class DetailSurahError extends DetailSurahState {
  final String error;

  const DetailSurahError({required this.error});

  @override
  List<Object> get props => [error];
}
