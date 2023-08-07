part of 'add_event_bloc.dart';

@immutable
abstract class AddEventState extends Equatable {
  const AddEventState();
}

class AddEventInitial extends AddEventState {
  @override
  List<Object?> get props => [];

  const AddEventInitial();
}

class AddPageIsLoadingState extends AddEventState {
  final bool isLoading;
  @override
  List<Object?> get props => [];

  const AddPageIsLoadingState({required this.isLoading});
}


class DetailsErrorState extends AddEventState {
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];

  const DetailsErrorState(this.errorMessage);
}

class DetailsSuccessStoreState extends AddEventState {
  final String successMessage;

  @override
  List<Object> get props => [successMessage];

  const DetailsSuccessStoreState(this.successMessage);
}