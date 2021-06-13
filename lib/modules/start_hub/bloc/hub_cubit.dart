import 'package:bloc/bloc.dart';
import 'package:moscow/domain/repositories/event.dart';
import 'package:moscow/modules/start_hub/bloc/hub_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this._repository) : super(EventStateInitial());

  EventRepository _repository;

  void loadEvents() async {
    emit(EventStateLoading());
    final events = await _repository.loadEvents();
    emit(EventStateLoaded(events));
  }
}
