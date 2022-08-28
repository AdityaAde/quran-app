part of 'tafsir_bloc.dart';

abstract class TafsirEvent extends Equatable {
  const TafsirEvent();

  @override
  List<Object> get props => [];
}

class GetTafsirEvent extends TafsirEvent {
  final String nomorSurah;

  const GetTafsirEvent({required this.nomorSurah});

  @override
  List<Object> get props => [nomorSurah];
}
