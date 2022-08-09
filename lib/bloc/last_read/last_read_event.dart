part of 'last_read_bloc.dart';

abstract class LastReadEvent extends Equatable {
  const LastReadEvent();

  @override
  List<Object> get props => [];
}

class GetLastReadEvent extends LastReadEvent {}
