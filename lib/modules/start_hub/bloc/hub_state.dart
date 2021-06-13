import 'package:equatable/equatable.dart';
import 'package:moscow/domain/models/event.dart';

abstract class EventState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EventStateInitial extends EventState {}

class EventStateLoading extends EventState {}

class EventStateLoaded extends EventState {
  final List<Event> events;

  EventStateLoaded(this.events);

  @override
  List<Object?> get props => [events];
}
