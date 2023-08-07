part of 'add_event_bloc.dart';

@immutable
abstract class AddEventEvent extends Equatable {
  const AddEventEvent();
}

class CircleIndicatorEvent extends AddEventEvent {
  final bool isLoading;
  @override
  List<Object?> get props => [isLoading];
  const CircleIndicatorEvent({required this.isLoading});
}

class DetailsSaveEvent extends AddEventEvent {
  final String path;
  @override
  List<Object?> get props => [path];
  const DetailsSaveEvent({required this.path});
}
