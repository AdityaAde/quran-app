part of 'doa_bloc.dart';

abstract class DoaState extends Equatable {
  const DoaState();

  @override
  List<Object> get props => [];
}

class DoaLoading extends DoaState {}

class DoaLoaded extends DoaState {
  final ListDoaModels listDoa;

  const DoaLoaded({required this.listDoa});
  @override
  List<Object> get props => [listDoa];
}

class DoaError extends DoaState {
  final String error;

  const DoaError({required this.error});

  @override
  List<Object> get props => [error];
}
