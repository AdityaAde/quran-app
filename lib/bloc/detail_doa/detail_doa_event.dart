part of 'detail_doa_bloc.dart';

abstract class DetailDoaEvent extends Equatable {
  const DetailDoaEvent();

  @override
  List<Object> get props => [];
}

class GetDetailDoaEvent extends DetailDoaEvent {
  final String id;

  const GetDetailDoaEvent({required this.id});
  @override
  List<Object> get props => [id];
}
