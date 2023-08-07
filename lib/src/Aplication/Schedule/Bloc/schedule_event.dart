part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();
}


class IsLoadingEvents extends ScheduleEvent {
  @override
  List<Object?> get props => [];
}

class InitialEvents extends ScheduleEvent {
  @override
  List<Object?> get props => [];
}

class GetEventsEvent extends ScheduleEvent {
  final String dirPath;
  @override
  List<Object?> get props => [];
  const GetEventsEvent({required this.dirPath});
}


class WatchClickedNavEvent extends ScheduleEvent {
  @override
  List<Object?> get props => [];
}

class ClickedNavNextToScreenEvent extends ScheduleEvent {
  final String dirPath;
  @override
  List<Object?> get props => [];
  const ClickedNavNextToScreenEvent({required this.dirPath});
}


class SaveEvents extends ScheduleEvent {
  @override
  List<Object?> get props => [];
  const SaveEvents();
}
