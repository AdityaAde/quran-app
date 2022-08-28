part of 'tafsir_bloc.dart';

abstract class TafsirState extends Equatable {
  const TafsirState();

  @override
  List<Object> get props => [];
}

class TafsirLoading extends TafsirState {}

class TafsirLoaded extends TafsirState {
  final TafsirAyahModels tafsir;

  const TafsirLoaded({required this.tafsir});

  @override
  List<Object> get props => [tafsir];
}

class TafsirError extends TafsirState {
  final String error;

  const TafsirError({required this.error});

  @override
  List<Object> get props => [error];
}
