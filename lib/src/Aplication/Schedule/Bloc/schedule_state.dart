part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleState extends Equatable{

  @override
  List<Object> get props => [];
   const ScheduleState();

}

abstract class ScheduleStateActionState extends ScheduleState{
  const ScheduleStateActionState();

}

class IsLoadingState extends ScheduleState {
  final bool isLoading;
  @override
  List<Object> get props => [isLoading];
  const IsLoadingState({required this.isLoading});

}

class ScheduleInitialState extends ScheduleState {

  @override
  List<Object> get props => [];
  const ScheduleInitialState();

}

class ScheduleErrorState extends ScheduleState {
  @override
  List<Object> get props => [];
  const ScheduleErrorState();
}

class ScheduleGetEventsState extends ScheduleState {
  final List<EventModel> events;
  final String dirPath;
  @override
  List<Object> get props => [events];
  const ScheduleGetEventsState({required this.events, required this.dirPath});
}


class ScheduleNavigatorForWatchState extends ScheduleStateActionState {
  @override
  List<Object> get props => [];
  const ScheduleNavigatorForWatchState();
}

class ScheduleNavigatorAddScreenState extends ScheduleStateActionState {
  final String dirPath;
  @override
  List<Object> get props => [dirPath];
  const ScheduleNavigatorAddScreenState({required this.dirPath});
}