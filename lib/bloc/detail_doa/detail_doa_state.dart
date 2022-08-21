part of 'detail_doa_bloc.dart';

abstract class DetailDoaState extends Equatable {
  const DetailDoaState();

  @override
  List<Object> get props => [];
}

class DetailDoaLoading extends DetailDoaState {}

class DetailDoaLoaded extends DetailDoaState {
  final DetailDoaModels detailDoa;

  const DetailDoaLoaded({required this.detailDoa});

  @override
  List<Object> get props => [detailDoa];
}

class DetailDoaError extends DetailDoaState {
  final String error;

  const DetailDoaError({required this.error});

  @override
  List<Object> get props => [error];
}
