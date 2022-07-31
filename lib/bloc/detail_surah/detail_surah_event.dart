part of 'detail_surah_bloc.dart';

abstract class DetailSurahEvent extends Equatable {
  const DetailSurahEvent();

  @override
  List<Object> get props => [];
}

class GetDetailSurahEvent extends DetailSurahEvent {
  final String surahIndex;

  const GetDetailSurahEvent({required this.surahIndex});

  @override
  List<Object> get props => [surahIndex];
}
