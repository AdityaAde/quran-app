part of 'last_read_bloc.dart';

abstract class LastReadState extends Equatable {
  const LastReadState();

  @override
  List<Object> get props => [];
}

class LastReadLoading extends LastReadState {}

class LastReadLoaded extends LastReadState {
  final Map<String, dynamic> lastRead;

  const LastReadLoaded({required this.lastRead});
}

class LastReadError extends LastReadState {
  final String error;

  const LastReadError({required this.error});
}
